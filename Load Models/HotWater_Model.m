function [WaterHeater_WaterFlow, Washer_WaterFlow, Dishwasher_WaterFlow, Washer_State, Dishwasher_State,...
    Shower_Timer, Bath_Timer, Sink_Timer] = HotWater_Model(time_step, WaterHeater_Inputs, Dishwasher_Type,...
    WaterInlet_Temp, Water_Temp, Water_TempU, Washer_Timer, Dishwasher_Timer, Washer_State, Dishwasher_State,...
    Shower_Timer, Bath_Timer, Sink_Timer, Activity)
% Hot Water Usage Model
%   Model which simulates the hot water usage in the home
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 7/21/2014
%--------------------------------------------------------------------------
% Sources: Kondoh (Water Demand Values), Building America House Simulation Protocols
%--------------------------------------------------------------------------


% Initialize Variables

Shower_Flag = 0;    % (In Use or Not In Use) Set Shower Flag
Bath_Flag = 0;      % (In Use or Not In Use) Set Bath Flag
Sink_Flag = 0;      % (In Use or Not In Use) Set Sink Flag

WaterHeater_WaterFlow = 0;  % (gal/s or gal/min) Initialize Hot Water Demand of Water Heater
Washer_WaterFlow = 0;       % (gal/s or gal/min) Initialize Hot Water Demand of Washer
Dishwasher_WaterFlow = 0;   % (gal/s or gal/min) Initialize Hot Water Demand of Dishwasher
HotWater_Percentage = 0;    % (%) Initialize Percentage of Total Water Demand from Water Heater (Hot Water)

Shower_CycleTime = 10*time_step;        % (s or min) Shower Hot Water Cycle Time
Shower_CycleTime_Total = 30*time_step;  % (s or min) Total Shower Cycle Time
Bath_CycleTime = 5*time_step;           % (s or min) Bath Hot Water Cycle Time
Bath_CycleTime_Total = 45*time_step;    % (s or min) Total Bath Cycle Time
Sink_CycleTime = 1*time_step;           % (s or min) Sink Hot Water Cycle Time
Sink_CycleTime_Total = 1*time_step;     % (s or min) Total Sink Cycle Time
Washer_CycleTime = 7*time_step;         % (s or min) Washer Hot Water Cycle Time
Dishwasher_CycleTime = 9*time_step;     % (s or min) Dishwasher Hot Water Cycle Time


% Washer Hot Water Demand

% Assumes a 50 % Chance of Washer Demanding Hot Water instead of Cold Water

if Washer_Timer == 1
    
    if rand(1) <= 0.5
        
        Washer_State = 1;   % (Demand Hot Water) State of Washer
    else
        Washer_State = 0;   % (Demand Cold Water) State of Washer
    end
end

% For the First 7 Minutes of the Washer Cycle, Use Hot Water

if (Washer_Timer >= 1) && (Washer_Timer <= Washer_CycleTime)
    
    Washer_WaterFlow = (WaterHeater_Inputs(14)/Washer_CycleTime)*Washer_State;  % (gal/s or gal/min) Hot Water Demand of Washer
    
    WaterHeater_WaterFlow = WaterHeater_WaterFlow + Washer_WaterFlow;   % (gal/s or gal/min) Hot Water Demand of Water Heater
end


% Dishwasher Hot Water Demand

% Assumes a 100 % Chance of Dishwasher Demanding Hot Water instead of Cold Water

if Dishwasher_Timer == 1
    
    Dishwasher_State = 1;   % (Demand Hot Water) State of Dishwasher
end

% For the First 9 Minutes of the Dishwasher Cycle, Use Hot Water

if (Dishwasher_Timer >= 1) && (Dishwasher_Timer <= Dishwasher_CycleTime)
    
    Dishwasher_WaterFlow = (WaterHeater_Inputs(15)/Dishwasher_CycleTime)*Dishwasher_State;  % (gal/s or gal/min) Hot Water Demand of Dishwasher
    
    WaterHeater_WaterFlow = WaterHeater_WaterFlow + Dishwasher_WaterFlow;   % (gal/s or gal/min) Hot Water Demand of Water Heater
end


% Initialize Showering and Bathing Variables

Shower_State = 0;   % Initialize Shower State
Bath_State = 0;     % Initialize Bath State

if rand(1) <= 0.8   % Probablity of an Occupant Showering Instead of Bathing (80 %)
    
    Shower_State = 1;   % Occupant will take a Shower
else
    Bath_State = 1;     % Occupant will take a Bath
end

% Reset Shower, Bath, and Sink Timers

if Shower_Timer == Shower_CycleTime_Total   % Turn Off Shower After Total Shower Cycle Time is Complete
    
    Shower_Timer = 0;   % (s or min) Reset Shower Timer
end

if Bath_Timer == Bath_CycleTime_Total   % Turn Off Bath After Total Bath Cycle Time is Complete
    
    Bath_Timer = 0;     % (s or min) Reset Bath Timer
end

if Sink_Timer == Sink_CycleTime_Total   % Turn Off Sink After Total Sink Cycle Time is Complete
    
    Sink_Timer = 0;     % (s or min) Reset Sink Timer
end


% Shower, Bath, and Sink Hot Water Demand

