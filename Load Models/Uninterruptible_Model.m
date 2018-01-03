function [Cooking_Power, Television_Power, Computer_Power] = Uninterruptible_Model...
    (Uninterruptible_Inputs, Cooking_Type, Television_Type, Computer_Type, Activity, Scaling_Factor)
% Uninterruptible Load Model
%   Model which simulates the uninterruptible loads of the home
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 6/30/2013
%--------------------------------------------------------------------------
% Sources: Joakim Widen
%--------------------------------------------------------------------------


% Initialize Power Demand and Counters

Cooking_Power = 0;              % (W) Initialize Cooking Power Demand
Television_Power = 0;           % (W) Initialize Television Power Demand
Television_PowerStandby = 0;    % (W) Initialize Television Standby Power Demand
Computer_Power = 0;             % (W) Initialize Computer Power Demand
Computer_PowerStandby = 0;      % (W) Initialize Computer Standby Power Demand

Television_Count = 0;   % Initialize Count for Number of Televisions per Home
Computer_Count = 0;     % Initialize Count for Number of Computers per Home


% Calculate Power Demand

for i = 1:length(Activity)
    
    % Cooking Power Demand
    
    % If Home has Cooking and Activity is Food Preparation Use the Cooking (Do Not Recalculate if Cooking is Already On)
    
    if (Cooking_Type == 1) && (Cooking_Power == 0) && (Activity(i,1) == 4)
        
        if (Uninterruptible_Inputs(2) + Uninterruptible_Inputs(3)*Scaling_Factor(1)) < 1100     % (W) Minimum Cooking Power Demand
            Cooking_Power = 1100;
        elseif (Uninterruptible_Inputs(2) + Uninterruptible_Inputs(3)*Scaling_Factor(1)) > 1400 % (W) Maximum Cooking Power Demand
            Cooking_Power = 1400;
        else
            Cooking_Power = round2(Uninterruptible_Inputs(2) + Uninterruptible_Inputs(3)*Scaling_Factor(1), 25);
        end
    end
    
    
    % Television Power Demand
    
    if (Television_Type == 1) && (Activity(i,1) == 6)   % If Home has Televisions and Activity is Watching Television Turn On Television
        
        if Television_Count < Uninterruptible_Inputs(4) % Define Maximum Number of Televisions per Home
            
            Television_Count = Television_Count + 1;    % Increment Number of Televisions per Home
            
            if (Uninterruptible_Inputs(5) + Uninterruptible_Inputs(6)*Scaling_Factor(1)) < 65       % (W) Minimum Television Power Demand
                Television_Power = Television_Power + 65;
            elseif (Uninterruptible_Inputs(5) + Uninterruptible_Inputs(6)*Scaling_Factor(1)) > 170  % (W) Maximum Television Power Demand
                Television_Power = Television_Power + 170;
            else
                Television_Power = Television_Power + round2(Uninterruptible_Inputs(5) + Uninterruptible_Inputs(6)*Scaling_Factor(1), 5);
            end
        end
    end
    
    
    % Computer Power Demand
    
    if (Computer_Type == 1) && (Activity(i,1) == 7)     % If Home has Computers and Activity is Using Computer Turn On Computer
        
        if Computer_Count < Uninterruptible_Inputs(8)   % Define Maximum Number of Computers per Home
            
            Computer_Count = Computer_Count + 1;        % Increment Number of Computers per Home
            
            if (Uninterruptible_Inputs(9) + Uninterruptible_Inputs(10)*Scaling_Factor(1)) < 240     % (W) Minimum Computer Power Demand
                Computer_Power = Computer_Power + 240;
            elseif (Uninterruptible_Inputs(9) + Uninterruptible_Inputs(10)*Scaling_Factor(1)) > 300 % (W) Maximum Computer Power Demand
                Computer_Power = Computer_Power + 300;
            else
                Computer_Power = Computer_Power + round2(Uninterruptible_Inputs(9) + Uninterruptible_Inputs(10)*Scaling_Factor(1), 5);
            end
        end
    end
end


% Calculate Standby Power Demand

if Television_Type == 1 % If Home has Televisions
    
    Television_PowerStandby = Uninterruptible_Inputs(7)*(min([Uninterruptible_Inputs(4), length(Activity)]) - Television_Count);    % (W) Television Standby Power Demand
end

if Computer_Type == 1   % If Home has Computers
    
    Computer_PowerStandby = Uninterruptible_Inputs(11)*(min([Uninterruptible_Inputs(8), length(Activity)]) - Computer_Count);   % (W) Computer Standby Power Demand
end


Television_Power = Television_Power + Television_PowerStandby;  % (W) Television Power Demand

Computer_Power = Computer_Power + Computer_PowerStandby;    % (W) Computer Power Demand

end