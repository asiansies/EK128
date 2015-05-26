function RareaGUI
%GUI that calculates the area of a rectangle
 
f = figure('Visible','off','Color','white','Position',[360,500,300,300]);
length = 0;
width = 0;
area = 0;

hstext = uicontrol('Style','text','BackgroundColor','white','Position',[120,150,40,40],'String','X');
hstext2 = uicontrol('Style','text','BackgroundColor','white','Position',[200,150,40,40],'String','=');
hstext3 = uicontrol('Style','text','BackgroundColor','white','Position',[240,150,40,40],'Visible','off');
hstext4 = uicontrol('Style','text','BackgroundColor','white','Position',[75,175,50,50],'String','Length');
hstext5 = uicontrol('Style','text','BackgroundColor','white','Position',[155,175,50,50],'String','Width');
huitext = uicontrol('Style','edit','Position',[80,170,40,40],'String',num2str(length));
huitext2 = uicontrol('Style','edit','Position',[160,170,40,40],'String',num2str(width),'Callback',@callfbackfn);

set(f,'Name','Area of a Rectangle')
movegui(f,'center')

hbutton = uicontrol('Style','pushbutton','String','Find area!','Position',[100,50,100,50],'Callback',@callbackfn);

set(f,'Visible','on');

    function callbackfn(source,eventdata)
        length = str2num(get(huitext,'String'));
        width = str2num(get(huitext2,'String'));
        set(hstext3,'Visible','on','String',num2str(length*width))
    end
end


