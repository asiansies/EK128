function vec = mydiag(mat)
%Will return a vector consisting of the main diagonal of a square matrix.
%Format of call: mydiag(mat)

n = issquare(mat);
if n == 1
    [r c] = size(mat);
    for i = 1:r
        vec(i) = mat(i,i);
    end
else
    vec = [];
end

end

