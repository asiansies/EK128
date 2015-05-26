function stockHistory = getStockHistory(ticker, startMonth, startDay, startYear, freq)
%   function stockHistory = getStockHistory(ticker, startMonth, startDay, startYear, freq)
%   
%   Pulls financial history for a specific company from a given date with
%   a given frequency.
%
%
%   INPUTS
%   -----------------------------------------------------------------------
%   TICKER (string)                 the stock ticker or tag of the 
%                                   company to pull information 
%                                   about (case insensitive)
%
%   STARTMONTH (string)             the month of the start date in the
%                                   range of 0-11 (0 for January) as a
%                                   string
%
%   STARTDAY (string)               the day of the month of the start date
%                                   as a string
%   
%   STARTYEAR (string)              the year of the start date as a string
%
%   FREQ (string)                   the frequency of the data ('d' for
%                                   day, 'm' for month and 'y' for year)
%
%
%   OUTPUTS
%   -----------------------------------------------------------------------
%   STOCKHISTORY                    vector of structures where each
%       (vector of structures)      structure holds the data for one point
%       
%   
%   Each structure in STOCKHISTORY has information in this format:
%
%   STOCKHISTORY(i) -|
%                    |- year            : year of the data point
%                    |- month           : month of the data point
%                    |- day             : day of the data point
%                    |- openPrice       : the opening price that day
%                    |- high            : the high that day
%                    |- low             : the low that day
%                    |- closePrice      : the closing price that day
%                    |- volume          : the volume of securities sold
%                    |                      that day
%                    |- adjustedClose   : the adjusted closing price that
%                                           day
%

% Ben Duong 
% Boston University 
% Spring 2012

url = 'http://ichart.finance.yahoo.com/table.csv?';
url = [url '&s=' ticker];
url = [url '&a=' startMonth];
url = [url '&b=' startDay];
url = [url '&c=' startYear];
url = [url '&g=' freq];
[history, status] = urlread(url);

if (status)
    parsedList = parseHistoryCSV(history);
    parsedList = parsedList(2:end);
    
    regex = buildRegex;
    
    for ii = length(parsedList):-1:1
        stockHistory(ii) = convertToNumeric(extractData(parsedList{ii}, regex));
    end
    
    stockHistory = fliplr(stockHistory);
else
    stockHistory = [];
end

end

function parsedCSV = parseHistoryCSV(csv)

newLines = [0 find(csv == sprintf('\n'))];

parsedCSV = cell(length(newLines)-1, 1);

for ii = 1:length(newLines) - 1
    begin = newLines(ii)+1;
    ending = newLines(ii+1)-1;
    parsedCSV{ii} = csv(begin:ending);
    
end

end

function regex = buildRegex
p{1} = '(?<year>[0-9]+)-(?<month>[0-9]+)-(?<day>[0-9]+)';
p{2} = '(?<openPrice>[0-9\.]+)';
p{3} = '(?<high>[0-9\.]+)';
p{4} = '(?<low>[0-9\.]+)';
p{5} = '(?<closePrice>[0-9\.]+)';
p{6} = '(?<volume>[0-9\.]+)';
p{7} = '(?<adjustedClose>[0-9\.]+)';

regex = p{1};
for ii = 2:length(p);
    regex = [regex ',' p{ii}];
end
end

function data = extractData(string, regex)
data = regexp(string, regex, 'names');
end

function data = convertToNumeric(stringData)
data = stringData;
fields = fieldnames(stringData);

for ii = 1:length(fields)
    field = fields{ii};
    data.(field) = str2num(stringData.(field));
    
end

end