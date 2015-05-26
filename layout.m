function stockgui
f = figure('Visible','off',...  %Create GUI
    'Color',[0.5 0.5 0.5]);
set(f,'Units','normalized',...
    'Position', [0 0 1 1],...
    'MenuBar','None');
ticsym = uicontrol('Style','text',...   %Create different objects
    'Units','normalized',...              with normalized units
    'Position',[0.8,0.77,0.17,0.2],...
    'String','Enter Ticker Symbol',...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontUnits','normalized',...
    'FontSize',0.08);
edticsym = uicontrol('Style','edit',...
    'Units','normalized',...
    'Position',[0.8,0.885,0.17,0.05],...
    'Callback',@cbticsym,...
    'FontSize',14);
rcntsrch = uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.8,0.67,0.17,0.2],...
    'String','Recent Searches',...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontUnits','normalized',...
    'FontSize',0.08);
rcntsrchlbox = uicontrol('Style','listbox',...
    'Units','normalized',...
    'Position',[0.8,0.47,0.17,0.37],...
    'FontSize',14,'Callback',@cbrcsearch);
axobj = axes('Position',[0.05,0.575,0.7,0.375]);
qfor = uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.05,0.4,0.25,0.045],...
    'String','Quote for:',...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontUnits','normalized',...
    'FontSize',0.4);
qforinfo = uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.05,0.04,0.25,0.37],...
    'String','Textbox meow meow meow',...
    'BackgroundColor',[1 1 1],...
    'FontUnits','normalized',...
    'FontSize',0.025);
rftbox = uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.4,0.4,0.6,0.045],...
    'String','RSS FEED:',...
    'BackgroundColor',[0.5 0.5 0.5],...
    'FontUnits','normalized',...
    'FontSize',0.4);
rflbox = uicontrol('Style','listbox',...
    'Units','normalized',...
    'Position',[0.35,0.04,0.625,0.37],...
    'FontUnits','normalized',...
    'FontSize',0.025,'Callback',@cbrflbox);


set(f,'Visible','on')   %Initialize variables

tickervar = 'GOOG';
month = '11';
day = '31';
year = '2010';
frequency = 'd';
montharray = {'Jan','Feb','Mar','Apr','May','Jun','Jul'...
    ,'Aug','Sep','Oct','Nov','Dec'};
monthdays = [31 28 31 30 31 30 31 31 30 31 30 31];
yearsvec = [2011 2010 2009 2008];
aplothan = (1 < 0);
quotehan = [];
finhisthan = [];
rssfeed = [];


%Call back function for tick search
function cbticsym(source,eventdata)
tickervar = get(edticsym,'String');
set(edticsym,'String',[])
set(rcntsrchlbox,'Value',1)


    function out =  stockinfofunc
        finhisthan = getStockHistory(tickervar,month,day,year,frequency);
        if isempty(finhisthan)
            out = (1<0);
        else
            % quotehan = delete(); %delete something
            set(axobj,'YLimMode','auto','XLimMode','auto')
            a = ishandle(aplothan);
            if a == 1
                set(aplothan, 'YData',finhisthan.closePrice)
            else
                pricevec = [];
                for i = 1:length(finhisthan)
                    pricevec = [pricevec finhisthan(i).closePrice];
                end
                aplothan = area(pricevec);
                set(aplothan,'Parent',axobj,'FaceColor','blue','EdgeColor',...
                    'black','LineWidth',.3)
                ylabel('Price ($)','FontUnits','normalized','FontSize',0.05)
                alpha(.5)
                grid on
                out = (1>0);
                
            end
            d1 = [];
            for i = 1:length(finhisthan)
                d1 = [d1 finhisthan(i).month];
            end
            d2 = diff(d1);
            d2ind = find(d2 ~= 0);
            d2ind = d2ind+1;
            set(axobj,'XTick',d2ind)
            monthvec = [];
            monthcell = cell(1,1);
            for i = 1:length(finhisthan)
                monthvec = [monthvec finhisthan.month];
            end
            for i = 1:length(monthvec)
                monthcell{i} = montharray(monthvec(i));
            end
            ticks = cell(1,1);
            for i = 1:length(d2ind)
                ticks{i} = monthcell{d2ind(i)}{1};
            end
            yearvec = [];
            for i = 1:length(finhisthan)
                yearvec = [yearvec finhisthan.year];
            end
            tind = [];
            t = [];
            for i = 1:length(ticks)
                t2 = strcmp(ticks(i),'Jan');
                t = [t t2];
            end
            tind = find(t == 1);
            d3ind = d2ind(tind);
            d3ind = yearvec(d3ind);
            
            ticks = char(ticks);
            set(axobj,'XTickLabel',ticks)
        end
    end
