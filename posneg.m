%This script will separate positive and negative integers into different
%files.

n = 7;
pos = [];
neg = [];
save pos.dat pos -ascii
save neg.dat neg -ascii
counter = 1;
num = input('Please enter a positive or negative integer: ');
while counter < n
    if num >= 0
        save pos.dat num -ascii -append
        counter = counter + 1;
        num = input('Please enter a positive or negative integer: ');
    else if num < 0
            save neg.dat num -ascii -append
            counter = counter + 1;
            num = input('Please enter a positive or negative integer: ');
        end
    end
end

    