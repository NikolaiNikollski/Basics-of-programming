PROGRAM SarahRevere(INPUT, OUTPUT);
{������ ��������� � ��� ��� ���� ��������,
 � ����������� �� ����, ������ �� ����� �����������
'land' ��� 'sea'.}
VAR
  W1, W2, W3, W4, Looking: CHAR;
  Sea, Land: BOOLEAN;
BEGIN {SarahRevere}
  BEGIN {������������� W1,W2,W3,W4,Looking}
      W1 := ' ';
      W2 := ' ';
      W3 := ' ';
      W4 := ' ';
      Looking := 'Y'
  END; {������������� W1,W2,W3,W4,Looking}
  WHILE (Looking = 'Y') AND NOT (Sea OR Land)
  DO
    BEGIN
      BEGIN { ������� ����, ��������� ����� ������}
        W1 := W2;
        W2 := W3;
        W3 := W4;
        READ(W4);
        IF W4 = '#'
        THEN {����� ������}
          Looking := 'N'
      END; { ������� ����, ��������� ����� ������}
        Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd'); {�������� ���� ���  'land'}
        Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a'){�������� ���� ��� 'sea'}
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