for i = 1:length(Activity)
    
    % Shower Hot Water Demand
    
    % If Activity is Grooming, Shower State = 1, or Shower is Already On, Use Hot Water (Do Not Recalculate if Shower or Bath is Already in Use)
    
    if (Shower_Flag == 0) && (Bath_Timer == 0) && ((Shower_Timer > 0) || ((Activity(i,1) == 2) && (Shower_State == 1) && (rand(1) <= (0.025/time_step))))
        
        if Shower_Timer < Shower_CycleTime  % If Shower Timer is Less than Shower Hot Water Cycle Time
            
            if WaterHeater_Inputs(1) == 1       % One-Node Water Heater Model
                HotWater_Percentage = (min(Water_Temp, 110) - WaterInlet_Temp)/(Water_Temp - WaterInlet_Temp);      % (%) Percentage of Total Water Demand from Water Heater (Hot Water)
                
            elseif WaterHeater_Inputs(1) == 2   % Two-Node Water Heater Model
                HotWater_Percentage = (min(Water_TempU, 110) - WaterInlet_Temp)/(Water_TempU - WaterInlet_Temp);    % (%) Percentage of Total Water Demand from Water Heater (Hot Water)
            end
            
            Shower_WaterFlow = HotWater_Percentage*(WaterHeater_Inputs(12)/Shower_CycleTime);   % (gal/s or gal/min) Hot Water Demand of Shower
            
            WaterHeater_WaterFlow = WaterHeater_WaterFlow + Shower_WaterFlow;   % (gal/s or gal/min) Hot Water Demand of Water Heater
        else
        end
        
        Shower_Timer = Shower_Timer + 1;    % (s or min) Increment Shower Timer
        
        Shower_Flag = 1;    % (In Use) Raise Shower Flag
    end
    
    
    % Bath Hot Water Demand
    
    % If Activity is Grooming, Bath State = 1, or Bath is Already On, Use Hot Water (Do Not Recalculate if Shower or Bath is Already in Use)
    
    if (Bath_Flag == 0) && (Shower_Timer == 0) && ((Bath_Timer > 0) || ((Activity(i,1) == 2) && (Bath_State == 1) && (rand(1) <= (0.025/time_step))))
        
        if Bath_Timer < Bath_CycleTime  % If Bath Timer is Less than Bath Hot Water Cycle Time
            
            if WaterHeater_Inputs(1) == 1       % One-Node Water Heater Model
                HotWater_Percentage = (min(Water_Temp, 110) - WaterInlet_Temp)/(Water_Temp - WaterInlet_Temp);      % (%) Percentage of Total Water Demand from Water Heater (Hot Water)
                
            elseif WaterHeater_Inputs(1) == 2   % Two-Node Water Heater Model
                HotWater_Percentage = (min(Water_TempU, 110) - WaterInlet_Temp)/(Water_TempU - WaterInlet_Temp);    % (%) Percentage of Total Water Demand from Water Heater (Hot Water)
            end
            
            Bath_WaterFlow = HotWater_Percentage*(WaterHeater_Inputs(13)/Bath_CycleTime);   % (gal/s or gal/min) Hot Water Demand of Bath
            
            WaterHeater_WaterFlow = WaterHeater_WaterFlow + Bath_WaterFlow; % (gal/s or gal/min) Hot Water Demand of Water Heater
        else
        end
        
        Bath_Timer = Bath_Timer + 1;    % (s or min) Increment Bath Timer
        
        Bath_Flag = 1;  % (In Use) Raise Bath Flag
    end
    
    
    % Sink Hot Water Demand
    
    % If Activity is Grooming, Food Preparation, Dishwashing, or Sink is Already On, Use Hot Water (Do Not Recalculate if Sink is Already in Use)
    
    if (Sink_Flag == 0) && ((Sink_Timer > 0) || (((Activity(i,1) == 2) || (Activity(i,1) == 4)) && (rand(1) <= (0.025/time_step))) || ((Activity(i,1) == 5) && (Dishwasher_Type == 0)))
        
        if Sink_Timer < Sink_CycleTime  % If Sink Timer is Less than Sink Hot Water Cycle Time
            
            if WaterHeater_Inputs(1) == 1       % One-Node Water Heater Model
                HotWater_Percentage = (min(Water_Temp, 110) - WaterInlet_Temp)/(Water_Temp - WaterInlet_Temp);      % (%) Percentage of Total Water Demand from Water Heater (Hot Water)
                
            elseif WaterHeater_Inputs(1) == 2   % Two-Node Water Heater Model
                HotWater_Percentage = (min(Water_TempU, 110) - WaterInlet_Temp)/(Water_TempU - WaterInlet_Temp);    % (%) Percentage of Total Water Demand from Water Heater (Hot Water)
            end
            
            Sink_WaterFlow = HotWater_Percentage*(WaterHeater_Inputs(16)/Sink_CycleTime);   % (gal/s or gal/min) Hot Water Demand of Sink
            
            WaterHeater_WaterFlow = WaterHeater_WaterFlow + Sink_WaterFlow; % (gal/s or gal/min) Hot Water Demand of Water Heater
        else
        end
        
        Sink_Timer = Sink_Timer + 1;    % (s or min) Increment Sink Timer
        
        Sink_Flag = 1;  % (In Use) Raise Sink Flag
    end
end

end