# FPGA Test Harness

Tested on a PYNQ board using the standard SD-Card image v2
on `2017-11-06` @ `189864f9febf8a05e44f9c486ac1863c2676fdd9`.

On the host computer:

```
> make
> scp scp system.bit system.tcl pynq:~
```

On the PYNQ target via `ssh`:

```
> sudo ipython3
In [1]: import numpy as n
In [2]: from pynq import Xlnk, Overlay
In [3]: xlnk = Xlnk()
In [4]: ov = Overlay('/home/xilinx/system.bit')
In [5]: def send(vals):
   ...:     in_buffer = xlnk.cma_array(shape=(len(vals),), dtype=np.uint64)
   ...:     for vv,ii in zip(vals,range(len(vals))): in_buffer[ii] = vv
   ...:     dma = ov.axi_dma_0
   ...:     dma.sendchannel.transfer(in_buffer)
   ...:     dma.sendchannel.wait()
In [6]: def recv(count):
   ...:     out_buffer = xlnk.cma_array(shape=(count,), dtype=np.uint64)
   ...:     dma = ov.axi_dma_0
   ...:     dma.recvchannel.transfer(out_buffer)
   ...:     dma.recvchannel.wait()
   ...:     return out_buffer
In [7]: d0 = (400 << 32) | 100
In [8]: d1 = 1 << 63 | 1 << 62
In [9]: payload = [0x19931993 << 32 | 1 << 16 | 3, 0x12345678, d0, d1, d0, d1, d0, d1]
In [10]: send(payload)
In [13]: recv(3)
Out[13]: ContiguousArray([         305419896, 216176080698999555, 3298534883328], dtype=uint64)
In [14]: "{:x}".format(305419896)
Out[14]: '12345678'
In [15]: "{:x}".format(216176080698999555)
Out[15]: '300030003000303'
In [16]: "{:x}".format(3298534883328)
Out[16]: '30000000000'
```

This matches the expected values tested in our unittest!
