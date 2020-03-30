PROGRAM TestDateIO(INPUT, OUTPUT);
USES DateIO;
VAR
  Mo: Month;
BEGIN {SortMonth}
  Mo := JUN;
  ReadMonth(INPUT, Mo);
  WriteMonth(OUTPUT, Mo);
  WRITELN
END. {SortMonth}
