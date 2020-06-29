UNIT WordModule;
INTERFACE
  CONST
    RusAlphabet = ['�' .. '�', '�' .. '�'];
    EngAlphabet = ['a' .. 'z', 'A' .. 'Z'];
    Uppercase = ['�' .. '�', 'A' .. 'Z'];
    MaxLengthWord = 50;
    ErrorMarker = '&';
    ErrorString = 'ErrorString';
    LowcaseConst = 32;

  PROCEDURE ReadFirstCharacter(VAR InFile: TEXT; VAR Ch: CHAR);
  PROCEDURE ReadWord(VAR InFile: TEXT; VAR Lexeme: STRING);
  FUNCTION ToLower(VAR InStr: STRING): STRING;

IMPLEMENTATION

  PROCEDURE ReadFirstCharacter(VAR InFile: TEXT; VAR Ch: CHAR);
  BEGIN {ReadFirstCharacter}
    Ch := ErrorMarker;
    WHILE NOT EOF(InFile)
    DO
      BEGIN
        WHILE NOT EOLN(InFile)
        DO
          BEGIN
            READ(InFile, Ch);
            IF Ch IN RusAlphabet + EngAlphabet
            THEN
              EXIT
          END;
         READLN(InFile)
      END
  END; {ReadFirstCharacter}

  PROCEDURE ReadWord(VAR InFile: TEXT; VAR Lexeme: STRING);
  VAR
    Ch: CHAR;
  BEGIN  {ReadWord}
    Lexeme := ErrorString;
    ReadFirstCharacter(InFile, Ch);
    IF Ch = ErrorMarker
    THEN
      EXIT
    ELSE
      BEGIN
        Lexeme := Ch;
        WHILE NOT EOLN(InFile)
        DO
          BEGIN
            READ(Infile, Ch);
            IF Ch IN RusAlphabet + EngAlphabet
            THEN
              BEGIN
                Lexeme := Lexeme + Ch;
                IF LENGTH(lexeme) > MaxLengthWord
                THEN
                  EXIT
              END
            ELSE
              EXIT
          END
      END
  END; {ReadWord}

  FUNCTION ToLower(VAR InStr: STRING): STRING;
  VAR
    Ch: CHAR;
    I: INTEGER;
  BEGIN {ToLower}
    ToLower := '';
    FOR I := 1 TO LENGTH(InStr)
    DO
      BEGIN
        IF InStr[I] IN Uppercase
        THEN
          ToLower := ToLower + CHR(ORD(InStr[I]) + LowcaseConst)
        ELSE
          ToLower := ToLower + InStr[I]
      END
   END; {ToLower}

BEGIN {WordModule}
END. {WordModule}





















BEGIN
END.

