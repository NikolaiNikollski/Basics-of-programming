PROGRAM SortMonth(INPUT, OUTPUT);
USES DateIO;
VAR
  Mo1, Mo2: Month;
BEGIN {SortMonth}
  WRITELN('¬ведите название первого мес€ца:');
  ReadMonth(INPUT, Mo1);
  READLN;
  WRITELN('¬ведите название второго мес€ца:');
  ReadMonth(INPUT, Mo2);
  IF (Mo1 = NoMonth) OR (Mo2 = NoMonth)
  THEN
    WRITELN('ƒанные не корректны')
  ELSE
    IF (Mo1 = Mo2)
    THEN
      BEGIN
        WRITE('ќба мес€ца ');
        WriteMonth(OUTPUT, Mo2);
        WRITELN
      END
    ELSE
      BEGIN      
        WriteMonth(OUTPUT, Mo1);
        IF Mo1 < Mo2
        THEN
          WRITE(' ѕредшествует ')
        ELSE
          WRITE(' —ледует за ');
        WriteMonth(OUTPUT, Mo2);
        WRITELN
      END
END. {SortMonth}
