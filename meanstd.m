%This script will calculate the mean values for red, green and blue 
%components of an image along with their standard deviations

mat = imread('ws22p5im2.jpg');
map = colormap;

meanred = mean(map(:,1));
stdred = std(map(:,1));
fprintf('The mean value for red is %.2f with a standard deviation of %.2f.\n',meanred, stdred)

meangreen = mean(map(:,2));
stdgreen = std(map(:,2));
fprintf('The mean value for green is %.2f with a standard deviation of %.2f.\n',meangreen, stdgreen)

meanblue = mean(map(:,3));
stdblue = std(map(:,3));
fprintf('The mean value for red is %.2f with a standard deviation of %.2f.\n',meanblue, stdblue)