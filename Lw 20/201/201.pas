PROGRAM PseudoGraphicPrinter(INPUT, OUTPUT);
CONST
  Code_0 = [2, 3, 4, 7, 9, 12, 14, 17, 19, 22, 23, 24]; {�������������}
  Code_1 = [4, 9, 14, 19, 24];
  Code_2 = [2, 3, 4, 9, 12, 13, 14, 17, 22, 23, 24];
  Code_3 = [2, 3, 4, 9, 12, 13, 14, 19, 22, 23, 24];
  Code_4 = [2, 4, 7, 9, 12, 13, 14, 19, 24];
  Code_5 = [2, 3, 4, 7, 12, 13, 14, 19, 22, 23, 24];
  Code_6 = [2, 3, 4, 7, 12, 13, 14, 17, 19, 22, 23, 24];
  Code_7 = [2, 3, 4, 9, 14, 19, 24];
  Code_8 = [2, 3, 4, 7, 9, 12, 13, 14, 17, 19, 22, 23, 24];
  Code_9 = [2, 3, 4, 7, 9, 12, 13, 14, 19, 22, 23, 24];
  Mark = 'X';
  Space = ' ';
  FirstPos = 1;
  LastPos = 25;
  EndLinePos = [5, 10, 15, 20, 25];  //�������, ����� ������� ���������� ��������� ������ ����� ������
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
      WRITE(I); {!!}
      IF (I IN Code)
      THEN
      //  WRITE(Mark)
      ELSE
       // WRITE(Space);
      IF (I IN EndLinePos)
      THEN
       // WRITELN
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
      END
    END
END.





