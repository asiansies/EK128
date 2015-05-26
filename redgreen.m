%This script will create a random image with the upper triangular section
%randomly red or green.

mycmap = [1 1 1; 1 0 0; 0 1 0];
colormap(mycmap)
cmat = ones(50);
for i = 1:50
    for j = 1:50
        if i < j
            cmat(i,j) = randi([2,3],1);
        end
    end
end

image(cmat)