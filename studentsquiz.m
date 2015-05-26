load quizgrades.dat

for i = 1:length(quizgrades)
    students(i) = struct('id_no',quizgrades(i,1),'quiz',struct('Q1',quizgrades(i,2),'Q2',quizgrades(i,3),'Q3',quizgrades(i,4)))
end
