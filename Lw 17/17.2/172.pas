PROGRAM TestOfReadNumber(INPUT, OUTPUT);
VAR
  N, MaxInt: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  D := -1;
  IF (NOT EOLN(F)) 
  THEN
    BEGIN
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
      IF (Ch = '9') THEN D := 9
    END;
END; {ReadDigit}

PROCEDURE ReadDigitOrMinus(VAR F: TEXT; VAR D: INTEGER; VAR Minus: BOOLEAN);
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  D := -1;
  Minus := FALSE;
  IF (NOT EOLN(F)) 
  THEN
    BEGIN
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
END; {ReadDigit}

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER; VAR MaxInt: INTEGER);
VAR
  D: INTEGER;
  OverFlow: BOOLEAN;
  Minus: BOOLEAN;
BEGIN {ReadNumber}
  OverFlow := FALSE;
  N := 0;
  ReadDigitOrMinus(INPUT, D, Minus);
  IF Minus
  THEN
    D := 0;
  WHILE (D <> -1) AND NOT(OverFlow)
  DO
    BEGIN
      IF (N * 10 + D <= MaxInt)
      THEN
        N := N * 10 + D
      ELSE
        BEGIN
          Overflow := TRUE;
          N := -1;
        END;
      ReadDigit(INPUT, D)
    END;
  IF Minus AND NOT (OverFlow)
  THEN
    N := -N
END; {ReadNumber}
  
BEGIN {TestOfReadNumber}
  Maxint := 10000;
  ReadNumber(INPUT, N, MaxInt);
  WRITELN(N)
END. {TestOfReadNumber}
