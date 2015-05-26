function [smat] = matsort(mat)
%This function will sort all values of a matrix.

[r c] = size(mat);
colmat = reshape(mat,r*c,1);
scolmat = sort(colmat);
smat = reshape(scolmat,r,c);

end

