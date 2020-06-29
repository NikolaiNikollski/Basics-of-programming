UNIT FileModule;

INTERFACE
TYPE
  Tree = ^NodeType;
  NodeType = RECORD
               Key: STRING;
               Counter: INTEGER;
               LLink, RLink: Tree;
             END;
PROCEDURE Insert(VAR Ptr: Tree; Data: STRING);
PROCEDURE PrintStat(Ptr: Tree);

IMPLEMENTATION

PROCEDURE Insert(VAR Ptr: Tree; Data: STRING);
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN {������� ���� �� ��������� Data}
      NEW(Ptr);
      Ptr^.Key := Data;
      Ptr^.Counter := 1;
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL;
    END
  ELSE
    IF Ptr^.Key > Data
    THEN
      Insert(Ptr^.LLink, Data)
    ELSE
      IF Ptr^.Key < Data
      THEN
        Insert(Ptr^.RLink, Data)
      ELSE
        Ptr^.Counter := Ptr^.Counter + 1
END;  {Insert}

PROCEDURE PrintStat(Ptr: Tree);
BEGIN {PrintStat}
  IF Ptr <> NIL
  THEN  {�������� ��������� �����, �������, ��������� ������}
    BEGIN
      PrintStat(Ptr^.LLink);
      WRITELN(Ptr^.Key, ' ', Ptr^.Counter);
      PrintStat(Ptr^.RLink);
    END
END;  {PrintStat}

BEGIN {FileModule}
END. {FileModule}




