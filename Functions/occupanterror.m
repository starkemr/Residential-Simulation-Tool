function [WM_Num, NM_Num, WF_Num, NF_Num, C_Num,...
    WM_Occ_Act_Prob_Norm, NM_Occ_Act_Prob_Norm, WF_Occ_Act_Prob_Norm,...
    NF_Occ_Act_Prob_Norm, C_Occ_Act_Prob_Norm, Tot_Occ_Act_Prob_Norm,...
    WM_Error, NM_Error, WF_Error, NF_Error, C_Error, Tot_Error,...
    WM_Avg_Error, NM_Avg_Error, WF_Avg_Error, NF_Avg_Error, C_Avg_Error, Tot_Avg_Error,...
    WM_Max_Error, NM_Max_Error, WF_Max_Error, NF_Max_Error, C_Max_Error, Tot_Max_Error]...
    = occupanterror(Occupants, WM_Num, NM_Num, WF_Num, NF_Num, C_Num,...
    WM_Prob_Model, NM_Prob_Model, WF_Prob_Model, NF_Prob_Model, C_Prob_Model, Tot_Prob_Model,...
    WM_Occ_Act_Prob, NM_Occ_Act_Prob, WF_Occ_Act_Prob, NF_Occ_Act_Prob, C_Occ_Act_Prob, Tot_Occ_Act_Prob,...
    WM_Avg_Error, NM_Avg_Error, WF_Avg_Error, NF_Avg_Error, C_Avg_Error, Tot_Avg_Error,...
    WM_Max_Error, NM_Max_Error, WF_Max_Error, NF_Max_Error, C_Max_Error, Tot_Max_Error)
% Calculate Occupant Activity Distribution Error
%   This function calculates the occupant activity distribution error
%   following the siumlation of each home
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 5/26/2013
%--------------------------------------------------------------------------


% Initalize Matricies

WM_Occ_Act_Prob_Norm = zeros(60*24*7,10);   % Initialize Working Male Occupant Activity Probability Matrix
NM_Occ_Act_Prob_Norm = zeros(60*24*7,10);   % Initialize Nonworking Male Occupant Activity Probability Matrix
WF_Occ_Act_Prob_Norm = zeros(60*24*7,10);   % Initialize Working Female Occupant Activity Probability Matrix
NF_Occ_Act_Prob_Norm = zeros(60*24*7,10);   % Initialize Nonworking Female Occupant Activity Probability Matrix
C_Occ_Act_Prob_Norm = zeros(60*24*7,10);    % Initialize Child Occupant Activity Probability Matrix
Tot_Occ_Act_Prob_Norm = zeros(60*24*7,10);  % Initialize Total Occupant Activity Probability Matrix

WM_Error = zeros(60*24*7,10);   % Initialize Working Male Occupant Activity Distribution Error Matrix
NM_Error = zeros(60*24*7,10);   % Initialize Nonworking Male Occupant Activity Distribution Error Matrix
WF_Error = zeros(60*24*7,10);   % Initialize Working Female Occupant Activity Distribution Error Matrix
NF_Error = zeros(60*24*7,10);   % Initialize Nonworking Female Occupant Activity Distribution Error Matrix
C_Error = zeros(60*24*7,10);    % Initialize Child Occupant Activity Distribution Error Matrix
Tot_Error = zeros(60*24*7,10);  % Initialize Child Occupant Activity Distribution Error Matrix

% Increment Occupant Type Counters

for i = 1:length(Occupants)
    
    Model_Type = Occupants(i,1);
    
    if Model_Type == 1;
        
        WM_Num = WM_Num + 1;
        
    elseif Model_Type == 2;
        
        NM_Num = NM_Num + 1;
        
    elseif Model_Type == 3;
        
        WF_Num = WF_Num + 1;
        
    elseif Model_Type == 4;
        
        NF_Num = NF_Num + 1;
        
    elseif Model_Type == 5;
        
        C_Num = C_Num + 1;
    end
end

Tot_Num = WM_Num + NM_Num + WF_Num + NF_Num + C_Num;


% Normalize Activity Probablility Matricies

for j = 1:60*24*7
    
    WM_Occ_Act_Prob_Norm(j,1:10) = WM_Occ_Act_Prob(j,1:10)/sum(WM_Occ_Act_Prob(j,1:10));
    NM_Occ_Act_Prob_Norm(j,1:10) = NM_Occ_Act_Prob(j,1:10)/sum(NM_Occ_Act_Prob(j,1:10));
    WF_Occ_Act_Prob_Norm(j,1:10) = WF_Occ_Act_Prob(j,1:10)/sum(WF_Occ_Act_Prob(j,1:10));
    NF_Occ_Act_Prob_Norm(j,1:10) = NF_Occ_Act_Prob(j,1:10)/sum(NF_Occ_Act_Prob(j,1:10));
    C_Occ_Act_Prob_Norm(j,1:10) = C_Occ_Act_Prob(j,1:10)/sum(C_Occ_Act_Prob(j,1:10));
    Tot_Occ_Act_Prob_Norm(j,1:10) = Tot_Occ_Act_Prob(j,1:10)/sum(Tot_Occ_Act_Prob(j,1:10));
    
    if isnan(WM_Occ_Act_Prob_Norm(j,1:10))
        WM_Occ_Act_Prob_Norm(j,1:10) = 0;
    end
    
    if isnan(NM_Occ_Act_Prob_Norm(j,1:10))
        NM_Occ_Act_Prob_Norm(j,1:10) = 0;
    end
    
    if isnan(WF_Occ_Act_Prob_Norm(j,1:10))
        WF_Occ_Act_Prob_Norm(j,1:10) = 0;
    end
    
    if isnan(NF_Occ_Act_Prob_Norm(j,1:10))
        NF_Occ_Act_Prob_Norm(j,1:10) = 0;
    end
    
    if isnan(C_Occ_Act_Prob_Norm(j,1:10))
        C_Occ_Act_Prob_Norm(j,1:10) = 0;
    end
    
    if isnan(Tot_Occ_Act_Prob_Norm(j,1:10))
        Tot_Occ_Act_Prob_Norm(j,1:10) = 0;
    end
