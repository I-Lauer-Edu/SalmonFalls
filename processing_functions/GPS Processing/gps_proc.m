%GPS processing of tab-delimited input into array output.
%Process date times to correct format. Original format is Epoch Sec,
%   converted to decimal date.
% Cleans, detrends, and normalizes initialization date and values of GPS.
% Caluclates the vector (3-dimensional) displacement from North, East, Up
% components.
disp('-----GPS Import and Processing-----')

i_cont = input('Process new gps files? continue: y/n: ', 's');
while lower(i_cont) == 'y'
i_keep_orig = input('Keep original files? y/n:','s');
i_keep_sub = input('Keep sub-processed files? y/n:','s');
    i_cont1 = input('Process raw files? continue: y/n: ', 's');
        if lower(i_cont1) == 'y'

        %---------- Import from PBO CSV ----------%
        o_BASE = importgps('data/gps/BASE.pbo.nam08.csv');
        o_BLOK = importgps('data/gps/BLOK.pbo.nam08.csv');
        o_BLKM = importgps('data/gps/BLKM.pbo.nam08.csv');
        o_BLKS = importgps('data/gps/BLKS.pbo.nam08.csv');
        o_MIDB = importgps('data/gps/MIDB.pbo.nam08.csv');
        o_NTOE = importgps('data/gps/NTOE.pbo.nam08.csv');
        o_STOE = importgps('data/gps/STOE.pbo.nam08.csv');

        end
        
        %---------- BASE trend ----------%
        %Equations from linear best fit of North, East, Up components
        %determined using Basic Fit tool in plot window
        %example for North: y = N_a*x + N_b
        %N_a for example is mm/day of movement
        choice = input('Recalculate Base Station Trend? y/n: ', 's');
        if lower(choice) == 'y'
            BASEtrendN = fit(BASE.Date,BASE.Northmm,'poly2');
            BASEtrendE = fit(BASE.Date,BASE.Eastmm,'poly2');
            BASEtrendV = fit(BASE.Date,BASE.Verticalmm,'poly2');
        end
      
        % North
        trend_val = table;
        trend_val.N_a = 0.0063371;
        trend_val.N_b = -4666.3;
        % East 
        trend_val.E_a = -0.0032082;
        trend_val.E_b = 2366.5;
        % Vertical 
            %vertical not used due to anomolous high rate (17mm/yr), using station PBO P677 instead
            %V_a = 0.048706;
            %V_b = -35912;
        trend_val.V_a = -0.04/365;

        %yearly values
        trend_val.N_trend = trend_val.N_a*365;
        trend_val.E_trend = trend_val.E_a*365;
        trend_val.V_trend = trend_val.V_a*365;
        trend_val.T_trend = sqrt((trend_val.N_trend^2)+(trend_val.E_trend^2)+(trend_val.V_trend^2));

        fprintf('BASE trend: Total: %f mm/yr, N: %f mm/yr, E: %f mm/yr, V: %f mm/yr \n\n', trend_val.T_trend, trend_val.N_trend, trend_val.E_trend, trend_val.V_trend)

        %---------- Reduce GPS movement by Base Station ----------%
        m_BASE = minusbase_v2(o_BASE,trend_val);
        m_BLOK = minusbase_v2(o_BLOK,trend_val);
        m_BLKS = minusbase_v2(o_BLKS,trend_val);
        m_BLKM = minusbase_v2(o_BLKM,trend_val);
        m_MIDB = minusbase_v2(o_MIDB,trend_val);
        m_NTOE = minusbase_v2(o_NTOE,trend_val);
        m_STOE = minusbase_v2(o_STOE,trend_val);

        %---------- Initialize Signal at First Date ---------%
        %this sets all residual movement to 0 on the first experiment date
        %effectively eliminating both differences in station deployments and GPS initialization.
        z_BASE = init_zero(m_BASE);
        z_BLOK = init_zero(m_BLOK);
        z_BLKS = init_zero(m_BLKS);
        z_BLKM = init_zero(m_BLKM);
        z_MIDB = init_zero(m_MIDB);
        z_NTOE = init_zero(m_NTOE);
        z_STOE = init_zero(m_STOE);
        
        %---------- Vector Displacment (3-dimensional movement)---------%
        BASE = vectordisplacement(z_BASE);
        BLOK = vectordisplacement(z_BLOK);
        BLKS = vectordisplacement(z_BLKS);
        BLKM = vectordisplacement(z_BLKM);
        MIDB = vectordisplacement(z_MIDB);
        NTOE = vectordisplacement(z_NTOE);
        STOE = vectordisplacement(z_STOE);

%         end
    if i_keep_orig == 'n'
        clear o*;
    end
    if i_keep_sub == 'n'
        clear o*;
        clear m*;
        clear z*;
    end

i_cont = input('Process more new gps files? continue: y/n: ', 's');
disp(' ')
end

%---------- Spline SMoothing Interpolation ----------%
spline_all;

%---------- velocity estimates ----------%
gps_vel;

% %---------- Create a Table with ALL clipped data
% %Currently unused, would potentially be usefull if there is a need to
% % export ALL data for processing in outside applications
% ALL_GPS = table(dates,d_BASE.n,d_BASE.e,d_BASE.u,d_BLOK.n,d_BLOK.e,d_BLOK.u,d_BLKM.n,d_BLKM.e,d_BLKM.u,d_BLKS.n,d_BLKS.e,d_BLKS.u,d_MIDB.n,d_MIDB.e,d_MIDB.u,d_NTOE.n,d_NTOE.e,d_NTOE.u,d_STOE.n,d_STOE.e,d_STOE.u);
% ALL_GPS.Properties.VariableNames = {'date', 'BASE_n', 'BASE_e', 'BASE_u', 'BLOK_n', 'BLOK_e', 'BLOK_u', 'BLKM_n', 'BLKM_e', 'BLKM_u', 'BLKS_n', 'BLKS_e', 'BLKS_u', 'MIDB_n', 'MIDB_e', 'MIDB_u', 'NTOE_n', 'NTOE_e', 'NTOE_u', 'STOE_n', 'STOE_e', 'STOE_u'};

%---------- Tables w/ experiment date range ----------%

%Clip data to ranges from firstday to lastday
choice = input('Convert to experiment days? y/n: ','s');
if choice == 'y'
   
    s_BASE = outerjoin(date_t,s_BASE,'MergeKeys',true);
    s_BLOK = outerjoin(date_t,s_BLOK,'MergeKeys',true);
    s_BLKS = outerjoin(date_t,s_BLKS,'MergeKeys',true);
    s_BLKM = outerjoin(date_t,s_BLKM,'MergeKeys',true);
    s_MIDB = outerjoin(date_t,s_MIDB,'MergeKeys',true);
    s_NTOE = outerjoin(date_t,s_NTOE,'MergeKeys',true);
    s_STOE = outerjoin(date_t,s_STOE,'MergeKeys',true);
    
end
clear choice;

choice = input('Create variable w/ absolute values of displacement? y/n: ','s');
if choice == 'y'
    s_BLOK.av = abs(s_BLOK.tv);
    s_BLKM.av = abs(s_BLKM.tv);
    s_BLKS.av = abs(s_BLKS.tv);
    s_MIDB.av = abs(s_MIDB.tv);
    s_NTOE.av = abs(s_NTOE.tv);
    s_STOE.av = abs(s_STOE.tv);
    s_BASE.av = abs(s_BASE.tv);
end

%----------- CLEAR JUNK
clear i*;
clear C*;

disp('-----GPS Processing COMPLETE-----')
disp(' ')