%This script will calculate how many quarters are represented in a file,
%plot costs and sales, and write the data to a new file.

load costssales.dat

fprintf('There were %.0f quarters in the file\n',length(costssales))
costs = costssales(:,1);
sales = costssales(:,2);
quarters = 1:length(costssales);

%Plot with labels
plot(quarters,costs, 'ko')
hold
plot(quarters,sales, 'k*')
xlabel('Quarter')
ylabel('Temperature')
title('Company Costs and Sales')