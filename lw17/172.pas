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
  I, Digit, PreviousDigit: INTEGER;
  IsOverflow: BOOLEAN;
BEGIN
  I := 0;
  Number := 0;
  IsOverflow := FALSE;
  PreviousDigit := -1;
  Digit := -1;
  WHILE NOT EOLN(Src) AND (NOT IsOverflow) AND NOT ((Digit = -1) AND (PreviousDigit <> -1))
  DO
    BEGIN
      PreviousDigit := Digit;
      ReadDigit(Src, Digit);
      IF Digit <> -1
      THEN
        BEGIN      
          I := I + 1;
          // В лекции было максимальное значение Integer 38767, а здесь MAXINT показывает 2147483647 
          // поэтому я взял 38767
          // I < 5 - Если количество разрядов в числе меньше чем в MAXINT. В данном случае 5.
          // Если количество разрядов I = 5, то нужно насторожиться и проверить дополнительно.
          IF (I < 5) OR ((I = 5) AND (Number <= 38767 DIV 10) AND (Digit <= 38767 MOD ((38767 DIV 10) * 10)))
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
