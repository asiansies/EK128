%Will store x and y coordinates in the form 'x 3.1 y 6.4' and plot them.

string = 'x 3.1 y 6.4';
[x rest1] = strtok(string)
[xcoord rest2] = strtok(rest1)
[y ycoord] = strtok(rest2)
ycoord = strtrim(ycoord)
xcoord = str2num(xcoord);
ycoord = str2num(ycoord);
plot(xcoord,ycoord, 'ro')