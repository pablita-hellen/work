* Encoding: UTF-8.
DO IF imc<18.5.
 compute imcc='Sub'.
ELSE IF imc<25.
 compute imcc='Normal'.
ELSE IF imc<30.
  compute imcc='Supra'.
ELSE IF imc<35.
  compute imcc='Grad1'.
ELSE IF imc<40.
  compute imcc='Grad2'.
ELSE.  
    compute imcc='Grad3'.
END IF.
