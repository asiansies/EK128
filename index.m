function [aindvec dindvec] = index(vec)
%This function will return two index vectors - one for ascending order and
%one for descending order.
%Format of call: [a d] = index(vec)

aindvec = (1:length(vec));
for i = 1:length(vec)
    svec = sort(vec);
    aindvec(i) = find(vec == svec(i));
end

dindvec = (1:length(vec));
for i = 1:length(vec)
    svec = sort(vec,'descend');
    dindvec(i) = find(vec == svec(i));
end
