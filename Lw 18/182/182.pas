PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
  MaxScore = 100;
  MinScore = 0;
TYPE
  Score = Minscore .. MaxScore;
VAR
  WhichScore: 0 .. NumberOfScores;
  Student: 0 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
PROCEDURE ReadAndWriteSurname;
VAR
  Ch: CHAR;
BEGIN
  WHILE (NOT EOlN) AND (Ch <> ' ')
  DO
    BEGIN
      READ(Ch);
      WRITE(Ch);
    END;
END;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 0;
  WHILE Student < ClassSize
  DO 
    BEGIN
      ReadAndWriteSurname;
      TotalScore := 0;
      WhichScore := 0;
      WHILE WhichScore < NumberOfScores
      DO
        BEGIN
          READ(NextScore);
          IF (NextScore < MinScore) OR  (NextScore > MaxScore)
          THEN
            WRITELN(NextScore, ' Probably incorrect value ');
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1;
        END;
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      IF Ave MOD 10 >= 5
      THEN
        WRITELN(Ave DIV 10 + 1)
      ELSE
        WRITELN(Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1;
    END;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}
