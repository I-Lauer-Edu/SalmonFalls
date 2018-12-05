function gpsout = minusbase_v2(gpsin,t)
% help section : Subtracts BASE trend from station residuals

%----------- CREAT A NEW GPS FILE w/ ALL DATES AND NAN ----------%

gpstemp = table(gpsin.Date,gpsin.Northmm,gpsin.Eastmm,gpsin.Verticalmm);
gpstemp.Properties.VariableNames = {'date', 'n', 'e', 'u'};

%find the index numbers for the first and last days with non-zero values
i_first = find(gpstemp.n,1);
i_last = find(gpstemp.n,1,'last');
%find the value of the cell with index firstday and lastday
i_firstday = gpstemp.date(i_first);
i_lastday = gpstemp.date(i_last);
%create an array of days for later
i_dates = double(i_firstday:i_lastday)';

%create a continuous string of dates and intersect with gpstemp
i_temporary = i_dates';
gpstemp_2 = table(i_dates);
[C,ia,ib] = intersect(i_temporary,gpstemp.date);
i_temporary(ia,2) = gpstemp.n(ib);
i_temporary(ia,3) = gpstemp.e(ib);
i_temporary(ia,4) = gpstemp.u(ib);
gpstemp_2.n = i_temporary(:,2);
gpstemp_2.e = i_temporary(:,3);
gpstemp_2.u = i_temporary(:,4);


%standardize missing values, replace 0 with Nan
%avoid issue with later computation
gpstemp_2 = standardizeMissing(gpstemp_2, 0);

%---------- SUBTRACT BASE TREND FROM GPS VALUES ----------%

% Create a base station trend table
i_trend = table(i_dates);
i_trend.i = i_trend.i_dates-double(i_firstday-1);

%create a trend for north, east, and up vectors
i_trend.n = t.N_a*i_trend.i; 
i_trend.e = t.E_a*i_trend.i;
i_trend.u = t.V_a*i_trend.i;

%subtract the trend from the original values
gpsout = table(i_dates);
gpsout.Properties.VariableNames = {'date'};
gpsout.n = gpstemp_2.n-i_trend.n;
gpsout.e = gpstemp_2.e-i_trend.e;
gpsout.u = gpstemp_2.u-i_trend.u;

%---------- RETURN gpsout ----------%

return