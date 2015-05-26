%This script will plot both a linear and quadratic best fit line to a set of data
x = 1:10;
y = [21 24 27 26 25 30 26 22 18 11];
coefs1 = polyfit(x,y,1);
line = polyval(coefs1,x);
coefs2 = polyfit(x,y,2);
curve = polyval(coefs2,x);
plot(x,y,'ro',x,line)
hold
plot(x,y,'ro',x,curve)
legend('line','quadratic')