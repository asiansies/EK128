%This script will tell the user whether a random integer is odd or even.

int = randi([-50,50])
if rem(int,2) == 0
    disp('This is an even integer.')
else
    disp('This is an odd integer.')
end