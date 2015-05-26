%Thus script will present the user different options for rounding a random
%integer.

randnum = randi([-100,100])
roundmethod = menu('Pick a rounding method','Round towards zero','Round towards negative infinity','Round towards positive infinity');
while roundmethod ~= 1 && roundmethod ~= 2 && roundmethod ~= 3
    roundmethod = menu('Pick a rounding method','Round towards zero','Round towards negative infinity','Round towards positive infinity');
end
if roundmethod == 1
    roundedrand = fix(randnum);
    fprintf('Your result is: %.2f\n',roundedrand)
else if roundmethod == 2
    roundedrand = floor(randnum);
    fprintf('Your result is: %.2f\n',roundedrand)
    else if roundmethod == 3
        roundedrand = ceil(randnum);
        fprintf('Your result is: %.2f\n',roundedrand)
        end
    end
end