log = 1>0;
out = stockinfofunc
if out == log
    function rcbox(tickervar)
    searches = get(rcntsrchlbox,'String');
    for i = 1:length(searches)
        if strcmp(tickervar,searches{i})
            searches{i} = [];
        end
    end
    %for i =length(searches)+1:-1:1
    %searches{i+1} = searches{i}
    %end
    %searches{1} = tickervar;
    %if length(searches) > 10
    %for i = 11:length(searches)
    %searches{i} = [];
    %end
    %end
    %set(rcntsrchlbox,'String',searches)
    end
    function [quote] =quoteinfofunc
    quote = getStockQuote(tickervar);
    compname = quote.name;
    t = title(sprintf('%s:%s',tickervar,compname));
    set(t,'FontUnits','normalized','FontSize',0.1)
    set(qfor,'String',sprintf('Quote for:%s',tickervar))
    quote.change = num2str(quote.change);
    quote.percentChange = num2str(quote.percentChange);
    quote.previousClose = num2str(quote.previousClose);
    quote.openValue = num2str(quote.openValue);
    quote.dayLow = num2str(quote.dayLow);
    quote.dayHigh = num2str(quote.dayHigh);
    quote.low52 = num2str(quote.low52);
    quote.high52 = num2str(quote.high52);
    line1 = [];
    line2 = sprintf('Symbol: %s',tickervar);
    line3 = sprintf('Name: %s',quote.name);
    line4 =[];
    line5 = '------------------------------------------------------------';
    line6 = [];
    line7 = sprintf('Change: %s',quote.change);
    line8 = sprintf('Percent Change: %s',quote.percentChange);
    line9 = sprintf('Previous Close: %s',quote.previousClose);
    line10 = sprintf('Opening: %s',quote.openValue);
    line11 = sprintf('Day Range: %s - %s',quote.dayLow,quote.dayHigh);
    line12 = sprintf('52 Week Range %s - %s',quote.low52,quote.high52);
    line13 = [];
    line14 = '-----------------------------------------------------------';
    line15 = [];
    p = '%';
    line16 = sprintf('%s Change From 50 Day Average: %s%s ',p,quote.percentChange50,p);
    line17 = sprintf('%s Change From 200 Day Average: %s%s ',p,quote.percentChange200,p);
    linescell = {line1,line2,line3,line4,line5,line6,line7,line8,line9,line10,line11,line12,line13,line14,line15,line16,line17};
    set(qforinfo,'String',linescell)
    end
    function plotinfofunc(quote)
    hold on
    ylim = get(axobj,'YLim');
    xlim = length(finhisthan);
    
    axis([0 xlim ylim])
    c1 = class(quote.moving50);
    move = [];
    for i = 1:length(quote)
        move = [move quote(i).moving50];
    end
    if strcmp(c1,'double')
        p1 = line([0 xlim],[move move],'LineStyle',':','LineWidth',3);
    end
    c2 = class(quote.openValue);
    hold on
    if strcmp(c2,'double')
        if quote.moving50 < quote.openValue
            p2 = line([0 xlim],[quote.openValue quote.openValue],'Color',...
                [0 1 0],'LineStyle',':','LineWidth',3);
        elseif quote.moving50 > quote.openValue
            p2 = line([0 xlim],[quote.openValue quote.openValue],'Color',...
                [1 0 0],'LineStyle',':','LineWidth',3);
        elseif ~strcmp(c1,'double')
            p2 = line([0 xlim],[quote.openValue quote.openValue],'Color',...
                [0 0 0],'LineStyle',':','LineWidth',3);
        end
    end
    end
    function RSSFeed()
    set(rftbox,'String',sprintf('RSS Feed:%s',tickervar))
    rssfeed = getRSSFeed(tickervar);
    rsscell = cell(1,length(rssfeed));
    %for i = 1:length(rssfeed)
    %   rsscell(i) = formatRSS(rssfeed.title(i),rssfeed.site(i),rssfeed.date(i));
    
    %end
    %set(rflbox,'String',rsscell)
    end
