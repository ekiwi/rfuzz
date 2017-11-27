use super::buffered::{ CommunicationBuffer, CommunicationChannel };
use super::pynq;

pub struct DmaChannel {
	dma: pynq::Dma,
	busy: bool
}

#[derive(Clone, Copy, PartialEq, Debug)]
pub struct DmaChannelToken { tx: pynq::DmaBufferId, rx: pynq::DmaBufferId }

impl CommunicationChannel for DmaChannel {
	type BufferT = pynq::DmaBuffer;
	type TokenT = DmaChannelToken;
	fn get_token(tx: &Self::BufferT, rx: &Self::BufferT) -> Self::TokenT {
		DmaChannelToken { tx: tx.id(), rx: rx.id() }
	}
	fn alloc(&mut self, size: usize) -> Self::BufferT {
		let buf = pynq::DmaBuffer::allocate(size);
		//println!("DMA: new buf: {:?}", buf.id());
		buf
	}
	fn try_send(&mut self, token: Self::TokenT, tx_bytes: usize, rx_bytes: usize) -> Result<(), ()> {
		if self.is_busy() { Err(()) } else {
			self.send(token, tx_bytes, rx_bytes);
			Ok(())
		}
	}
	fn try_receive(&mut self) -> Option<Self::TokenT> {
		if self.is_busy() && self.is_dma_done() {
			let tx = self.dma.finish_send();
			let rx = self.dma.finish_receive();
			let token = DmaChannelToken { tx, rx };
			self.busy = false;
			//println!("DMA Channel: received back buffers: {:?}", token);
			Some(token)
		} else { None }
	}
	/// blocking receive, will panic if nothing was sent
	fn receive(&mut self) -> Self::TokenT {
		assert!(self.is_busy(), "empty channel!");
		//println!("DMA Channel: going to wait for DMA to finish.");
		while !self.is_dma_done() {}
		self.try_receive().unwrap()
	}
}

impl DmaChannel {
	pub fn connect() -> Self {
		let dma = pynq::Dma::get();
		let busy = false;
		//println!("DMA Channel connected!");
		DmaChannel { dma, busy }
	}
	fn is_busy(&self) -> bool { self.busy }
	fn is_dma_done(&mut self) -> bool {
		self.dma.is_send_done() && self.dma.is_receive_done()
	}
	/// blocking send
	fn send(&mut self, token: DmaChannelToken, tx_bytes: usize, rx_bytes: usize) {
		assert!(!self.is_busy(), "Dma is busy!");
		self.dma.start_send(token.tx, tx_bytes as u32);
		self.dma.start_receive(token.rx, rx_bytes as u32);
		self.busy = true;
		//println!("DMA Channel: start send of {:?}", token);
		//println!("DMA Channel: tx bytes: {}", tx_bytes);
		//println!("DMA Channel: rx bytes: {}", rx_bytes);
	}
}
