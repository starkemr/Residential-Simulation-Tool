function [start_min, start_hour] = determinestart(month, day, year)
% Determines time to start simulation
%   Determines minute to start simulation from month and day information
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 7/18/2013
%--------------------------------------------------------------------------


ly=@(yr)~rem(yr,400)|rem(yr,100)&~rem(yr,4);  % Function to Determine if Year is a Leap Year

if ~ly(year)    % If Year is not a Leap Year
    
    if month == 1       % January
        start = 1;
    elseif month == 2   % February
        start = 24*60*(31) + 1;
    elseif month == 3   % March
        start = 24*60*(31 + 28) + 1;
    elseif month == 4   % April
        start = 24*60*(31 + 28 + 31) + 1;
    elseif month == 5   % May
        start = 24*60*(31 + 28 + 31 + 30) + 1;
    elseif month == 6   % June
        start = 24*60*(31 + 28 + 31 + 30 + 31) + 1;
    elseif month == 7   % July
        start = 24*60*(31 + 28 + 31 + 30 + 31 + 30) + 1;
    elseif month == 8   % August
        start = 24*60*(31 + 28 + 31 + 30 + 31 + 30 + 31) + 1;
    elseif month == 9   % September
        start = 24*60*(31 + 28 + 31 + 30 + 31 + 30 + 31 + 31) + 1;
    elseif month == 10  % October
        start = 24*60*(31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30) + 1;
    elseif month == 11  % November
        start = 24*60*(31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31) + 1;
    elseif month == 12  % December
        start = 24*60*(31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30) + 1;
    end
    
else    % If Year is a Leap Year
    
    if month == 1       % January
        start = 1;
    elseif month == 2   % February
        start = 24*60*(31) + 1;
    elseif month == 3   % March
        start = 24*60*(31 + 29) + 1;
    elseif month == 4   % April
        start = 24*60*(31 + 29 + 31) + 1;
    elseif month == 5   % May
        start = 24*60*(31 + 29 + 31 + 30) + 1;
    elseif month == 6   % June
        start = 24*60*(31 + 29 + 31 + 30 + 31) + 1;
    elseif month == 7   % July
        start = 24*60*(31 + 29 + 31 + 30 + 31 + 30) + 1;
    elseif month == 8   % August
        start = 24*60*(31 + 29 + 31 + 30 + 31 + 30 + 31) + 1;
    elseif month == 9   % September
        start = 24*60*(31 + 29 + 31 + 30 + 31 + 30 + 31 + 31) + 1;
    elseif month == 10  % October
        start = 24*60*(31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30) + 1;
    elseif month == 11  % November
        start = 24*60*(31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31) + 1;
    elseif month == 12  % December
        start = 24*60*(31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30) + 1;
    end
end

start_min = start + 24*60*(day - 1);    % (Min) Change Start based on Day


if start_min == 1
    start_hour = start_min;             % (Hour) Correct Start Time for Hours
else
    start_hour = (start_min-1)/60 + 1;  % (Hour) Correct Start Time for Hours
end

end