function [Washer_Power, Washer_Timer, Dryer_Power, Dryer_Timer, Dishwasher_Power, Dishwasher_Timer]...
    = Deferrable_Model (Deferrable_Inputs, Washer_Type, Dryer_Type, Dishwasher_Type, Washer_CycleTime,...
    Dryer_CycleTime, Dishwasher_CycleTime, Washer_Timer, Dryer_Timer, Dishwasher_Timer, Activity, Scaling_Factor)
% Deferrable Load Model
%   Model which simulates the deferrable loads of the home
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 1/22/2014
%--------------------------------------------------------------------------
% Sources: Muratori (Cycle Times), Widen (Load Shape)
%--------------------------------------------------------------------------


% Initialize Power Demand

Washer_Power = 0;       % (W) Initialize Washer Power Demand
Dryer_Power = 0;        % (W) Initialize Dryer Power Demand
Dishwasher_Power = 0;   % (W) Initialize Dishwasher Power Demand
Dryer_Start = 0;        % Initialize Start Dryer Variable


% Reset Appliance Timers

if Washer_Timer == Washer_CycleTime     % Turn Off Washer After Washer Cycle Time is Complete
    
    Washer_Timer = 0;   % (s or min) Reset Washer Timer
    
    Dryer_Start = 1;    % Start Dryer After Washer Finishes
end

if Dryer_Timer == Dryer_CycleTime       % Turn Off Dryer After Dryer Cycle Time is Complete
    
    Dryer_Timer = 0;    % (s or min) Reset Dryer Timer
end

if Dishwasher_Timer == Dishwasher_CycleTime     % Turn Off Dishwasher After Dishwasher Cycle Time is Complete
    
    Dishwasher_Timer = 0;   % (s or min) Reset Dishwasher Timer
end


% Calculate Power Demand

for i = 1:length(Activity)
    
    % Washer Power Demand
    
    % If Home has a Washer, the Dryer is Not On, and the Activity is Laundry, Use the Washer (Do Not Recalculate if Washer is Already On)
    
    if (Washer_Type == 1) && (Washer_Power == 0) && (Dryer_Start == 0) && (Dryer_Timer == 0) && ((Washer_Timer > 0) || (Activity(i,1) == 3))
        
        if (Deferrable_Inputs(2) + Deferrable_Inputs(3)*Scaling_Factor(1)) < 350        % (W) Minimum Washer Power Demand
            Washer_Power = 350;
        elseif (Deferrable_Inputs(2) + Deferrable_Inputs(3)*Scaling_Factor(1)) > 500    % (W) Maximum Washer Power Demand
            Washer_Power = 500;
        else
            Washer_Power = round2(Deferrable_Inputs(2) + Deferrable_Inputs(3)*Scaling_Factor(1), 15);
        end
        
        Washer_Timer = Washer_Timer + 1;    % (s or min) Increment Washer Timer
    end
    
    
    % Dryer Power Demand
    
    % If Home has a Dryer and Washer was just Used, Use the Dryer (Do Not Recalculate if Dryer is Already On)
    
    if (Dryer_Type >= 1) && (Dryer_Power == 0) && ((Dryer_Start == 1) || (Dryer_Timer > 0))
        
        if Dryer_Type == 1  % Electric Dryer
            
            if (Deferrable_Inputs(5) + Deferrable_Inputs(6)*Scaling_Factor(1)) < 1800       % (W) Minimum Electric Dryer Power Demand
                Dryer_Power = 1800;
            elseif (Deferrable_Inputs(5) + Deferrable_Inputs(6)*Scaling_Factor(1)) > 5000   % (W) Maximum Electric Dryer Power Demand
                Dryer_Power = 5000;
            else
                Dryer_Power = round2(Deferrable_Inputs(5) + Deferrable_Inputs(6)*Scaling_Factor(1), 100);
            end
        end
        
        if Dryer_Type == 2  % Nonelectric Dryer
            
            if (Deferrable_Inputs(8) + Deferrable_Inputs(9)*Scaling_Factor(1)) < 275        % (W) Minimum Nonelectric Dryer Power Demand
                Dryer_Power = 275;
            elseif (Deferrable_Inputs(8) + Deferrable_Inputs(9)*Scaling_Factor(1)) > 425    % (W) Maximum Nonelectric Dryer Power Demand
                Dryer_Power = 425;
            else
                Dryer_Power = round2(Deferrable_Inputs(8) + Deferrable_Inputs(9)*Scaling_Factor(1), 15);
            end
        end
        
        Dryer_Timer = Dryer_Timer + 1;  % (s or min) Increment Dryer Timer
    end
    
    
    % Dishwasher Power Demand
    
    % If Home has a Dishwasher and Activity is Dishwashing, Use the Dishwasher (Do Not Recalculate if Dishwasher is Already On)
    
    if (Dishwasher_Type == 1) && (Dishwasher_Power == 0) && ((Dishwasher_Timer > 0) || (Activity(i,1) == 5))
        
        if (Deferrable_Inputs(11) + Deferrable_Inputs(12)*Scaling_Factor(1)) < 1200         % (W) Minimum Dishwasher Power Demand
            Dishwasher_Power = 1200;
        elseif (Deferrable_Inputs(11) + Deferrable_Inputs(12)*Scaling_Factor(1)) > 2400     % (W) Maximum Dishasher Power Demand
            Dishwasher_Power = 2400;
        else
            Dishwasher_Power = round2(Deferrable_Inputs(11) + Deferrable_Inputs(12)*Scaling_Factor(1), 100);
        end
        
        
        % Dishwasher Piecewise Function Power Demand (90 Minute Model)
        
        if (Dishwasher_Timer <= (20/90)*Dishwasher_CycleTime) || ((Dishwasher_Timer > (40/90)*Dishwasher_CycleTime) && (Dishwasher_Timer <= (50/90)*Dishwasher_CycleTime))
            Dishwasher_Power = 120;
        elseif (Dishwasher_Timer > (70/90)*Dishwasher_CycleTime)
            Dishwasher_Power = (1/3)*Dishwasher_Power;
        end
        
        Dishwasher_Timer = Dishwasher_Timer + 1;    % (s or min) Increment Dishwasher Timer
    end
end

end