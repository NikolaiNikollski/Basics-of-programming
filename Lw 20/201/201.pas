
PROGRAM PseudoGraphicPrinter(INPUT, OUTPUT);
CONST
  Code_0 = [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24]; {»нициализаци¤}
  Code_1 = [3, 7, 8, 11, 13, 18, 21, 22, 23, 24, 25];
  Code_2 = [2, 3, 4, 9, 12, 13, 14, 17, 22, 23, 24];
  Code_3 = [2, 3, 4, 7, 12, 13, 14, 17, 22, 23, 24];
  Code_4 = [1, 4, 6, 9, 11, 12, 13, 14, 19, 24];
  Code_5 = [2, 3, 4, 7, 12, 13, 14, 19, 22, 23, 24];
  Code_6 = [1, 2, 3, 4, 6, 11, 12, 13, 14, 16, 19, 21, 22, 23, 24];
  Code_7 = [1, 2, 3, 4, 9, 14, 19, 24];
  Code_8 = [2, 3, 4, 6, 10, 12, 13, 14, 16, 20, 22, 23, 24];
  Code_9 = [1, 2, 3, 4, 6, 9, 11, 12, 13, 14, 19, 21, 22, 23, 24];
  Mark = 'X';
  Space = ' ';
  FirstPos = 1;
  LastPos = 25;
  EndLinePos = [5, 10, 15, 20, 25];  //позиции, после которых необходимо поставить маркер конца строки
TYPE
  CodeSet = SET OF FirstPos .. LastPos;
VAR
  Ch: CHAR;

PROCEDURE Print(Code: CodeSet);
VAR
  I: INTEGER;
BEGIN
  FOR I := FirstPos TO LastPos
  DO
    BEGIN
      IF (I IN Code)
      THEN
        WRITE(Mark)
      ELSE
        WRITE(Space);
      IF (I IN EndLinePos)
      THEN
        WRITELN;
    END
END;

BEGIN
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      CASE Ch OF
        '0': Print(Code_0);
        '1': Print(Code_1);
        '2': Print(Code_2);
        '3': Print(Code_3);
        '4': Print(Code_4);
        '5': Print(Code_5);
        '6': Print(Code_6);
        '7': Print(Code_7);
        '8': Print(Code_8);
        '9': Print(Code_9)
      END;
    END
END.










