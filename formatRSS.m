function coloredText = formatRSS(title, site, date)
%   function coloredText = formatRSS(title, site, date)
%
%   Colors the text of an new story with HTML
%
%   INPUTS
%   -----------------------------------------------------------------------
%   TITLE (string)              the title of the news story
%       
%   SITE (string)               the site hosting hte news story
%
%   DATE (string)               the date the story was published
%
%
%
%   OUTPUTS
%   -----------------------------------------------------------------------
%   COLOREDTEXT (string)        HMTL string with the title in black
%                               the site in pale pink and the date in pale
%                               blue

% Ben Duong 
% Boston University 
% Spring 2012

    coloredText = ['<HTML>' title ' <FONT COLOR=FF99FF>' site '</FONT> <FONT COLOR=acacFF>' date '</FONT><HTML>'];
end