else
    w = warndlg('This is a warning string.','Ticker value invalid','modal');
end
end

function cbrcsearch
lboxval = get(rcntsrchlbox,'Value');
stringcell = get(rcntsrchlbox,'String');
tickervar = stringcell(lboxval);
function out =  stockinfofunc
        finhisthan = getStockHistory(tickervar,month,day,year,frequency);
        if isempty(finhisthan)
            out = (1<0);
        else
            % quotehan = delete(); %delete something
            set(axobj,'YLimMode','auto','XLimMode','auto')
            a = ishandle(aplothan);
            if a == 1
                set(aplothan, 'YData',finhisthan.closePrice)
            else
                pricevec = [];
                for i = 1:length(finhisthan)
                    pricevec = [pricevec finhisthan(i).closePrice];
                end
                aplothan = area(pricevec);
                set(aplothan,'Parent',axobj,'FaceColor','blue','EdgeColor',...
                    'black','LineWidth',.3)
                ylabel('Price ($)','FontUnits','normalized','FontSize',0.05)
                alpha(.5)
                grid on
                out = (1>0);
                
            end
            d1 = [];
            for i = 1:length(finhisthan)
                d1 = [d1 finhisthan(i).month];
            end
            d2 = diff(d1);
            d2ind = find(d2 ~= 0);
            d2ind = d2ind+1;
            set(axobj,'XTick',d2ind)
            monthvec = [];
            monthcell = cell(1,1);
            for i = 1:length(finhisthan)
                monthvec = [monthvec finhisthan.month];
            end
            for i = 1:length(monthvec)
                monthcell{i} = montharray(monthvec(i));
            end
            ticks = cell(1,1);
            for i = 1:length(d2ind)
                ticks{i} = monthcell{d2ind(i)}{1};
            end
            yearvec = [];
            for i = 1:length(finhisthan)
                yearvec = [yearvec finhisthan.year];
            end
            tind = [];
            t = [];
            for i = 1:length(ticks)
                t2 = strcmp(ticks(i),'Jan');
                t = [t t2];
            end
            tind = find(t == 1);
            d3ind = d2ind(tind);
            d3ind = yearvec(d3ind);
            
            ticks = char(ticks);
            set(axobj,'XTickLabel',ticks)
        end
end
log = 1>0;
if out == log
    function [quote] =quoteinfofunc
    quote = getStockQuote(tickervar);
    compname = quote.name;
    t = title(sprintf('%s:%s',tickervar,compname));
    set(t,'FontUnits','normalized','FontSize',0.1)
    set(qfor,'String',sprintf('Quote for:%s',tickervar))
    quote.change = num2str(quote.change);
    quote.percentChange = num2str(quote.percentChange);
    quote.previousClose = num2str(quote.previousClose);
    quote.openValue = num2str(quote.openValue);
    quote.dayLow = num2str(quote.dayLow);
    quote.dayHigh = num2str(quote.dayHigh);
    quote.low52 = num2str(quote.low52);
    quote.high52 = num2str(quote.high52);
    line1 = [];
    line2 = sprintf('Symbol: %s',tickervar);
    line3 = sprintf('Name: %s',quote.name);
    line4 =[];
    line5 = '------------------------------------------------------------';
    line6 = [];
    line7 = sprintf('Change: %s',quote.change);
    line8 = sprintf('Percent Change: %s',quote.percentChange);
    line9 = sprintf('Previous Close: %s',quote.previousClose);
    line10 = sprintf('Opening: %s',quote.openValue);
    line11 = sprintf('Day Range: %s - %s',quote.dayLow,quote.dayHigh);
    line12 = sprintf('52 Week Range %s - %s',quote.low52,quote.high52);
    line13 = [];
    line14 = '-----------------------------------------------------------';
    line15 = [];
    p = '%';
    line16 = sprintf('%s Change From 50 Day Average: %s%s ',p,quote.percentChange50,p);
    line17 = sprintf('%s Change From 200 Day Average: %s%s ',p,quote.percentChange200,p);
    linescell = {line1,line2,line3,line4,line5,line6,line7,line8,line9,line10,line11,line12,line13,line14,line15,line16,line17};
    set(qforinfo,'String',linescell)
    end
    function plotinfofunc(quote)
    hold on
    ylim = get(axobj,'YLim');
    xlim = length(finhisthan);
    
    axis([0 xlim ylim])
    c1 = class(quote.moving50);
    move = [];
    for i = 1:length(quote)
        move = [move quote(i).moving50];
    end
    if strcmp(c1,'double')
        p1 = line([0 xlim],[move move],'LineStyle',':','LineWidth',3);
    end
    c2 = class(quote.openValue);
    hold on
    if strcmp(c2,'double')
        if quote.moving50 < quote.openValue
            p2 = line([0 xlim],[quote.openValue quote.openValue],'Color',...
                [0 1 0],'LineStyle',':','LineWidth',3);
        elseif quote.moving50 > quote.openValue
            p2 = line([0 xlim],[quote.openValue quote.openValue],'Color',...
                [1 0 0],'LineStyle',':','LineWidth',3);
        elseif ~strcmp(c1,'double')
            p2 = line([0 xlim],[quote.openValue quote.openValue],'Color',...
                [0 0 0],'LineStyle',':','LineWidth',3);
        end
    end
    end
    function RSSFeed()
    set(rftbox,'String',sprintf('RSS Feed:%s',tickervar))
    rssfeed = getRSSFeed(tickervar);
    rsscell = cell(1,length(rssfeed));
    %for i = 1:length(rssfeed)
    %   rsscell(i) = formatRSS(rssfeed.title(i),rssfeed.site(i),rssfeed.date(i));
    
    %end
    %set(rflbox,'String',rsscell)
    end
