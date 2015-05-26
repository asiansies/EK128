%This script will calculate fractions.

num = input('Please enter the numerator: ')
den = input('Please enter the denominator: ')

if den == 0 
    disp('Error! Division by 0 is not possible.')
else
    fprintf('%.2f \n',(num/den))
end