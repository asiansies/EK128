function plotmean(xvec, yvec)
%Will plot points and indicate which point is closest to the mean value

plot(xvec, yvec,'ko')
hold
ymean = mean(yvec);
plot (xvec,ymean,'b')
minvec = [];
for i = 1:length(yvec)
    minvec(i) = abs(ymean = yvec);
    cyp = min(minvec);
    plot(

end

