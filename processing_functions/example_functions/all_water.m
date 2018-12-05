

%---------- Creek
p_creek = intersect_water(w_creek,dates);

%---------- Lake
p_lake = intersect_water(w_lake,dates);

%---------- Well
p_well = intersect_water(w_well,dates);

%---------- ALL
i_dates = dates;
ALL_WATER = table(dates,p_well.depth,p_lake.depth,p_creek.depth);
ALL_WATER.Properties.VariableNames = {'date', 'well_depth', 'lake_depth', 'creek_depth'};

%----------- Replace 0 with Nan

ALL_WATER = standardizeMissing(ALL_WATER, 0);
p_well = standardizeMissing(p_well, 0);
p_lake = standardizeMissing(p_lake, 0);
p_creek = standardizeMissing(p_creek, 0);

%----------- CLEAR JUNK

clear i*;
clear C*;
