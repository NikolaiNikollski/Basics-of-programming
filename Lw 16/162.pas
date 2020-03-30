PROGRAM SarahRevere(INPUT, OUTPUT);
{������ ��������� � ��� ��� ���� ��������,
 � ����������� �� ����, ������ �� ����� �����������
'land' ��� 'sea'.}
VAR
  W1, W2, W3, W4: CHAR;
  Sea, Land, Looking: BOOLEAN;
BEGIN {SarahRevere}
  BEGIN {������������� W1,W2,W3,W4,Looking}
      W1 := ' ';
      W2 := ' ';
      W3 := ' ';
      W4 := ' ';
      Looking := TRUE;
  END; {������������� W1,W2,W3,W4,Looking}
  WHILE Looking AND NOT (Sea OR Land)
  DO
    BEGIN
      BEGIN  {������� ����, ��������� ����� ������}
        W1 := W2;
        W2 := W3;
        W3 := W4;
        READ(W4);
        Looking := (W4 <> '#')
      END; {������� ����, ��������� ����� ������}
      BEGIN {�������� ���� ��� 'sea' � 'land'}
        Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd');
        Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a')
      END {�������� ���� ��� 'sea' � 'land'}
    END;
  BEGIN {������� ��������� Sarah}
    IF Land
    THEN
      WRITELN('The British are coming by land.')
    ELSE
      IF Sea
      THEN
        WRITELN('The British coming by sea.')
      ELSE
        WRITELN('Sarah didn''t say')
  END {������� ��������� Sarah}
END. {Sarah revere}
