use super::buffered::{ CommunicationBuffer, CommunicationChannel };
use super::pynq;

pub struct DmaChannel {
	dma: pynq::Dma,
	busy: bool
}

#[derive(Clone, Copy, PartialEq)]
pub struct DmaChannelToken { tx: pynq::DmaBufferId, rx: pynq::DmaBufferId }

impl CommunicationChannel for DmaChannel {
	type BufferT = pynq::DmaBuffer;
	type TokenT = DmaChannelToken;
	fn get_token(tx: &Self::BufferT, rx: &Self::BufferT) -> Self::TokenT {
		DmaChannelToken { tx: tx.id(), rx: rx.id() }
	}
	fn alloc(&mut self, size: usize) -> Self::BufferT {
		pynq::DmaBuffer::allocate(size)
	}
	fn try_send(&mut self, token: Self::TokenT) -> Result<(), ()> {
		if self.is_busy() { Err(()) } else {
			self.send(token);
			Ok(())
		}
	}
	/// blocking send
	fn send(&mut self, token: Self::TokenT) {
		assert!(!self.is_busy(), "Dma is busy!");
		self.dma.start_send(token.tx);
		self.dma.start_receive(token.rx);
		self.busy = true;
	}
	fn try_receive(&mut self) -> Option<Self::TokenT> {
		if self.is_busy() && self.is_dma_done() {
			let tx = self.dma.finish_send();
			let rx = self.dma.finish_receive();
			Some(DmaChannelToken { tx, rx })
		} else { None }
	}
	/// blocking receive, will panic if nothing was sent
	fn receive(&mut self) -> Self::TokenT {
		assert!(self.is_busy(), "empty channel!");
		while !self.is_dma_done() {}
		self.try_receive().unwrap()
	}
}

impl DmaChannel {
	pub fn connect() -> Self {
		let dma = pynq::Dma::get();
		let busy = false;
		DmaChannel { dma, busy }
	}
	fn is_busy(&self) -> bool { self.busy }
	fn is_dma_done(&mut self) -> bool {
		self.dma.is_send_done() && self.dma.is_receive_done()
	}
}
