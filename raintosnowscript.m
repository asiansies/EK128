%This script prompts the user for the amount of rain in inches and
%calculates the equivalent amount of snow.

rain = input('Please enter the amonut of rain in inches: ');
inchsnow = raintosnow(rain);
fprintf('%.2f inches of rain is equivalent to approximately %.2f inches of snow.\n',rain, inchsnow)