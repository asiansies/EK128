%This script will read a file and create an area plot.

fid = fopen('areapts.dat')
while feof(fid)==0
    mat = fscanf(fid, '%c %f %c %f\n', [4 inf]);
    x = mat(2,:);
    y = mat(4,:);
    area(x,y)
    title('4 data points')
end