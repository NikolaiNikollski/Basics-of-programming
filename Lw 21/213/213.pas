PROGRAM Decryption(INPUT, OUTPUT);
{��������� ������� �� INPUT � ��� �������� Chiper
  � �������� ����� ������� � OUTPUT}
CONST
  MaxLen = 20;
TYPE
  Str = ARRAY [1 .. MaxLen] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: 0 .. MaxLen;
  StrLen: 0 .. MaxLen;
  ValidCharSet: SET OF CHAR; //�����, � �������� ���� ����

PROCEDURE Initialize(VAR Code: Chiper);
{��������� Code ���� ������}
VAR
  ChiperFile: TEXT;
  Symbol, ChiperSymbol: CHAR;
BEGIN {Initialize}
  ASSIGN(ChiperFile, 'ChiperFile.txt'); //���� ������� '������''����'
  RESET(ChiperFile);
  WHILE NOT EOF(ChiperFile)
  DO
    BEGIN
      ChiperSymbol := '$';
      Symbol := '$';
      IF NOT EOLN(ChiperFile) THEN READ(ChiperFile, Symbol); //������ ������
      IF NOT EOLN(ChiperFile) THEN READ(ChiperFile, ChiperSymbol); //������ ����
      Code[ChiperSymbol] := Symbol;
      ValidCharSet := ValidCharSet + [ChiperSymbol];
      READLN(ChiperFile)
    END
END;  {Initialize}

PROCEDURE Decode(VAR S: Str; StrLen: INTEGER);
{������� ������� �� Code, ��������������� �������� �� S}
VAR
  Index: 1 .. MaxLen;
BEGIN {Decode}
  FOR Index := 1 TO StrLen
  DO
    IF S[Index] IN ValidCharSet
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Decode}

BEGIN {Decryption}
  {���������������� Code}
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      {������ ������ � Msg � ����������� ��}
      I := 0;
      WHILE NOT EOLN AND (I < MaxLen)
      DO
        BEGIN
          I := I + 1;
          READ(Msg[I]);
          WRITE(Msg[I])
        END;
      READLN;
      WRITELN;
      StrLen := I;
      {����������� ������������ ���������}
      Decode(Msg, StrLen)
    END
END.  {Decryption}

