function newmat = mymatadd(mat1,mat2)
%Will receive two matrix arguments and add them.

[r1 c1] = size(mat1);
[r2, c2] = size(mat2);

if r1 == r2 && c1 == c2
    for i = 1:r1
        for j = 1:c1
            newmat(i,j) = mat1(i,j)+ mat2(i,j);
        end
    end
else
    newmat = []
end


end

