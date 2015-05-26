function newmat = myupp(n)
%Will return an n-by-n upper trianglar matrix.

mat = randi([-100,100],n);
newmat = triu(mat)


end

