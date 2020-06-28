PROGRAM CountWords(INPUT, OUTPUT);
USES WordModule;
VAR
  Ch: CHAR;
  Lexeme: String;

BEGIN
  ASSIGN(INPUT,'input.txt'); RESET(INPUT);
  ASSIGN(OUTPUT,'output.txt'); REWRITE(OUTPUT);
  WHILE NOT EOF
  DO
    BEGIN
      ReadWord(INPUT, Lexeme);
      IF Lexeme <> ErrorString
      THEN
        WRITELN(ToLower(Lexeme));
    END;


END.



