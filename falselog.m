%Test whether using false or logical is faster.

disp('Preallocating using logical')
tic
logical(zeros(6))
toc

disp('Preallocating using false')
tic
false(6)
toc