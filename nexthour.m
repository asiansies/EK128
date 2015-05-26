function hour = nexthour(hournow)
%This function will tell tell the user the next hour of the day.
%Format of call: nexthour(hournow)

hour = hournow+1;
fprintf('The next hour will be %d.\n',hour)

if hournow == 12
    fprintf('The next hour will be 1.\n')
end

end

