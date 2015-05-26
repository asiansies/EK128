%This script will calculate the range typically spent on food from a given
%income.

income = input('Enter your annual income: ');
minamt = (income*.08);
maxamt = (income*.10);

fprintf('You will spend %.2f to %.2f on food annually.\n',minamt, maxamt)