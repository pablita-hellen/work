* Encoding: UTF-8.
DO IF hdl=0.
  compute hdlc='F'.
ELSE IF hdl<40.
  compute hdlc='S'.
ELSE. 
  compute hdlc='N'.
END IF.
