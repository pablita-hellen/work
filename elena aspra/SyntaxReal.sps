* Encoding: UTF-8.
DO IF tg=0.
  compute tgc='F'.
ELSE IF tg<=77.
  compute tgc='N'.
ELSE.  
    compute tgc='C'.
 END IF.
 
