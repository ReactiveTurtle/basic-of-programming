PROGRAM XPrint(INPUT, OUTPUT);  
VAR
  Ch: CHAR;

PROCEDURE PrintSymbol(VAR Ch: CHAR);
CONST
  LineSize = 5;
  Min = 1;
  Max = 25;
  Space = ' ';
  Painter = 'X';
VAR
  Symbol: SET OF Min..Max;
  I: INTEGER;
BEGIN
  Symbol := [];  
  CASE Ch OF
    'A': Symbol := [3, 7, 9, 12, 13, 14, 16, 20, 21, 25]; 
    'B': Symbol := [1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 22, 23, 24, 25];
    'C': Symbol := [1, 2, 3, 4, 5, 6, 11, 16, 21, 22, 23, 24, 25];
    'D': Symbol := [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];
    'E': Symbol := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 16, 21, 22, 23, 24, 25];
    'F': Symbol := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 16, 21];
    'G': Symbol := [1, 2, 3, 4, 5, 6, 11, 14, 15, 16, 20, 21, 22, 23, 24, 25];
    'H': Symbol := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
    'I': Symbol := [1, 2, 3, 4, 5, 8, 13, 18, 21, 22, 23, 24, 25];
    'J': Symbol := [1, 2, 3, 4, 5, 8, 13, 16, 18, 21, 22, 23];
    'K': Symbol := [1, 5, 6, 9, 11, 12, 16, 19, 21, 25];
    'L': Symbol := [1, 6, 11, 16, 21, 22, 23, 24, 25];   
    'M': Symbol := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
    'N': Symbol := [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];
    'O': Symbol := [1, 2, 3, 4, 5, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24, 25];
    'P': Symbol := [1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16, 21];
    'Q': Symbol := [2, 3, 4, 6, 10, 11, 15, 17, 18, 19, 24, 25];
    'R': Symbol := [1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 16, 19, 21, 25];
    'S': Symbol := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 20, 21, 22, 23, 24, 25];
    'T': Symbol := [1, 2, 3, 4, 5, 8, 13, 18, 23];
    'U': Symbol := [1, 5, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24, 25];
    'V': Symbol := [1, 5, 6, 10, 11, 15, 17, 19, 23];
    'W': Symbol := [1, 5, 6, 10, 11, 13, 15, 16, 17, 19, 20, 21, 25];
    'X': Symbol := [1, 5, 7, 9, 13, 17, 19, 21, 25];
    'Y': Symbol := [1, 5, 7, 9, 13, 18, 23];
    'Z': Symbol := [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25];
  END;
  CASE Ch OF
    'A'..'Z': 
      FOR I := Min TO Max
      DO
        BEGIN
          IF I IN Symbol
          THEN
            WRITE(Painter)
          ELSE
            WRITE(Space);
          IF I MOD LineSize = (Min - 1)
          THEN
            WRITELN
         END
      ELSE
        WRITELN('Symbol scheme not found')
  END
END;

BEGIN
  WRITE('Print symbol: ');
  IF NOT EOLN(INPUT)
  THEN
    BEGIN
      READ(Ch);
      PrintSymbol(Ch);
    END
END.  
