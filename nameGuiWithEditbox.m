function nameGuiWithEditbox
%Creates GUI with editable textbox.

f = figure('Visible','off','Color','white');
huitext = uicontrol('Style','edit','String','Aihoa','Position',[100,200,300,50],'Callback',@callbackfn);

set(f,'Visible','on');

    function callbackfn(source,eventdata)
        set([huitext],'Visible','off');
        printstr = get(huitext,'String');
        hstr = uicontrol('Style','text','BackgroundColor','white','Position',[100,425,400,55],'String',printstr);
        set(hstr,'Visible','on')
    end


end