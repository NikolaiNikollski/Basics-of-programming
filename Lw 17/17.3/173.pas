PROGRAM Stat(INPUT, OUTPUT);
VAR
  N, Min, Max, Sum, Counter, D, MaxInt: INTEGER;
  Ch: CHAR;
  OverFlow: BOOLEAN;
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
    END;
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
  
BEGIN {Stat}
  OverFlow := FALSE;
  MaxInt := 10000;
  WRITELN('Enter numbers with a space, for example:');
  WRITELN('-5 100 0');
  WRITELN('WARNING: Incorrect characters the program takes as 0');
  WRITELN('WARNING: There is a limitation ', MaxInt, ', so value more then ', MaxInt, ' and value less then ', -MaxInt, ' the program takes as -1');
  ReadNumber(INPUT, N, MaxInt);
  WRITE('You entered: ', N);
  Sum := N;
  Counter := 1;
  Min := N;
  Max := N;
  WHILE (NOT EOLN(INPUT))
  DO
    BEGIN
      ReadNumber(INPUT, N, MaxInt);
      WRITE(' ', N);
      IF (N < Min)
      THEN
        Min := N;
      IF (N > Max)
      THEN
        Max := N;
      IF ((Sum + N) > MaxInt) OR ((Sum + N) < -MaxInt)
      THEN
        OverFlow := TRUE
      ELSE
        IF NOT OverFlow
        THEN
          BEGIN
            Sum := Sum + N;
            Counter := Counter + 1;
          END
    END;
  WRITELN;       
  WRITELN('Smallest number: ', Min);
  WRITELN('Highest number: ', Max);
  IF OverFlow
  THEN
    WRITELN('Average: OverFlow')
  ELSE
    WRITELN('Average: ', (Sum DIV Counter), ',', ((ABS(Sum MOD Counter)) * 100 DIV Counter));
END. {Stat}
