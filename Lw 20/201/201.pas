PROGRAM PseudoGraphicPrinter(INPUT, OUTPUT);
TYPE
  CharacterCode = SET OF 0 .. 25;
VAR
  Code_0: CharacterCode;
  Code_1: CharacterCode;
  Code_2: CharacterCode;
  Code_3: CharacterCode;
  Code_4: CharacterCode;
  Code_5: CharacterCode;
  Code_6: CharacterCode;
  Code_7: CharacterCode;
  Code_8: CharacterCode;
  Code_9: CharacterCode;
  Ch: CHAR;

PROCEDURE Print(VAR Code: CharacterCode);
VAR
  I: INTEGER;
BEGIN
  FOR I := 1 TO 25
  DO
    BEGIN
      IF (I IN Code)
      THEN
        WRITE('X')
      ELSE
        WRITE(' ');
      IF ((I MOD 5) = 0)
      THEN
        WRITELN
    END
END;

BEGIN
  Code_0 := [2, 3, 4, 7, 9, 12, 14, 17, 19, 22, 23, 24]; {Инициализация}
  Code_1 := [4, 9, 14, 19, 24];
  Code_2 := [2, 3, 4, 9, 12, 13, 14, 17, 22, 23, 24];
  Code_3 := [2, 3, 4, 9, 12, 13, 14, 19, 22, 23, 24];
  Code_4 := [2, 4, 7, 9, 12, 13, 14, 19, 24];
  Code_5 := [2, 3, 4, 7, 12, 13, 14, 19, 22, 23, 24];
  Code_6 := [2, 3, 4, 7, 12, 13, 14, 17, 19, 22, 23, 24];
  Code_7 := [2, 3, 4, 9, 14, 19, 24];
  Code_8 := [2, 3, 4, 7, 9, 12, 13, 14, 17, 19, 22, 23, 24];
  Code_9 := [2, 3, 4, 7, 9, 12, 13, 14, 19, 22, 23, 24];
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
      WRITELN
    END
END.





