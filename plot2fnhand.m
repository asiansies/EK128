function plot2fnhand(fn1, fn2)
%Will plot two functions with the names in the title.

x = (1:randi([4,10]));
y1 = fn1(x);
y2 = fn2(x);

plot(x,y1);
xlabel('x')
ylabel('fn(x)')
title(func2str(fn1))

newplot
plot(x,y2);
xlabel('x')
ylabel('fn(x)')
title(func2str(fn2))


end