end


% Calculate Absolute Error Between Simulated Occupant and Expected Probabilities

for j = 1:60*24*7
    
    WM_Error(j,1:10) = 100*abs(WM_Occ_Act_Prob_Norm(j,1:10) - WM_Prob_Model(j,1:10));
    
    if sum(WM_Occ_Act_Prob_Norm(j,1:10)) == 0   % If the Cumulative Distribution Error is 0, this Time hasn't been Calculated and should be Igonored
        WM_Error(j,1:10) = NaN;
    end
    
    
    NM_Error(j,1:10) = 100*abs(NM_Occ_Act_Prob_Norm(j,1:10) - NM_Prob_Model(j,1:10));
    
    if sum(NM_Occ_Act_Prob_Norm(j,1:10)) == 0   % If the Cumulative Distribution Error is 0, this Time hasn't been Calculated and should be Igonored
        NM_Error(j,1:10) = NaN;
    end
    
    
    WF_Error(j,1:10) = 100*abs(WF_Occ_Act_Prob_Norm(j,1:10) - WF_Prob_Model(j,1:10));
    
    if sum(WF_Occ_Act_Prob_Norm(j,1:10)) == 0   % If the Cumulative Distribution Error is 0, this Time hasn't been Calculated and should be Igonored
        WF_Error(j,1:10) = NaN;
    end
    
    
    NF_Error(j,1:10) = 100*abs(NF_Occ_Act_Prob_Norm(j,1:10) - NF_Prob_Model(j,1:10));
    
    if sum(NF_Occ_Act_Prob_Norm(j,1:10)) == 0   % If the Cumulative Distribution Error is 0, this Time hasn't been Calculated and should be Igonored
        NF_Error(j,1:10) = NaN;
    end
    
    
    C_Error(j,1:10) = 100*abs(C_Occ_Act_Prob_Norm(j,1:10) - C_Prob_Model(j,1:10));
    
    if sum(C_Occ_Act_Prob_Norm(j,1:10)) == 0    % If the Cumulative Distribution Error is 0, this Time hasn't been Calculated and should be Igonored
        C_Error(j,1:10) = NaN;
    end
    
    Tot_Error(j,1:10) = 100*abs(Tot_Occ_Act_Prob_Norm(j,1:10) - Tot_Prob_Model(j,1:10));
    
    if sum(Tot_Occ_Act_Prob_Norm(j,1:10)) == 0  % If the Cumulative Distribution Error is 0, this Time hasn't been Calculated and should be Igonored
        Tot_Error(j,1:10) = NaN;
    end
end


if WM_Num == 0
else
    WM_Avg_Error(WM_Num,1:10) = nanmean(WM_Error(:,1:10));  % Calculate Average Error for each Activity (Working Male)
    WM_Max_Error(WM_Num,1:10) = nanmax(WM_Error(:,1:10));   % Calculate Maximum Error for each Activity (Working Male)
end

if NM_Num == 0
else
    NM_Avg_Error(NM_Num,1:10) = nanmean(NM_Error(:,1:10));  % Calculate Average Error for each Activity (Nonworking Male)
    NM_Max_Error(NM_Num,1:10) = nanmax(NM_Error(:,1:10));   % Calculate Maximum Error for each Activity (Nonworking Male)
end

if WF_Num == 0
else
    WF_Avg_Error(WF_Num,1:10) = nanmean(WF_Error(:,1:10));  % Calculate Average Error for each Activity (Working Female)
    WF_Max_Error(WF_Num,1:10) = nanmax(WF_Error(:,1:10));   % Calculate Maximum Error for each Activity (Working Female)
end

if NF_Num == 0
else
    NF_Avg_Error(NF_Num,1:10) = nanmean(NF_Error(:,1:10));  % Calculate Average Error for each Activity (Nonworking Female)
    NF_Max_Error(NF_Num,1:10) = nanmax(NF_Error(:,1:10));   % Calculate Maximum Error for each Activity (Nonworking Female)
end

if C_Num == 0
else
    C_Avg_Error(C_Num,1:10) = nanmean(C_Error(:,1:10));     % Calculate Average Error for each Activity (Child)
    C_Max_Error(C_Num,1:10) = nanmax(C_Error(:,1:10));      % Calculate Maximum Error for each Activity (Child)
end

if Tot_Num == 0
else
    Tot_Avg_Error(Tot_Num,1:10) = nanmean(Tot_Error(:,1:10));   % Calculate Average Error for each Activity (Total)
    Tot_Max_Error(Tot_Num,1:10) = nanmax(Tot_Error(:,1:10));    % Calculate Maximum Error for each Activity (Total)
end

end