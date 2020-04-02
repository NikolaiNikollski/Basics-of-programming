PROGRAM TestOfReadNumber(INPUT, OUTPUT);
VAR
  N: INTEGER;
PROCEDURE ReadDigitOrMinus(VAR F: TEXT; VAR D: INTEGER; VAR Minus: BOOLEAN);
VAR
  Ch: CHAR;
BEGIN {ReadDigitOrMinus}
  D := -1;
  IF (NOT EOLN(F)) 
  THEN
    BEGIN
      Minus := FALSE;
      READ(F, Ch);
      IF (Ch = '0') THEN D := 0 ELSE
      IF (Ch = '1') THEN D := 1 ELSE
      IF (Ch = '2') THEN D := 2 ELSE
      IF (Ch = '3') THEN D := 3 ELSE
      IF (Ch = '4') THEN D := 4 ELSE
      IF (Ch = '5') THEN D := 5 ELSE
      IF (Ch = '6') THEN D := 6 ELSE
      IF (Ch = '7') THEN D := 7 ELSE
      IF (Ch = '8') THEN D := 8 ELSE
      IF (Ch = '9') THEN D := 9 ELSE
      IF (Ch = '-') THEN Minus := TRUE
    END
END; {ReadDigitOrMinus}

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR
  D: INTEGER;
  OverFlow: BOOLEAN;
  Minus: BOOLEAN;
  Void: BOOLEAN;
BEGIN {ReadNumber}
  OverFlow := FALSE;
  N := 0;
  ReadDigitOrMinus(INPUT, D, Minus);
  IF Minus
  THEN
    D := 0;
  WHILE (D <> -1) AND NOT (OverFlow)
  DO
    BEGIN
      IF (N * 10 + D > MAXINT) OR (N * 10 + D < 0) OR (N > (MAXINT DIV 10) +1)
      THEN
        BEGIN
          Overflow := TRUE;
          N := -1;
        END
      ELSE
        N := N * 10 + D;
      ReadDigitOrminus(INPUT, D, Void)
    END;
  IF Minus AND NOT (OverFlow)
  THEN
    N := -N
END; {ReadNumber}
  
BEGIN {TestOfReadNumber}
  ReadNumber(INPUT, N);
  WRITELN(N)
END. {TestOfReadNumber}
