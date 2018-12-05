%This is experimental code to import the historical data from Dorsch_et_al
%IT IS WORKING AS INTENDED BUT VALUES DO NOT MATCH PUBLISHED DATA
%High suspicion that published data was cleaned in some way, need to do
%statistical analysis of differences in datasets to understand why

%Dorsch data
    % d_BLOK
    % d_MIDB
    % d_NTOE
    % d_STOE
    
i_proc = input('Process Dorsch. y/n: ', 's');
if i_proc == 'y'    
    %Actual dates are +1 days from index, ei Feb 9, 7, 7, 10, 2003 respectively
    %Original date from file starts at 1, accounting for difference
    %Day 1 Values:
    i_d1_B = datetime(2003,02,08);
    i_d1_M = datetime(2003,02,06);
    i_d1_N = datetime(2003,02,06);
    i_d1_S = datetime(2003,02,09);

    %Serial dates needed for calculation
    i_d1_B = datenum(i_d1_B);
    i_d1_M = datenum(i_d1_M);
    i_d1_N = datenum(i_d1_N);
    i_d1_S = datenum(i_d1_S);

    %Calculate serial date from original 'experiment' days
    d_BLOK.date = d_BLOK.date + i_d1_B;
    d_MIDB.date = d_MIDB.date + i_d1_M; 
    d_NTOE.date = d_NTOE.date + i_d1_N;
    d_STOE.date = d_STOE.date + i_d1_S;

    %Convert back to datetime for plotting and analysis
    d_BLOK.date = datetime(d_BLOK.date, 'ConvertFrom', 'datenum');
    d_MIDB.date = datetime(d_MIDB.date, 'ConvertFrom', 'datenum');
    d_NTOE.date = datetime(d_NTOE.date, 'ConvertFrom', 'datenum');
    d_STOE.date = datetime(d_STOE.date, 'ConvertFrom', 'datenum');

    %Switch from m to mm
    d_BLOK.v = d_BLOK.v*1000;
    d_MIDB.v = d_MIDB.v*1000;
    d_NTOE.v = d_NTOE.v*1000;
    d_STOE.v = d_STOE.v*1000;
end

i_plot = input('Plot Dorsch. y/n: ', 's');
if i_plot == 'y'
    %Plot?
    figure
    subplot(4,1,1)
    plot(d_BLOK.date,d_BLOK.v, 'o')
    title('BLOK')
    ylabel('change (mm)?')

    subplot(4,1,2)
    plot(d_MIDB.date, d_MIDB.v, 'o')
    title('MIDB')
    ylabel('change (mm)?')

    subplot(4,1,3)
    plot(d_NTOE.date, d_NTOE.v, 'o')
    title('NTOE')
    ylabel('change (mm)?')

    subplot(4,1,4)
    plot(d_STOE.date, d_STOE.v, 'o')
    title('STOE')
    ylabel('change (mm)?')
end
clear i_*;


