function runsum = sumsteps2(n)
%This function will calculate and return a running sum.
%Format of call: sumsteps2(n)

runsum = 0;
for i = 1:2:n
    runsum = runsum + i;
end
end

