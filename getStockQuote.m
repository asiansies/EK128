function quote = getStockQuote(ticker)
%   function quote = getStockQuote(ticker)
% 
%   Pulls specific financial data from Yahoo Finance for a 
%   given company.
%
%   INPUTS
%   -----------------------------------------------------------------------
%   TICKER (string)                 the stock ticker or tag of the 
%                                   company to pull information 
%                                   about (case insensitive)
%
%   OUTPUTS
%   -----------------------------------------------------------------------
%   QUOTE (structure)               structure holding information about 
%                                   stock (returns empty if the company
%                                   does not exist)
%   
%   QUOTE contains information about the company's stock in its fields
%
%       QUOTE -|
%              |- name              : The name of the company             
%              |- change            : The change in price in dollars
%              |- percentChange     : The percent change in price
%              |- previousClose     : The previous close amount
%              |- openValue         : The most recent opening price
%              |- dayHigh           : The highest price today
%              |- dayLow            : The lowest price today
%              |- high52            : The highest price in the last 52
%              |                        weeks
%              |- low52             : The lowest price in the last 52 weeks
%              |- percentChange200  : The percent change from the 200 day
%              |                        average
%              |- percentChange50   : The percent change from the 50 day
%              |                        average
%              |- moving50          : The 50 day moving average
%               

% Ben Duong 
% Boston University 
% Spring 2012

%% Pull From URL

%
% Build a url with flags to get specific information
%
url = 'http://finance.yahoo.com/d/quotes.csv?';
url = [url '&s=' ticker];
url = [url '&f=' ];
url = [url 'n'];    % Name
url = [url 'c1'];   % Change
url = [url 'p2'];   % Percent Change
url = [url 'p'];    % Previous Close
url = [url 'o'];    % Open Value
url = [url 'h'];    % Day's High
url = [url 'g'];    % Day's Low
url = [url 'k'];    % 52-week High
url = [url 'j'];    % 52-week Low
url = [url 'm6'];   % Percent Change From 200 Day Average
url = [url 'm8'];   % Percent Change From 50 Day Average
url = [url 'm3'];   % 50 Day Moving Average

[stock status] = urlread(url);

%
% If the company exists, status will be true. If not status is false and 
% we return empty
%
if(status)
    regex = buildRegex;
    quote = convertToNumeric(parseCSV(stock,regex));
else
    quote = [];
end


end

%% Regex Builder
%
% Use regular expressions to parse through the csv returned by Yahoo 
%
function regex = buildRegex
p{1} = '\"?(?<name>[\x23-\x7E !]+)\"?';
p{2} = '(?<change>[N/A0-9\.-+]+)';
p{3} = '\"?(?<percentChange>[-N/A\.0-9+]+)%?\"?';
p{4} = '(?<previousClose>[N/A0-9\.-]+)';
p{5} = '(?<openValue>[N/A0-9\.-]+)';
p{6} = '(?<dayHigh>[N/A0-9\.-]+)';
p{7} = '(?<dayLow>[N/A0-9\.-]+)';
p{8} =  '\"?(?<high52>[-N/A\.0-9]+)\"?';
p{9} =  '\"?(?<low52>[-N/A\.0-9]+)\"?';
p{10} = '(?<percentChange200>[N/A0-9\.-+]+)%?';
p{11} = '(?<percentChange50>[N/A0-9\.-+]+)%?';
p{12} = '(?<moving50>[N/A0-9\.-+]+)';

regex = p{1};
for ii = 2:length(p);
    regex = [regex ',' p{ii}];
end

end

%% Parse CSV
function parsed = parseCSV(csv, regex)
parsed = regexp(csv, regex, 'names');
end


%% Covert To Numeric
%
% Convert any string fields that can be converted to a numeric  
%
function nObj= convertToNumeric(obj)
fields = fieldnames(obj);
nObj = obj;

for ii = 1:length(fields)
    field = fields{ii};
    num = str2num(obj.(field));
    if(~isempty(num))
        nObj.(field) = num;
    end
    
end

end