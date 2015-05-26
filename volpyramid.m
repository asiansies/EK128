%This script will calculate the volume of a pyramid.
lengbase = input('Enter the length of the base: ');
unitl = input('Is that i or c? ','s');
if unitl == 'c'
    lengbase/2.54;
end

widbase = input('Enter the width of the base: ');
unitw = input('Is that i or c? ','s');
if unitw == 'c'
    widbase/2.54;
end

height = input('Enter the height: ');
unith = input('Is that i or c? ','s');
if unith == 'c'
    height/2.54
end

volpyr = (1/3)*lengbase*widbase*height;

fprintf('The volume of the pyramid is %.3f cubic inches.\n',volpyr)