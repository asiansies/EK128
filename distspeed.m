%This script will fit and plot a straight line through data
load tripdata.dat
x = tripdata(:,1);
y = tripdata(:,2);

coefs = polyfit(x,y,1);
line = polyval(coefs,x);
plot(x,y,'ro',x,line)
title('Distance vs Speed')
xlabel('Distance (miles)')
ylabel('Speed (mph)')