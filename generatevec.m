function [outvec, count] = generatevec(n)
%This function will generate a vector of n random integers

trialvec = randi([1 100],1,n);
count = 1;

while ~alldiff(trialvec)
    trialvec = randi([1 100],1,n);
    count = count + 1;
end

outvec = trialvec;

    function alldiff(trialvec)
        isqeual length(trialvec) == length(unique(trialvec))
    end



end
