%This script will error check and calculate the area of a cone.

radius = input('Enter the radius of the cone: ');
while radius < 0
    radius = input('Invalid! Please enter a positive radius: ');
end
height = input('Enter the height of the cone: ');
while height < 0
    height = input('Invalid! Please enter a positive height: ');
end

volume = 1/3*pi*radius^2*height;
fprintf('The volume of your cone is %.2f\n',volume)