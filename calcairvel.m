function velocity = calcairvel(velmph)
%This function converts the velocity of an aircraft 
%from miles per hour to meters per second.
%Format of call: calcairvel(velmph)

velocity = (velmph*5280*.3048)/3600;

fprintf('The velocity of the airplane is %.2f meters per second.\n',velocity)

end

