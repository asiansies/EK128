function [svec] = mydsort(vec)
%This function will sort a vector in descending order.
%Format of call: mydsort(vec)

for i = 1:length(vec)-1
    high = i;
    for j = i+1:length(vec)
        if vec(j)>vec(high)
            high = j;
        end
    end
    temp = vec(i);
    vec(i) = vec(high);
    vec(high) = temp;
end
svec = vec;
end


