%This script will plot the difference between the sin and cos functions.

x = linspace(-2*pi,2*pi,100);
y1 = sin(x);
y2 = cos(x);
subplot(2,1,1);plot(x,y1)
title('sin(x)')
subplot(2,1,2);plot(x,y1)
title('cos(x)')