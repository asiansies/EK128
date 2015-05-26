function [sthrust varargout] = EngineCalc(temp, pres, mach, outstruct)
%This function will calculate the temperature and pressures of different
%components of the engines.
%Format of call: EngineCalc(temp, pres, mach, outstruct)
%Calculate atmospheric temperature and pressure
poa = (pres*(1+((1.4-1)/2)*mach.^2).^(1.4/.4));
toa = (temp*(1+((1.4-1)/2)*mach.^2));
%Define variables
tturb=[];
tnoz = [];
tfturb = [];
tfnoz = [];
tfan=[];
tdiff = [];
tcmp = [];
tcmb=[];
pdiff=[];
pcmp=[];
pcmb=[];
pnoz=[];
pturb=[];
cpcomp = [];
cpturb = [];
tauturb = [];
tcomp = [];
taucmp = [];
Tturb = [];
Tnoz = [];
taufan = [];
taufturb = [];
cpfan = [];
pfnoz = [];
%Each function after this calculates the individual pressures and
%temperatures for the component that they are named after.
    function Diffuser
        pdiff = (outstruct.Diffuser.Pi)*poa;
        tdiff = toa;
    end
    function Compressor
        pcmp = (outstruct.Compressor.Pi)*pdiff;
        taucmp = (outstruct.Compressor.Pi)*(((outstruct.Compressor.Gam)-1)/(outstruct.Compressor.Gam));
        tcmp = tdiff+((tdiff*(taucmp-1))/(outstruct.Compressor.Eff));
        cpcomp = (287*(outstruct.Compressor.Gam))/((outstruct.Compressor.Gam)-1);
    end
    function Combustor
        if isfield(outstruct,'Compressor') == 1
            pcmb = (outstruct.Combustor.Pi)*pcmp;
            tcmb = outstruct.BurnT;
        else
            tcmb = outstruct.BurnT;
            pcmb = (outstruct.Combustor.Pi)*pdiff;
        end
    end

    function Turbine
        if isfield(outstruct,'Turbine')
            cpturb = (287*(outstruct.Turbine.Gam))/((outstruct.Turbine.Gam)-1);
            tturb = tcmb - (cpcomp*(tcmp-tdiff)/cpturb);
            Tturb = tcmb - (tcmb-tturb)/(outstruct.Turbine.Eff);
            tauturb = Tturb/tcmb;
            pturb = pcmb*(tauturb)^((outstruct.Turbine.Gam)/((outstruct.Turbine.Gam)-1));
        end
    end
    function Nozzle
        pnoz = pres;
        Tnoz = tturb*(pnoz/pturb)^((outstruct.Nozzle.Gam)/((outstruct.Nozzle.Gam)-1));
        tnoz = tturb - outstruct.Nozzle.Eff*(tturb-Tnoz);
    end
    function Fan
        pfan = outstruct.Fan.Pi*pdiff;
        taufan = ((outstruct.Fan.Pi^((outstruct.Fan.Gam)/((outstruct.Fan.Gam)-1))-1)/outstruct.Fan.Eff)+1;
        tfan = taufan*tdiff;
    end
    function FanNozzle
        pfnoz = (pfan*(1+(1-outstruct.FanNozzle.Gam)/(outstruct.FanNozzle.Eff*(1+outstruct.FanNozzle.Gam))))^((outstruct.FanNozzle.Gam)/((outstruct.FanNozzle.Gam)-1));
        tfnoz = (2*tfan)/(1+outstruct.FanNozzle.Gam);
        
    end
    function [noztemp varargout] = NozzleTemp(varargin)
        if isfield(oustruct,'Turbine')
            noztemp = tcmb;
            vara
        end
        if nargout == 2
            noztemp = tnoz;
            varargout{1} = tfnoz;
            
        else
            noztemp = tnoz;
        end
    end
    function FanTurbine
        pfturb = (pcmb*(1-((1-tauturb)/(outstruct.FanTurbine.Eff))^(outstruct.FanTurbine.Gam/((outstruct.FanTurbine.Gam)-1))));
        tfturb = tcmb - (cpcomp*(tcomp-tdiff)+outstruct.Bypass*cpfan*(tfan-tdiff))/cpturb;
        taufturb = tturb/tcmb;
    end
%Retrieves components for engine.
field_names = fieldnames(outstruct);
a = 0;
for i = 1:numel(field_names)
    if strcmp(field_names{i-a},'Mdot')
        field_names(i) = [];
        a = 1;
    end
end
a = 0;
for i = 1:numel(field_names)
    if strcmp(field_names{i-a},'BurnT')
        field_names(i) = [];
        a=1;
    end
end
a=0;
for i = 1:numel(field_names)
    if strcmp(field_names{i-a},'Bypass')
        field_names(i) = [];
        a = 1;
    end
end
a = 0;
for i = 1:numel(field_names)
    if strcmp(field_names{i-a},'Nozzle')
        field_names(i) = [];
        a = 1;
    end
end
a = 0;
for i = 1:numel(field_names)
    if strcmp(field_names{i-a},'FanNozzle')
        field_names(i) = [];
        a = 1;
    end
end
% Calls functions to calculate pressures and temperatures of applicable components.
for i = 1:length(field_names)
    eval(field_names{i});
end
%Calculates thrust.
cpnoz = (287*(outstruct.Nozzle.Gam))/((outstruct.Nozzle.Gam)-1);
if isfield(outstruct,'FanNozzle') == 1
    cpfnoz = (287*(outstruct.FanNozzle.Gam))/((outstruct.FanNozzle.Gam)-1);
    nvel = sqrt(2*cpnoz*(tfturb - tnoz));
    sthrust = nvel*(outstruct.Mdot);
    sthrust = sthrust/1000;
    fvel = sqrt(2*cpfnoz*(tfan - tfnoz));
    sfthrust = (outstruct.Bypass)*fvel;
    sfthrust = sfthrust/1000;
    temperature = struct('Diffuser',tdiff,'Fan',tfan,'Compressor',tcmp,'Combustor',temp,'FanTurbine',tfturb,'Nozzle',tnoz,'FanNozzle',tfnoz);
    pressure = struct('Diffuser',pdiff,'Fan',pfan,'Compressor',pcmp,'Combustor',pcmb,'FanTurbine',pfturb,'Nozzle',pnoz,'FanNozzle',pfnoz);
elseif isfield(outstruct,'Turbine') == 1
    nvel = sqrt(2*cpnoz*(tturb - tnoz));
    sthrust = nvel*(outstruct.Mdot);
    sthrust = sthrust/1000;
    temperature = struct('Diffuser',tdiff,'Compressor',tcmp,'Combustor',temp,'Turbine',tturb,'Nozzle',tnoz);
    pressure = struct('Diffuser',pdiff,'Compressor',pcmp,'Combustor',pcmb,'Turbine',pturb,'Nozzle',pnoz);
else
    nvel = sqrt(2*cpnoz*(tcmb - tnoz));
    sthrust = nvel*(outstruct.Mdot);
    sthrust = sthrust/1000;
    temperature = struct('Diffuser',tdiff,'Combustor',temp,'Nozzle',tnoz);
    pressure = struct('Diffuser',pdiff,'Combustor',pcmb,'Nozzle',pnoz);
end
if nargout == 3
    varargout{1} = temperature;
    varargout{2} = pressure;
    
end
thrust = 1;
end