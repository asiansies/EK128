function velocity = calcvelocity(ptotal, pstatic)
%This function calculates the velocity of a moving fluid.
%Format of call: calcvelocity(ptotal, pstatic)

velocity = 1.016*(sqrt(ptotal-pstatic));

fprintf('The velocity of the fluid is %.2f.\n',velocity)

end

