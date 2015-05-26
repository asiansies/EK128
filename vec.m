function vec
%Will return a vector from 1 to a given number

n = input('Please enter an integer: ');
n2 = int32(n);
while n2 ~= n
    n = input('Invalid! Please enter an integer: ');
    n2 = int32(n);
end

vec = [1:n]