end

    function cbrflbox
        select = get(f,'SelectionType');
        if strcmp(select,'Open') || strcmp(select,'open')
            rssvalue = get(rflbox,'Value');
            story = rssfeed(rssvalue);
            web(story.link,'-browser')
        end
    end

%Start date/month/menu
stdate = uicontrol('Style','text',...
    'Units','normalized',...
    'FontUnits','normalized',...
    'FontSize',0.45,...
    'Position',[0.07,0.5,0.06,0.04],...
    'String','Start Date',...
    'BackgroundColor',[0.5 0.5 0.5]);
stmonth = uicontrol('Style','popup',...
    'Units','normalized',...
    'FontUnits','normalized',...
    'FontSize',0.45,...
    'Position',[0.15,0.5,0.06,0.04],...
    'String',montharray,...
    'Callback',@cbmonth);
stdays = uicontrol('Style','popup',...
    'Units','normalized',...
    'FontUnits','normalized',...
    'FontSize',0.45,...
    'Position',[0.21,0.5,0.06,0.04],...
    'String','',...
    'Callback',@cbdate);
yearsvec = mat2cell(yearsvec);
styears = uicontrol('Style','popup',...
    'Units','normalized',...
    'FontUnits','normalized',...
    'FontSize',0.45,...
    'Position',[0.27,0.5,0.06,0.04],...
    'String',yearsvec,...
    'Callback',@cbyear);
update = uicontrol('Style','pushbutton',...
    'Units','normalized',...
    'FontUnits','normalized',...
    'FontSize',0.45,...
    'Position',[0.36,0.5,0.06,0.04],...
    'String','Update',...
    'Callback', @cbupdate);

    function cbmonth(source,eventdata)
        month2 = get(stmonth,'Value');
        days = monthdays(month2);
        month2cell = 1:days;
        month2cell = mat2cell(month2cell);
        set(stdays,'String',month2cell)
    end
    function cbyear(source,eventdata)
        yearvalue = get(styears,'Value');
        actyear = yearsvec{yearvalue};
        actyear = str2num(actyear);
        checkleap1 = rem(actyear,4);
        checkleap2 = rem(actyear,100);
        checkleap3 = rem(actyear,400);
        if checkleap1 == 0
            if checkleap2 == 0
                monthdays(2) = 29;
            end
        elseif checkleap3 == 0
            monthdays(2) = 29;
        else
            monthdays(2) = 28;
        end
        currentmonth = get(stmonth,'Value');
        currentday = get(stdays,'Value');
        if currentmonth == 2
            if currentday > 28
                set(stdays,'Value',28)
            end
            %remake cell with days of the month and set it as
            %the string of the popup menu
        end
    end