PROGRAM Prime(INPUT, OUTPUT);
{Находит наибольшее простое число в заданном диапазоне}
CONST
  MinValue = 2;
  MaxValue = 100;
TYPE
  NumberSetType = SET OF MinValue .. MaxValue;
  NumberRangeType = MinValue .. MaxValue;
VAR
  OriginalSet: NumberSetType;
  NumberSet: NumberSetType;
  Number: NumberRangeType;
  CoeffOfMulti: INTEGER;
BEGIN {Prime}
  WRITE('Prime numbers in the range up to ', MaxValue, ' will be:');
  OriginalSet := [MinValue .. MaxValue];
  NumberSet := OriginalSet;
  Number := MinValue;
  WHILE (NumberSet * OriginalSet <> []) 
  DO
    BEGIN
      IF Number IN NumberSet
      THEN
        BEGIN
          WRITE(' ', Number);
          CoeffOfMulti := 1;
          WHILE (Number * CoeffOfMulti <= MaxValue)
          DO
            BEGIN
              NumberSet := NumberSet - [Number * CoeffOfMulti];
              CoeffOfMulti := CoeffOfMulti + 1;
            END
        END;
      Number := Number + 1;
    END;
  WRITELN          
END. {Prime}
      
