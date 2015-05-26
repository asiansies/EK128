function outmax = mymaxvec(vec)
%mymaxvec returns the maximum value in a vector
%Format of call: mymaxvec(vec)

outmax = vec(1);
for i = 2:length(vec)
    if vec(i) > outmax
        outmax = vec(i);
    end
end

end

