PROGRAM Digits(INPUT, OUTPUT);

VAR
  Number: INTEGER;

PROCEDURE CharToDigit(VAR Ch: CHAR; VAR Result: INTEGER);
BEGIN
  IF (Ch = '0') THEN Result := 0
  ELSE IF (Ch = '1') THEN Result := 1
  ELSE IF (Ch = '2') THEN Result := 2
  ELSE IF (Ch = '3') THEN Result := 3
  ELSE IF (Ch = '4') THEN Result := 4
  ELSE IF (Ch = '5') THEN Result := 5
  ELSE IF (Ch = '6') THEN Result := 6
  ELSE IF (Ch = '7') THEN Result := 7
  ELSE IF (Ch = '8') THEN Result := 8
  ELSE IF (Ch = '9') THEN Result := 9
  ELSE Result := -1
END;

PROCEDURE ReadDigit(VAR Src: TEXT; VAR Result: INTEGER);
VAR
  Ch: CHAR;
BEGIN
  IF EOLN(Src)
  THEN
    Result := -1
  ELSE
    BEGIN
      READ(Src, Ch);
      CharToDigit(Ch, Result)
    END
END;

PROCEDURE ReadNumber(VAR Src: TEXT; VAR Number: INTEGER);
VAR
  I, Digit: INTEGER;
  IsOverflow: BOOLEAN;
  NumberState: CHAR;
BEGIN
  I := 0;
  Number := 0;
  IsOverflow := FALSE;
  NumberState := 'S';
  WHILE NOT EOLN(Src) AND NOT IsOverflow AND (NumberState <> 'E')
  DO
    BEGIN
      ReadDigit(Src, Digit);
      IF (NumberState = 'S') AND (Digit <> -1)
      THEN
        NumberState := 'F';
        
      IF (NumberState = 'F') AND (Digit = -1)
      THEN
        NumberState := 'E';
        
      IF NumberState = 'F'
      THEN
        BEGIN      
          I := I + 1;
          IF (I < 5) OR ((I = 5) AND ((Number DIV 10) <= (MAXINT DIV 10)) AND (Digit <= 7))
          THEN
            Number := Number * 10 + Digit
          ELSE
            BEGIN
              IsOverflow := TRUE;
              Number := -1
            END
        END
    END
END;

BEGIN
  ReadNumber(INPUT, Number);
  WRITELN(Number)
END.
