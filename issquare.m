function s = issquare(mat)
%Will return 1 if a matrix is a sqare matrix and 0 if it is not.
%Format of call: issquare(mat)

[r c] = size(mat);
if r == c
    s = 1
else
    s = 0
end
 
end


