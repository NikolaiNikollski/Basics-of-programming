PROGRAM SarahRevere(INPUT, OUTPUT);
{ѕечать сообщени€ о том как идут британцы,
 в зависимости от того, первым во входе встречаетс€
'land' или 'sea'.}
VAR
  W1, W2, W3, W4: CHAR;
  Sea, Land, Looking: BOOLEAN;
BEGIN {SarahRevere}
  BEGIN {инициализаци€ W1,W2,W3,W4,Looking}
      W1 := ' ';
      W2 := ' ';
      W3 := ' ';
      W4 := ' ';
      Looking := TRUE;
  END; {инициализаци€ W1,W2,W3,W4,Looking}
  WHILE Looking AND NOT (Sea OR Land)
  DO
    BEGIN
      BEGIN  {ƒвигать окно, провер€ть конец данных}
        W1 := W2;
        W2 := W3;
        W3 := W4;
        READ(W4);
        Looking := (W4 <> '#')
      END; {ƒвигать окно, провер€ть конец данных}
      BEGIN {ѕроверка окна дл€ 'sea' и 'land'}
        Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd');
        Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a')
      END {ѕроверка окна дл€ 'sea' и 'land'}
    END;
  BEGIN {создать сообщение Sarah}
    IF Land
    THEN
      WRITELN('The British are coming by land.')
    ELSE
      IF Sea
      THEN
        WRITELN('The British coming by sea.')
      ELSE
        WRITELN('Sarah didn''t say')
  END {создать сообщение Sarah}
END. {Sarah revere}
