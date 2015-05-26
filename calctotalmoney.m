function totalmoney = calctotalmoney(prin,intrate,years)
%This function will calculate the total amount of money
%that will be in an account using the principal, interest rate,
%and number of years.
%Format of call: calctotalmoney(principal, intrate, years)

totalmoney = (prin*(1+intrate)^years);

end

