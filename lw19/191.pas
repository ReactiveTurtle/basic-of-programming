PROGRAM Prime(INPUT, OUTPUT);
CONST  
  MIN = 2;
  MAX = 100;
VAR
  Sieve: SET OF MIN .. MAX;
  Counter, Num, Check: INTEGER;
BEGIN {Prime}
  Sieve := [MIN .. MAX];
  Counter := MIN;
  WHILE Counter <= MAX
  DO
    BEGIN
      Num := Counter;
      IF (Num IN Sieve)
      THEN
        BEGIN
          Check := Num;
          WRITE(Counter, '  ');
        END; 
      WHILE (Num <= MAX)
      DO
        BEGIN
          IF (Num MOD Counter = 0)
          THEN
            Sieve := Sieve - [Num];
          Num := Num + Check 
        END;      
    Counter := Counter + 1  
  END;
  WRITELN                   
END. {Prime}  
