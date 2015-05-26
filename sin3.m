%This script will plot the sin function three times using different colors
 
x = linspace(-2*pi,2*pi,100);
y = sin(x);
subplot(3,1,1);plot(x,y,'r')
title('sin(x)')
subplot(3,1,2);plot(x,y,'g')
subplot(3,1,3);plot(x,y,'b')


