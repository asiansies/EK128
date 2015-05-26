function inchestocm(inches)
%Will print inches and centimeters
%Format of call: [i c] = inchestocm(inches)

cm = inches*2.54;

fprintf('The length is %.2f inches, or %.2f centimeters.\n',inches,cm)

end

