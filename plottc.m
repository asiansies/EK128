%Retrieve engine information from each data file.
RJETstruct = ReadSpecs('RJET.dat');
TFANstruct = ReadSpecs('TFAN.dat');
TJETstruct = ReadSpecs('TJET.dat');
%Prompts user for engine configuration.
config = menu('Engine Configuration','RJET','TFAN','TJET');
switch config
    case 1
        load ALTITUDE.dat
        vec = [1:length(ALTITUDE)];
        sthrust = EngineCalc(ALTITUDE(:,2),ALTITUDE(:,3),.75,RJETstruct);
        y = ALTITUDE(:,1);
        plot(vec,y)                   %Plots altitudes versus thrust.
        xlabel('Thrust (kN)')
        ylabel('Altitude (ft)')
        title('Thrust vs. Altitude for RJET')
        mach = linspace(.35,3)
        sthrust2 = EngineCalc(ALTITUDE(1,2),ALTITUDE(1,3),mach,RJETstruct);
        y2 = mach;
        hold on
        plot(vec,y2)                 %Plots thrust versus mach number.
        xlabel('Thrust (kN)')
        ylabel('Mach Number')
        title('Thrust versus Mach Number for RJET')
        
    case 2
        load ALTITUDE.dat
        vec = [1:length(ALTITUDE)];
        sthrust = EngineCalc(ALTITUDE(:,2),ALTITUDE(:,3),.75,TFANstruct);
        figure
        y = ALTITUDE(:,1);
        plot(vec,y)                   %Plots altitudes versus thrust.
        xlabel('Thrust (kN)')
        ylabel('Altitude (ft)')
        title('Thrust vs. Altitude for TFAN')
        mach = linspace(.35,3);
        sthrust2 = EngineCalc(ALTITUDE(1,2),ALTITUDE(1,3),mach,TFANstruct);
        
        y2 = mach;
        
        hold on
        plot(vec,y2)                 %Plots thrust versus mach number.
        xlabel('Thrust (kN)')
        ylabel('Mach Number')
        title('Thrust versus Mach Number for TFAN')
    case 3
        load ALTITUDE.dat
        vec = [1:length(ALTITUDE)];
        sthrust = EngineCalc(ALTITUDE(:,2),ALTITUDE(:,3),.75,TJETstruct);
        figure
        y = ALTITUDE(:,1);
        plot(vec,y)                   %Plots altitudes versus thrust.
        xlabel('Thrust (kN)')
        ylabel('Altitude (ft)')
        title('Thrust vs. Altitude for TJET')
        mach = linspace(.35,3);
        sthrust2 = EngineCalc(ALTITUDE(1,2),ALTITUDE(1,3),mach,TJETstruct);
        
        y2 = mach;
        
        hold on
        plot(vec,y2)                 %Plots thrust versus mach number.
        xlabel('Thrust (kN)')
        ylabel('Mach Number')
        title('Thrust versus Mach Number for TJET')
end