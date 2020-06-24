PROGRAM Encryption(INPUT, OUTPUT);
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
 
BEGIN {Initialize}
  ASSIGN(ChiperFile, 'ChiperFile.txt'); //���� ������� '������'-'����'
  RESET(ChiperFile);
  WHILE NOT EOF(ChiperFile)
  DO
    BEGIN
      READ(ChiperFile, Simbol); //������ ������
      READ(ChiperFile, ChiperSymbol); //������ ����
      READ(ChiperFile, ChiperSymbol); //������ ����
      Code[Simbol] := ChiperSymbol;
    END 
  
  {Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
  CODE[' '] := 'D'; //������   }
END;  {Initialize}
 
PROCEDURE Encode(VAR S: Str; StrLen: INTEGER);
{������� ������� �� Code, ��������������� �������� �� S}
VAR
  Index: 1 .. MaxLen;
BEGIN {Encode}
  FOR Index := 1 TO MaxLen
  DO
    IF S[Index] IN [' ' .. 'Z']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
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
      Encode(Msg, StrLen)
    END
END.  {Encryption}
