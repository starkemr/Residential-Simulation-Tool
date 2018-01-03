function [Activity, WM_Occ_Act_Prob, NM_Occ_Act_Prob, WF_Occ_Act_Prob,...
    NF_Occ_Act_Prob, C_Occ_Act_Prob, Tot_Occ_Act_Prob] = Occupant_Model...
    (t, min, start_time, Occupants, Activity, WM_Markov_Model, WM_Prob_Model,...
    NM_Markov_Model, NM_Prob_Model, WF_Markov_Model, WF_Prob_Model,...
    NF_Markov_Model, NF_Prob_Model, C_Markov_Model, C_Prob_Model,...
    WM_Occ_Act_Prob, NM_Occ_Act_Prob, WF_Occ_Act_Prob, NF_Occ_Act_Prob,...
    C_Occ_Act_Prob, Tot_Occ_Act_Prob)
% Simulate Occupant Behavior based on Markov Chain Probability Matrix
%   Detailed explanation goes here
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 8/7/2013
%--------------------------------------------------------------------------
% Sources:
%--------------------------------------------------------------------------


% Calculate Occupant Model Time

time = start_time + min - 1;

while time > 7*24*60
    time = time - 7*24*60;
end


% Simulate each Occupant in the Home

for i = 1:length(Occupants)
    
    Model_Type = Occupants(i,1);
    
    % Select Model Type and Load Statistical Matricies
    
    if Model_Type == 1;
        
        Markov_Model = WM_Markov_Model;
        Prob_Model = WM_Prob_Model;
        
    elseif Model_Type == 2;
        
        Markov_Model = NM_Markov_Model;
        Prob_Model = NM_Prob_Model;
        
    elseif Model_Type == 3;
        
        Markov_Model = WF_Markov_Model;
        Prob_Model = WF_Prob_Model;
        
    elseif Model_Type == 4;
        
        Markov_Model = NF_Markov_Model;
        Prob_Model = NF_Prob_Model;
        
    elseif Model_Type == 5;
        
        Markov_Model = C_Markov_Model;
        Prob_Model = C_Prob_Model;
    end
    
    
    % Simulate Occupant
    
    if t == 1   % Determine Initial Previous Activity from Activity Probabilies of Previous Minute
        
        if start_time == 1
            Initial_Act_Prob = cumsum(Prob_Model(end,1:10), 2);         % Cumulative Sum of Previous Activity Probabilities for 12:00am Sunday
        else
            Initial_Act_Prob = cumsum(Prob_Model(time - 1,1:10), 2);    % Cumulative Sum of Previous Activity Probabilities for any Other Time
        end
        
        Prev_Act = find(Initial_Act_Prob(1,10)*rand(1,1) <= Initial_Act_Prob, 1, 'first');  % Randomly Select Previous Activity based on Activity Probabilities (Empty Matrix if all Probabilities are 0)
    else
        Prev_Act = Activity(i,1);
    end
    
    Act_Prob = cumsum(Markov_Model((10*time - 10 + Prev_Act),1:10), 2);	% Cumulative Sum of Activity Transition Probabilities
    
    Activity(i,1) = find(Act_Prob(1,10)*rand(1,1) <= Act_Prob, 1, 'first'); % Randomly Select Activity based on Activity Transition Probabilities (Empty Matrix if all Probabilities are 0)
    
    
    if Model_Type == 1;
        
        WM_Occ_Act_Prob(time, Activity(i,1)) = WM_Occ_Act_Prob(time, Activity(i,1)) + 1;    % Increment Working Male Occupant Activity Probability Matrix
        
    elseif Model_Type == 2;
        
        NM_Occ_Act_Prob(time, Activity(i,1)) = NM_Occ_Act_Prob(time, Activity(i,1)) + 1;    % Increment Nonworking Male Occupant Activity Probability Matrix
        
    elseif Model_Type == 3;
        
        WF_Occ_Act_Prob(time, Activity(i,1)) = WF_Occ_Act_Prob(time, Activity(i,1)) + 1;    % Increment Working Female Occupant Activity Probability Matrix
        
    elseif Model_Type == 4;
        
        NF_Occ_Act_Prob(time, Activity(i,1)) = NF_Occ_Act_Prob(time, Activity(i,1)) + 1;    % Increment Nonworking Female Occupant Activity Probability Matrix
        
    elseif Model_Type == 5;
        
        C_Occ_Act_Prob(time, Activity(i,1)) = C_Occ_Act_Prob(time, Activity(i,1)) + 1;      % Increment Child Occupant Activity Probability Matrix
    end
    
    Tot_Occ_Act_Prob(time, Activity(i,1)) = Tot_Occ_Act_Prob(time, Activity(i,1)) + 1;      % Increment Total Occupant Activity Probability Matrix
end

end