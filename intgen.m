%This script will prompt the user for minimum and maximum values and print how many integers
%are generated until the user's number is found.

min = input('Please enter your minimum value: ');
max = input('Please enter your maximum value: ');
intchoice = input('Now enter your choice in this range: ');
counter = 0;
while min ~= intchoice
    min = min + 1;
    counter = counter + 1;
end
fprintf('It took %d to generate your number\n',counter)