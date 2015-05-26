%This script will create a random 2-dimensional patch

x = rand([1,3]);
y = rand([1,3]);
patch(x,y,[0.5 0.5 0.5])
axis ([0 1 0 1])