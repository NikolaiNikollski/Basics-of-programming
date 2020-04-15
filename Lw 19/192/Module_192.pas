UNIT Module_192;

INTERFACE
  TYPE
    Month = (NoMonth, Jan, Feb, Mar, Apr, May, Jun,
                    Jul, Aug, Sep, Oct, Nov, Dec);
    DayNum = 0 .. 100000; {Verification in Procedure ReadDate}
    Date = RECORD
             Mo : Month;
             Day: DayNum
           END;
    FileOfDate = FILE OF Date;
  PROCEDURE ReadDate(VAR FIn: TEXT; VAR Result: Date);
  PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month);
  FUNCTION Less(VAR D1, D2: Date): BOOLEAN;
  PROCEDURE CopyOut(VAR DateFile: FileOfDate);
  PROCEDURE WriteDate(VAR FOut: TEXT; VAR Result: Date);
  PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month);

IMPLEMENTATION
  PROCEDURE ReadDate(VAR FIn: TEXT; VAR Result: Date);
    BEGIN {ReadDate}
      ReadMonth(FIn, Result.Mo);
      IF NOT EOLN(FIn)
      THEN
        READ(FIn, Result.Day);
      IF Result.Day > 31
      THEN
        Result.Day := 0;
    END; {ReadDate}

  PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month);
  VAR
    Ch1, Ch2, Ch3 : CHAR;
  BEGIN{ReadMonth}
    IF NOT EOLN(FIn)
    THEN
      READ(FIn, Ch1);
    IF NOT EOLN(FIn)
    THEN
      READ(FIn, Ch2)
    ELSE Mo := NoMonth;
    IF NOT EOLN(FIn)
    THEN
      BEGIN
        READ(FIn, Ch3);
        IF (Ch1 = 'J') AND (Ch2 = 'A') AND (Ch3 = 'N') THEN Mo := JAN ELSE
        IF (Ch1 = 'F') AND (Ch2 = 'E') AND (Ch3 = 'B') THEN Mo := FEB ELSE
        IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'R') THEN Mo := MAR ELSE
        IF (Ch1 = 'A') AND (Ch2 = 'P') AND (Ch3 = 'R') THEN Mo := APR ELSE
        IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'Y') THEN Mo := MAY ELSE
        IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'N') THEN Mo := JUN ELSE
        IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'L') THEN Mo := JUL ELSE
        IF (Ch1 = 'A') AND (Ch2 = 'U') AND (Ch3 = 'G') THEN Mo := AUG ELSE
        IF (Ch1 = 'S') AND (Ch2 = 'E') AND (Ch3 = 'P') THEN Mo := SEP ELSE
        IF (Ch1 = 'O') AND (Ch2 = 'C') AND (Ch3 = 'T') THEN Mo := OCT ELSE
        IF (Ch1 = 'N') AND (Ch2 = 'O') AND (Ch3 = 'V') THEN Mo := NOV ELSE
        IF (Ch1 = 'D') AND (Ch2 = 'E') AND (Ch3 = 'C') THEN Mo := DEC
        ELSE Mo := NoMonth
      END
    ELSE Mo := NoMonth
  END;{ReadMonth}

  FUNCTION Less(VAR D1, D2: Date): BOOLEAN;
  {Less:= D1 < D2}
  BEGIN {Less}
    IF D1.Mo < D2.Mo
    THEN
      Less := TRUE
    ELSE
      IF D1.Mo > D2.Mo
        THEN
          Less := FALSE
        ELSE {D1.Mo = D2.Mo}
          Less := (D1.Day < D2.Day)
  END; {Less}

  PROCEDURE CopyOut(VAR DateFile: FileOfDate);
  VAR
    VarDate: Date;
  BEGIN {CopyOut}
    WHILE NOT EOF(DateFile)
    DO
      BEGIN
        READ(DateFile, VarDate);
        WriteDate(OUTPUT, VarDate);
        WRITELN;
      END
  END;{CopyOut}

  PROCEDURE WriteDate(VAR FOut: TEXT; VAR Result: Date);
  BEGIN{WriteDate}
    WriteMonth(FOut, Result.Mo);
    WRITE(FOut, Result.Day:3)
  END;{WriteDate}

  PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month);
  VAR
    Ch1, Ch2, Ch3: CHAR;
  BEGIN {WriteMonth}
    IF Mo = Jan THEN WRITE('JAN') ELSE
    IF Mo = Feb THEN WRITE('FEB') ELSE
    IF Mo = Mar THEN WRITE('MAR') ELSE
    IF Mo = Apr THEN WRITE('APR') ELSE
    IF Mo = May THEN WRITE('MAY') ELSE
    IF Mo = Jun THEN WRITE('JUN') ELSE
    IF Mo = Jul THEN WRITE('JUL') ELSE
    IF Mo = Aug THEN WRITE('AUG') ELSE
    IF Mo = Sep THEN WRITE('SEP') ELSE
    IF Mo = Oct THEN WRITE('OCT') ELSE
    IF Mo = Nov THEN WRITE('NOV') ELSE
    IF Mo = Dec THEN WRITE('DEC')
    ELSE WRITE('NoMonth')
  END; {WriteMonth}
BEGIN
END.





