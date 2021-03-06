PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;                               
  ClassSize = 4;
  MinScore = 0;
  MaxScore = 100;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 0 .. NumberOfScores;
  Student: 0 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages: ');
  Student := 0;              
  WHILE (Student < ClassSize)
  DO                                                                         
    BEGIN                    
      Student := Student + 1;
      TotalScore := 0;
      WhichScore := 0;      
      WRITELN('Enter grades of ', Student, ' student.');
      WHILE (WhichScore < NumberOfScores) 
      DO                                                                                
        BEGIN
          NextScore := 0;
	  IF NOT EOLN(INPUT)
	  THEN
            READ(NextScore);
          IF (NextScore > MaxScore) OR (NextScore < MinScore)
          THEN
            WRITELN('Ѕалл может быть в диапазоне от ', MinScore, ' до ', MaxScore)
          ELSE
            BEGIN
              TotalScore := TotalScore + NextScore;
              WhichScore := WhichScore + 1
            END 
        END;
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      WRITE('Average score of student ', Student, ': ');                              
      IF (Ave MOD 10) >= 5
      THEN
        WRITELN(Ave DIV 10 + 1)
      ELSE
        WRITELN(Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore
    END;
  WRITELN('Class average: ');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}
