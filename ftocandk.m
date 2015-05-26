function [celsius kelvin] = ftocandk(temp)
%Convert Fahrenheit to degrees Celsius and Kelvin
%Format of call: [c k ] = ftocandk(temp)

celsius = (temp-32)*(5/9);
kelvin = (celsius + 273.15);

end

