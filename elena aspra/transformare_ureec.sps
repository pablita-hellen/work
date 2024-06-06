* Encoding: UTF-8.
DO IF uree=0.
  compute ureec='F'.
ELSE IF uree<8.
  compute ureec='S'.
ELSE IF uree<=24.
  compute ureec='N'.
ELSE. 
  compute ureec='C'.
END IF.
