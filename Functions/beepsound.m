function [complete] = beepsound(~)
% Produces a Beep when Run
%   Produces a beep when called by the main function
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


cf = 2000;                  % Carrier Frequency (Hz)
sf = 22050;                 % Sample Frequency (Hz)
d = 1.0;                    % Duration (s)
n = sf * d;                 % Number of Samples
s = (1:n) / sf;             % Sound Data Preparation
s = sin(2 * pi * cf * s);   % Sinusoidal Modulation
sound(s, sf);

complete = 1;

end