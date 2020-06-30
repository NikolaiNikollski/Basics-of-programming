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
PROCEDURE ClearTree(Ptr: Tree);

IMPLEMENTATION

PROCEDURE Insert(VAR Ptr: Tree; Data: STRING);
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN {Создаем лист со значением Data}
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
  THEN  {Печатает поддерево слева, вершину, поддерево справа}
    BEGIN
      PrintStat(Ptr^.LLink);
      WRITELN(Ptr^.Key, ' ', Ptr^.Counter);
      PrintStat(Ptr^.RLink);
    END
END;  {PrintStat}

PROCEDURE ClearTree(Ptr: Tree);
BEGIN {ClearTree}
  IF Ptr <> NIL
  THEN  {Печатает поддерево слева, вершину, поддерево справа}
    BEGIN
      ClearTree(Ptr^.LLink);
      DISPOSE(Ptr);
      ClearTree(Ptr^.RLink);
    END
END;  {ClearTree}

BEGIN {FileModule}
END. {FileModule}




