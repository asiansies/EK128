%This script will calculate and print the area of a chosen shape.

shape = menu('Pick a shape','cylinder','circle','rectangle');
switch shape
    case 1
        rad = input('Enter the radius of the cylinder: ');
        area = (2*pi*rad)+(pi*rad^2);
        fprintf('The area is %.2f\n',area)
    case 2
        rad = input('Enter the radius of the circle: ');
        area = (pi*rad^2);
        fprintf('The area is %.2f\n',area)
    case 3
        length = input('Enter the length: ')
        width = input('Enter the width: ')
        area = (length*width);
        fprintf('The area is %.2f\n',area)
end