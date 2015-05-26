%This script reads diameter of a part from a file and plots the data.

load partdiam.dat

time = partdiam(:,1);
diam = partdiam(:,2);

plot(time,diam,'k*')
xlabel('Time')
ylabel('Diameter')
title('Diameter vs. Time')