% Plots Expected Occupant Activity Distributions for Each Occupant Type
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 3/1/2014
%--------------------------------------------------------------------------
% Sources:
%--------------------------------------------------------------------------

clear all;  % Clear Workspace
close all;  % Close All Windows
clc;        % Clear Command Window

% Define Directories

home = cd;

if isdir(fullfile(home,'Output Data','Figures'))
else
    mkdir(fullfile(home,'Output Data','Figures'))
end

% Define Start and End Times

start_day = 1;  % Start Day (1-7, Sunday-Saturday)
end_day = 2;    % End Day (1-7, Sunday-Saturday)

start_time = (24*60)*(start_day - 1) + 1;                               % (Minute) Start Time
end_time = (24*60)*(start_day - 1) + 24*60*(end_day - start_day + 1);   % (Minute) End Time

% Define Color Map

Map = colormap(jet(100));
Map = Map(1:11:100,:);
set(gcf,'DefaultAxesColorOrder',Map)

% Plot Outputs

for Model_Type = 1:5
    
    % Select Model Type
    
    if Model_Type == 1;
        
        Prob_Model = 'Working_Male_Probability_Matrix';
        File_Name = 'WorkingMaleExpectedDistribution';
        Str_Type = 'Working Male Occupant';
        
    elseif Model_Type == 2;
        
        Prob_Model = 'Nonworking_Male_Probability_Matrix';
        File_Name = 'NonworkingMaleExpectedDistribution';
        Str_Type = 'Nonworking Male Occupant';
        
    elseif Model_Type == 3;
        
        Prob_Model = 'Working_Female_Probability_Matrix';
        File_Name = 'WorkingFemaleExpectedDistribution';
        Str_Type = 'Working Female Occupant';
        
    elseif Model_Type == 4;
        
        Prob_Model = 'Nonworking_Female_Probability_Matrix';
        File_Name = 'NonworkingFemaleExpectedDistribution';
        Str_Type = 'Nonworking Female Occupant';
        
    elseif Model_Type == 5;
        
        Prob_Model = 'Child_Probability_Matrix';
        File_Name = 'ChildExpectedDistribution';
        Str_Type = 'Child Occupant';
    end
    
    Occ_Act_Prob = csvread(fullfile(home,'Input Data','Occupant Behavior Models',strcat(Prob_Model,'.csv')));
    
    figure(Model_Type)
    area(100*Occ_Act_Prob(start_time:end_time,1:10))
    grid on
    colormap jet
    set(gca,'Layer','top')
    title(strcat(Str_Type,' Expected Distribution'))
    ylabel('Probability (%)')
    set(gca,'XTick',1:6*60:end_time + 1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
    legend('Sleeping','Grooming','Laundry','Food Preparation','Washing Dishes',...
        'Watching Television','Using Computer','Non-Power Activity','Away','Away, Traveling','Location','NorthEastOutside')
    axis([1 (length(start_time:end_time) + 1) 0 100])
    set(gcf, 'PaperPositionMode', 'manual');
    set(gcf, 'PaperUnits', 'inches');
    set(gcf, 'PaperPosition', [0.25 2.5 16.0 8.0]);
    print(figure(Model_Type),'-dpng',fullfile(home,'Output Data','Figures',strcat(File_Name,'.png')));
end