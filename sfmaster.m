%Salmon Falls Landslide
%Correlation scrips

%Help
%This is the master script. It runs a variety of functions to
%take raw water level logs and GPS observations from
%contemporaneous stations, performs a spline interpolations of time-series
%data, then correlates water level and landslide displacement from GPS

%------------ TO DO LIST ----------%
% 0 - Rewrite code for other users, add command prompts for all static variables 
%   that might need to be changed as experiment continues 
% 1 - Write code to allow plotting functions to be accessed from command window
% 1.1 - AND automate the most common plots within the script
% 2 - Simplify some of the code that is currently copy-pasted instead of
%   properly integrated into a function when calling multiple datasets of
%   same type
% 3 - Fix bulky import process on water logger files
% 4 - Add XCORR, cross-correlation analysis for time-lag correlation
% components, instead of the current user input of experimental lag_time

%change directory to current, active project dir
cd 'G:\My Drive\Lauer_Thesis\MATLAB\SalmonFalls';

%---------- BEGIN ----------%
clc; %clear command window of prev inputs
disp('Beginning Processing...')
disp(' ')

%---------- Initialize Variables -----------%
%Establish common dates and symbology which need to be accessed globally

%establish first and last days of experiment to clip and combine various datasets
%all dates are serial from January 1, 1970, matching GPS standards
global firstday lastday date_t date_datetime months;
firstday = 736696; % some useful dates: gps {736711} water {736771}, Jan 1 2017 {736696}
lastday = 737272;  % Change as project progresses, Current end date: July 31 2018 {737272}
dates = (firstday:lastday)';
date_t = table(dates);
date_t.Properties.VariableNames = {'date'};
date_datetime = datetime(dates, 'ConvertFrom', 'datenum');

%produce a vector of month names for aesthetic graphs
months = datetime(firstday,'ConvertFrom', 'datenum'):calmonths(1):datetime(lastday,'ConvertFrom', 'datenum');

%plot colors set so functions work consistently without manual entry
global bc yc gc;
bc = 1/255*[239,116,50]; % was previously bc = 1/255*[153,0,204];
gc = 1/255*[24,191,182];
yc = 1/255*[249,208,50];

%---------- Master Loop ----------%
cont = 'y';
while cont == 'y'
    i_run_proc = input('Process new data? y/n : ','s');
    if i_run_proc == 'y'

    %---------- Data Processing Steps ----------%
    %Run all of the processing steps
    wl_proc; 
    gps_proc; 
    
    %---------- Interpolation ----------%
    % run_proc = input('Interpolate new data? y/n : ','s');
    % if run_proc == 'y'

    %---------- Combine GPS/Water/Velocity file ----------%
    %%Uncomment if there is a need to export a compined products file
    %ALL = join(ALL_WATER,ALL_GPS,'Keys','date');
    
    %---------- Change Array Name for Plotting ----------%
%   %Deprecated
%     i_format_p = input('Change name to p_**** for plots? y/n? : ','s');
%     if i_format_p == 'y'
%         p_BASE = s_BASE;
%         p_BLOK = s_BLOK;
%         p_BLKM = s_BLKM;
%         p_BLKS = s_BLKS;
%         p_MIDB = s_MIDB;
%         p_NTOE = s_NTOE;
%         p_STOE = s_STOE;
%     end

    %---------- Plotting ----------%
    %%In progress, don't use
    %sf_plot; 

    %---------- End ----------%
    cont = input('Run again? y/n : ','s');
    disp(' ')
    end
    
    
%Clear temporary variables and choices from workspace before exiting
clear cont;
clear i*;
disp('--------------------')
disp('Exited Program')
