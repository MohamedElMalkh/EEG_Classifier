function Hd = Hz_60_Filter
%HZ_60_FILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.11 and DSP System Toolbox 9.13.
% Generated on: 02-Dec-2022 16:38:56

% IIR Notching filter designed using the IIRNOTCH function.

% All frequency values are in Hz.
Fs = 256;  % Sampling Frequency

Fnotch = 60;  % Notch Frequency
Q      = 45;  % Q-factor
Apass  = 1;   % Bandwidth Attenuation

BW = Fnotch/Q;

% Calculate the coefficients using the IIRNOTCHPEAK function.
[b, a] = iirnotch(Fnotch/(Fs/2), BW/(Fs/2), Apass);
Hd     = dfilt.df2(b, a);

% [EOF]