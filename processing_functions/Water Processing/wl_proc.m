%Input is currently .csv files manually created in Excel

%Needs replacement by automatically read and processed .txt. tab delim
%   Current time sink is in converting string to serial dates because it
%   requires text parsing
%Could use simplification for switching between tables and arrays, low
%   priority
disp('-----Water-level Import and Processing-----')

i_cont = input('Process new water files? continue: y/n: ', 's');
while lower(i_cont) == 'y'
    disp('   --Note-- Files are processed from folder Documents/MATLAB/SalmonFalls/data/water ')
    i_which_one = input('Choose: 1 = All 2 =Well, 3 = Lake, 4 = Creek : ');
    disp(' ')
    while i_which_one<1 || i_which_one>5
        i_which_one = input('Invalid. Choose: 1,2,3, or 4 : ');
        disp(' ')
    end
    switch floor(i_which_one)
        case 1
            %---------- Load/input data ----------
            %Loads file 'well' from ~Matlab\Salmon Falls\data
            %Converts string date to integer serial dates
            tempwater = importwater('data/water/well.txt');

            %---------- Water depth processsing ----------
            %create uniques arrays of unique day values C, and day index array idx
            %ia0 is needed to parse the indexes, it is NOT unused
            [iC0,ia0,idx0] = unique(tempwater.DateTime,'stable');
            %create average depth values for every index day
            ival = accumarray(idx0,tempwater.Depthm,[],@mean);
            %create a new table of the original day values C and average depth val
            w_well = table(iC0, ival);
            w_well.Properties.VariableNames = {'date','depth'};
            disp('Water levels for "well" processed.')
            disp(' ')
            
            %---------- Load/input data ----------
            %Loads file 'well' from ~Matlab\Salmon Falls\data
            tempwater = importwater('data/water/lake.txt');

            %---------- Convert dates ----------
            %converts to serial dates from 0-0-0000
            tempwater.DateTime = datenum(tempwater.DateTime);
            %converts to integer dates to run depth averaging
            tempwater.DateTime = int32(floor(tempwater.DateTime));

            %---------- Water depth processsing ----------

            %create uniques arrays of unique day values C, and day index array idx
            %ia0 is needed to parse the index numbers
            [iC0,ia0,idx0] = unique(tempwater.DateTime,'stable');
            %create average depth values for every index day
            ival = accumarray(idx0,tempwater.Depthm,[],@mean);
            %create a new table of the original day values C and average depth val
            w_lake = table(iC0, ival);
            w_lake.Properties.VariableNames = {'date','depth'};
            disp('Water levels for "lake" processed.')
            disp(' ')
            
            %---------- Load/input data ----------
            %Loads file 'well' from ~Matlab\Salmon Falls\data
            tempwater = importwater('data/water/creek.txt');

            %---------- Convert dates ----------
            %converts to serial dates from 0-0-0000
            tempwater.DateTime = datenum(tempwater.DateTime);
            %converts to integer dates to run depth averaging
            tempwater.DateTime = int32(floor(tempwater.DateTime));

            %---------- Water depth processsing ----------

            %create uniques arrays of unique day values C, and day index array idx
            %ia0 is needed to parse the indexes, it is NOT unused
            [iC0,ia0,idx0] = unique(tempwater.DateTime,'stable');
            %create average depth values for every index day
            ival = accumarray(idx0,tempwater.Depthm,[],@mean);
            %create a new table of the original day values C and average depth val
            w_creek = table(iC0, ival);
            w_creek.Properties.VariableNames = {'date','depth'};
            disp('Water levels for "creek" processed.')
            disp(' ')
            
        case 2
            %---------- Load/input data ----------
            %Loads file 'well' from ~Matlab\Salmon Falls\data
            %Converts string date to integer serial dates
            tempwater = importwater('data/water/well.txt');

            %---------- Water depth processsing ----------

            %create uniques arrays of unique day values C, and day index array idx
            %ia0 is needed to parse the indexes, it is NOT unused
            [iC0,ia0,idx0] = unique(tempwater.DateTime,'stable');
            %create average depth values for every index day
            ival = accumarray(idx0,tempwater.Depthm,[],@mean);
            %create a new table of the original day values C and average depth val
            w_well = table(iC0, ival);
            w_well.Properties.VariableNames = {'date','depth'};
            disp('Water levels for "well" processed.')
            disp(' ')
            
        case 3
                        %---------- Load/input data ----------
            %Loads file 'well' from ~Matlab\Salmon Falls\data
            tempwater = importwater('data/water/lake.txt');

            %---------- Convert dates ----------
            %converts to serial dates from 0-0-0000
            tempwater.DateTime = datenum(tempwater.DateTime);
            %converts to integer dates to run depth averaging
            tempwater.DateTime = int32(floor(tempwater.DateTime));

            %---------- Water depth processsing ----------

            %create uniques arrays of unique day values C, and day index array idx
            %ia0 is needed to parse the indexes, it is NOT unused
            [iC0,ia0,idx0] = unique(tempwater.DateTime,'stable');
            %create average depth values for every index day
            ival = accumarray(idx0,tempwater.Depthm,[],@mean);
            %create a new table of the original day values C and average depth val
            w_lake = table(iC0, ival);
            w_lake.Properties.VariableNames = {'date','depth'};
            disp('Water levels for "lake" processed.')
            disp(' ')
            
        case 4
                        %---------- Load/input data ----------
            %Loads file 'well' from ~Matlab\Salmon Falls\data
            tempwater = importwater('data/water/creek.txt');

            %---------- Convert dates ----------
            %converts to serial dates from 0-0-0000
            tempwater.DateTime = datenum(tempwater.DateTime);
            %converts to integer dates to run depth averaging
            tempwater.DateTime = int32(floor(tempwater.DateTime));

            %---------- Water depth processsing ----------

            %create uniques arrays of unique day values C, and day index array idx
            %ia0 is needed to parse the indexes, it is NOT unused
            [iC0,ia0,idx0] = unique(tempwater.DateTime,'stable');
            %create average depth values for every index day
            ival = accumarray(idx0,tempwater.Depthm,[],@mean);
            %create a new table of the original day values C and average depth val
            w_creek = table(iC0, ival);
            w_creek.Properties.VariableNames = {'date','depth'};
            disp('Water levels for "creek" processed.')
            disp(' ')
        case 5
       
    end
    
    % Join dates with the global date list
    p_creek = outerjoin(date_t, w_creek,'MergeKeys',true);
    p_lake = outerjoin(date_t, w_lake,'MergeKeys',true);
    p_well = outerjoin(date_t, w_well,'MergeKeys',true);

    %---------- ALL

%     ALL_WATER = table(dates,p_well.depth,p_lake.depth,p_creek.depth);
%     ALL_WATER.Properties.VariableNames = {'date', 'well_depth', 'lake_depth', 'creek_depth'};

    %----------- Replace 0 with Nan

%     ALL_WATER = standardizeMissing(ALL_WATER, 0);
    well = standardizeMissing(p_well, 0);
    lake = standardizeMissing(p_lake, 0);
    creek = standardizeMissing(p_creek, 0);

%Shift Bluegill lake water levels by an expermental lag times
    i_cont2 = input('Produce Bluegill lake water levels with an expermental lag time? y/n: ','s');
    while lower(i_cont2) == 'y'
        lag_time = input('Input lag time(days, integer): ','s');
        start_time = lag_time+1;
        lake_l = table;
        lake_l.date = lake.date;
        for i = start_time:(height(lake))
            lake_l.depth(i) = lake.depth(i-lag_time);
        end
    end
     
    i_cont = input('Process more water files? continue: y/n: ','s');
    disp(' ')
end

disp('-----Water-level Import and Processing COMPLETE-----')
disp(' ')

clear p*;
clear i*;
clear tempwater;
