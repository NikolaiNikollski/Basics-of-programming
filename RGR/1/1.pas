PROGRAM CountWords(INPUT, OUTPUT);
USES WordModule, FileModule;
VAR
  Ch: CHAR;
  Lexeme: String;
  Root: Tree;

BEGIN
  ASSIGN(INPUT,'input.txt'); RESET(INPUT);
  ASSIGN(OUTPUT,'output.txt'); REWRITE(OUTPUT);
  Root := NIL;
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      ReadWord(INPUT, Lexeme);
      IF Lexeme <> ErrorString
      THEN
        Insert(Root, ToLower(Lexeme));
    END;
  PrintStat(Root);
  ClearTree(Root);
  WRITELN
END.



