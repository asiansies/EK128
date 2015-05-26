%This script will plot temperature vs time for a set of data
x = 0:3:21;
y = [55.5 52.4 52.6 55.7 75.6 77.7 70.3 66.6];
coefs = polyfit(x,y,3);
curve = polyval(coefs,x);
plot(x,y,'ro',x,curve)
title('Temperature vs. Time')
xlabel('Time')
ylabel('Temperature')