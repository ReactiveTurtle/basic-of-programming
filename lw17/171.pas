PROGRAM Digits(INPUT, OUTPUT);

VAR
  Sum, Tmp: INTEGER;

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

BEGIN
  Sum := 0;
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      ReadDigit(INPUT, Tmp);
      IF Tmp <> -1
      THEN
        Sum := Sum + Tmp
    END;
  WRITELN(Sum)
END.
