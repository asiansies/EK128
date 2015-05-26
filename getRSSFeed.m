function rss = getRSSFeed(ticker)
%   function rss = getRSSFeed(ticker)
%
%   Pulls the RSS feed from Yahoo finance for a specific comapny
%
%
%   INPUTS
%   -----------------------------------------------------------------------
%   TICKER (string)                 the stock ticker or tag of the 
%                                   company to pull information 
%                                   about (case insensitive)    
%
%   OUTPUTS
%   -----------------------------------------------------------------------
%   RSS (vector of structures)      vector of structures where each
%                                   structure holds one new story
%
%   Each structure in RSS has information in this format:
%       
%       RSS -|
%            |- title       : the title of the news story
%            |- link        : the url to the news story
%            |- date        : the date the story was published
%            |- site        : the website the story was published
%

% Ben Duong 
% Boston University 
% Spring 2012

url = 'http://finance.yahoo.com/rss/headline?s=';
url = [url ticker];

xml = xml2struct(url);
nodes = xml.children.children;
stories = nodes(strcmp({nodes.name},'item'));

for ii = length(stories):-1:1
    story = stories(ii).children;
    rss(ii).title = story(strcmp({story.name},'title')).children.data;
    rss(ii).link = story(strcmp({story.name},'link')).children.data;
    rss(ii).date = story(strcmp({story.name},'pubDate')).children.data;
    rss(ii).site = extractSite(rss(ii).link);
end
end

function out = extractSite(link)
link = link(strfind(link,'*')+1:end);
ex = 'http://([^/]*)/.*';
site =  regexp(link,ex,'tokens','once');
out = site{1};

end

function out = xml2struct(xmlfile)
% XML2STRUCT Read XML file into a structure.

% adapted from Douglas M. Schwarz

xml = xmlread(xmlfile);

children = xml.getChildNodes;
for i = children.getLength:-1:1
    out(i) = node2struct(children.item(i-1));
end

end
function s = node2struct(node)

s.name = char(node.getNodeName);

try
    s.data = char(node.getData);
catch err
    s.data = '';
end

if node.hasChildNodes
    children = node.getChildNodes;
    nchildren = children.getLength;
    c = cell(1,nchildren);
    s.children = struct('name',c,'data',c,'children',c);
    for i = 1:nchildren
        child = children.item(i-1);
        s.children(i) = node2struct(child);
    end
else
    s.children = [];
end
end