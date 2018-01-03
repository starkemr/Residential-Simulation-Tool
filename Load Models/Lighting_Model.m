function [Prev_SimPower, Lighting_Power, Incandescent_Power, Halogen_Power, Fluorescent_Power, CFL_Power, LED_Power]...
    = Lighting_Model(t, Activity, Lighting_Profile, Prev_SimPower, L, L_lim, Q_adj, Delta_P, P_absent,...
    P_inactive, P_min, P_max)
% Lighting Load Model
%   Model which simulates the lighting load of the home
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 6/6/2013
%--------------------------------------------------------------------------
% Sources: Joakim Widen (Modified for Different Lighting Types)
%--------------------------------------------------------------------------


% Initialize Lighting Power Demand

Lighting_Power = 0;     % (W) Initialize Lighting Power Demand
Incandescent_Power = 0; % (W) Initialize Incandescent Lighting Power Demand
Halogen_Power = 0;      % (W) Initialize Halogen Lighting Power Demand
Fluorescent_Power = 0;  % (W) Initialize Linear Fluorescent Lighting Power Demand
CFL_Power = 0;          % (W) Initialize Compact Fluorescent Lighting Power Demand
LED_Power = 0;          % (W) Initialize LED Lighting Power Demand

SimPower = zeros(length(Activity),1);   % Initialize Simulated Lighting Power


% Calculate Lighting Power Demand

for i = 1:length(Activity)
    
    % Determine Ideal Lighting Level
    
    if Activity(i,1) == 1           % If Occupant Activity is Sleeping
        
        P_ideal = P_inactive(i,1);
        
    elseif Activity(i,1) >= 9       % If Occupant Activity is Away or Away, Traveling
        
        P_ideal = P_absent(i,1);
        
    elseif Activity(i,1) > 1 && Activity(i,1) < 9   % If Activity is Anything Else
        
        if L > L_lim                % If Daylight Level is Greater than the Limiting Daylight Level
            
            P_ideal = P_min(i,1);
            
        elseif L <= L_lim           % If Daylight Level is Less than or Equal to the Limiting Daylight Level
            
            P_ideal = P_min(i,1)*(L/L_lim) + P_max(i,1)*(1 - (L/L_lim));
        end
    end
    
    
    % Set Initial Previous Simulated Lighting Power
    
    if t == 1
        Prev_SimPower(i,1) = P_ideal;   % (W) Set Previous Simulated Lighting Power to Ideal Lighting Level
    end
    
    
    % Lighting Power Demand
    
    if rand(1) <= Q_adj
        
        if Activity(i,1) == 1 || Activity(i,1) >= 9     % If Activity is Sleeping, Away, or Away, Traveling
            
            SimPower(i,1) = P_ideal;
            
        elseif Activity(i,1) > 1 && Activity(i,1) < 9   % If Activity is Anything Else
            
            if Prev_SimPower(i,1) - P_ideal > 0 && abs(Prev_SimPower(i,1) - Delta_P - P_ideal) < abs(Prev_SimPower(i,1) - P_ideal)
                
                SimPower(i,1) = Prev_SimPower(i,1) - Delta_P;
                
            elseif Prev_SimPower(i,1) - P_ideal < 0 && abs(Prev_SimPower(i,1) + Delta_P - P_ideal) < abs(Prev_SimPower(i,1) - P_ideal)
                
                SimPower(i,1) = Prev_SimPower(i,1) + Delta_P;
                
            else
                SimPower(i,1) = Prev_SimPower(i,1);
            end
        end
    else
        SimPower(i,1) = Prev_SimPower(i,1);
    end
    
    
    % Lighting Power Demand by Type
    
    if SimPower(i,1) ~= 0
        
        for j = 1:(SimPower(i,1)/Delta_P)   % Increment Lighting Power based on Type
            
            if Lighting_Profile(i,j) == 1   % If Lighting Type is Incandescent
                
                Lighting_Power = Lighting_Power + Delta_P;          % (W) Lighting Power Demand
                Incandescent_Power = Incandescent_Power + Delta_P;  % (W) Incandescent Lighting Power Demand
                
            elseif Lighting_Profile(i,j) == 2   % If Lighting Type is Halogen
                
                Lighting_Power = Lighting_Power + (29/40)*Delta_P;  % (W) Lighting Power Demand
                Halogen_Power = Halogen_Power + (29/40)*Delta_P;    % (W) Halogen Lighting Power Demand
                
            elseif Lighting_Profile(i,j) == 3   % If Lighting Type is Linear Fluorescent
                
                Lighting_Power = Lighting_Power + (8/40)*Delta_P;       % (W) Lighting Power Demand
                Fluorescent_Power = Fluorescent_Power + (8/40)*Delta_P; % (W) Linear Fluorescent Lighting Power Demand
                
            elseif Lighting_Profile(i,j) == 4   % If Lighting Type is Compact Fluorescent
                
                Lighting_Power = Lighting_Power + (11/40)*Delta_P;  % (W) Lighting Power Demand
                CFL_Power = CFL_Power + (11/40)*Delta_P;            % (W) Compact Fluorescent Lighting Power Demand
                
            elseif Lighting_Profile(i,j) == 5   % If Lighting Type is LED
                
                Lighting_Power = Lighting_Power + (6/40)*Delta_P;   % (W) Lighting Power Demand
                LED_Power = LED_Power + (6/40)*Delta_P;             % (W) LED Lighting Power Demand
            end
        end
    end
end

Prev_SimPower = SimPower;   % (W) Set Previous Simulated Lighting Power

end