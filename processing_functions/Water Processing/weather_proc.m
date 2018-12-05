disp('Weather must be imported manually first if processing weather, Hit ENTER to continue ...')
pause
%Data must start Jan, 1, 2016 and be imported with DATE, PRCP, TMAX variables
disp('-----Precipitation and Temperature processing-----')

i_proc = input('Process weather?  y/n: ', 's');
if i_proc == 'y'    

    %Standardize missing and remove blank variables
    weather = standardizeMissing(NOAACastleford,-9999);

    %to datetime from YYYYMMDD
    weather.DATE = datetime(weather.DATE, 'ConvertFrom', 'yyyyMMdd');

    %Fix names for ease of use
    weather.Properties.VariableNames{1} = 'date';
    weather.Properties.VariableNames{2} = 'prcp';
    weather.Properties.VariableNames{3} = 'tmax';

    % Change to DATENUM for innerjoin function
    weather.date = datenum(weather.date);

    %Initialize Array for Yearly Accummulated Precipitation
    weather.accum = zeros(height(weather),1);

    %Change index values to match first and last day of each year and
    %produce accumulated precipitation values for the calendar year to date

    %2016
        for i = 2:343
            if isnan(weather.prcp(i-1)) == 1
                weather.accum(i) = weather.accum(i-1);
            else
                weather.accum(i) = weather.accum(i-1)+ weather.prcp(i-1);
            end
        end
    %2017
        weather.accum(344) = 0;
        for i = 345:680
            if isnan(weather.prcp(i-1)) == 1
                weather.accum(i) = weather.accum(i-1);
            else
                weather.accum(i) = weather.accum(i-1)+ weather.prcp(i-1);
            end
        end
    %2018
        weather.accum(681) = 0;
        for i = 682:height(weather)
            if isnan(weather.prcp(i-1)) == 1
                weather.accum(i) = weather.accum(i-1);
            else
                weather.accum(i) = weather.accum(i-1)+ weather.prcp(i-1);
            end
        end

    weather_c = innerjoin(date_t,weather);

    %Back to datetime for plotting
    weather.date = datetime(weather.date, 'ConvertFrom', 'datenum');
    weather_c.date = datetime(weather_c.date, 'ConvertFrom', 'datenum');

end

disp('-----Precipitation and Temperature COMPLETE-----')

i_plot = input('Plot weather. y/n: ', 's');
if i_plot == 'y'
    %check plot
    figure
    subplot(2,1,1)
    plot(weather.date,weather.tmax)
    hold on
%     plot(weather.date,weather.tmaxs)
    ylabel('Temperature (F)')

    subplot(2,1,2)
    i_months = months;
    i_tick_locations = i_months;
        yyaxis left
    plot(weather_c.date,weather_c.accum)
    hold on
%     plot(weather_c.date,weather_c.tmaxs)
    ylabel('Precip (in)')
%     yyaxis right
%     plot(weather_c.date,weather_c.prec_ev, 'or')
%     ylabel('Precipitation (in)')
    set(gca,'XTick',i_tick_locations)
    datetick('x','mmm yy','keepticks');
    xtickangle(45);

creekusgs.Properties.VariableNames{1} = 'date';
creekusgs.cms = creekusgs.cfs*0.0283168;
creekusgs.date = datenum(creekusgs.date);
creekusgs_c = innerjoin(date_t,creekusgs);
creekusgs.date = datetime(creekusgs.date, 'ConvertFrom', 'datenum');
creekusgs_c.date = datetime(creekusgs_c.date, 'ConvertFrom', 'datenum');
end
clear i_*;

disp('-----Plotting COMPLETE-----')

