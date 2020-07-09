UNIT WordModule;
INTERFACE
  CONST
    Lowcase = ['a' .. 'z', 'а' .. 'я', 'Ё'];
    Uppercase = ['A' .. 'Z', 'А' .. 'Я', 'ё'];
    MaxLengthWord = 50;
    ErrorMarker = '&';
    ErrorString = 'ErrorString';
    LowcaseConst = 32;

  PROCEDURE CheckSymbol(Var Ch: CHAR);
  PROCEDURE ReadFirstCharacter(VAR InFile: TEXT; VAR Ch: CHAR);
  PROCEDURE ReadWord(VAR InFile: TEXT; VAR Lexeme: STRING);
  FUNCTION ToLower(InStr: STRING): STRING;

IMPLEMENTATION

  PROCEDURE CheckSymbol(Var Ch: CHAR);
  BEGIN
    IF (Ch = 'ё') OR (Ch  = 'Ё')
    THEN
      Ch := 'е'
  END;

  PROCEDURE ReadFirstCharacter(VAR InFile: TEXT; VAR Ch: CHAR);
  VAR TempCh: CHAR;
  BEGIN {ReadFirstCharacter}
    Ch := ErrorMarker;
    WHILE NOT EOF(InFile)
    DO
      BEGIN
        WHILE NOT EOLN(InFile)
        DO
          BEGIN
            READ(InFile, TempCh);
            IF TempCh IN lowcase + Uppercase
            THEN
              BEGIN
                CheckSymbol(TempCh);
                Ch := TempCh;
                EXIT
              END
          END;
        IF NOT EOF THEN READLN(InFile)
      END
  END; {ReadFirstCharacter}

  PROCEDURE ReadWord(VAR InFile: TEXT; VAR Lexeme: STRING);
  VAR
    Ch: CHAR;
  BEGIN  {ReadWord}
    Lexeme := ErrorString;
    ReadFirstCharacter(InFile, Ch);
    IF Ch <> ErrorMarker
    THEN
      BEGIN
        Lexeme := Ch;
        WHILE NOT EOLN(InFile)
        DO
          BEGIN
            READ(Infile, Ch);
            IF Ch IN Lowcase + Uppercase
            THEN
              BEGIN
                CheckSymbol(Ch);
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

  FUNCTION ToLower(InStr: STRING): STRING;
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
