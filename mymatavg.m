function outsum = mymatavg(mat)
%This function will calculate the overall sum of a matrix.
%Format of call: mymatsum(mat)

[r c] = size(mat);
outsum = 0;

for i = 1:r
    for j = 1:c
        outsum = outsum + mat(i,j);
    end
end

outsum = outsum/(r*c);

end

