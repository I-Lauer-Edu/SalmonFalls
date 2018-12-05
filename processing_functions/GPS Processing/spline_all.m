cont = input('Fit spline interpolation to data? y/n? : ','s');
disp(' ')
while cont == 'y'
    i_sw = input(' 1=BLOK, 2=BLKM, 3=BLKS, 4=MIDB, 5=NTOE, 6=STOE, 7=BASE, 0=ALL?: ');
    disp(' ')
    while i_sw > 7 || i_sw < 0
        %this is an error check
        i_sw = input(' 1=BLOK, 2=BLKM, 3=BLKS, 4=MIDB, 5=NTOE, 6=STOE, 7=BASE, 0=ALL?');
        disp(' ')
    end
    switch i_sw
        case 1 %BLOK
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BLOK
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            choice = input('new file? y/n: ','s');
            if choice == 'y'
                s_BLOK = BLOK;
            end
            %BLOK NS------------------------------%
            choice = input('ns? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BLOK.date, BLOK.n)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BLOK.ns = spline_interpolation_v2(BLOK.date,BLOK.n,f_BLOK_ns);
                disp(' Fit complete... ')
                disp(' ')
            end
            %BLOK ES------------------------------%
            choice = input('es? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BLOK.date, BLOK.e)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BLOK.es = spline_interpolation_v2(BLOK.date,BLOK.e,f_BLOK_es);
                disp(' Fit complete... ')
                disp(' ')
            end
            %BLOK US------------------------------%
            choice = input('us? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BLOK.date, BLOK.u)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BLOK.us = spline_interpolation_v2(BLOK.date,BLOK.u,f_BLOK_us);
                disp(' Fit complete... ')
                disp(' ')
            end
           %BLOK H------------------------------% 
                        choice = input('hs? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BLOK.date, BLOK.horz)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BLOK.hs = spline_interpolation_v2(BLOK.date,BLOK.horz,f_BLOK_hs);
                disp(' Fit complete... ')
                disp(' ')
            end
            %BLOK T------------------------------%
            choice = input('ts? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BLOK.date, BLOK.t)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BLOK.ts = spline_interpolation_v2(BLOK.date,BLOK.t,f_BLOK_ts);
                disp(' Fit complete... ')
                disp(' ')
            end
                
                
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BLKM
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        case 2 %BLKM
            choice = input('new file? y/n: ','s');
            if choice == 'y'
                s_BLKM = BLKM;
            end
            %BLKM NS------------------------------%
            choice = input('ns? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BLKM.date, BLKM.n)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BLKM.ns = spline_interpolation_v2(BLKM.date,BLKM.n,f_BLKM_ns);
                disp(' Fit complete... ')
                disp(' ')
            end
            %BLKM ES------------------------------%
            choice = input('es? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BLKM.date, BLKM.e)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BLKM.es = spline_interpolation_v2(BLKM.date,BLKM.e,f_BLKM_es);
                disp(' Fit complete... ')
                disp(' ')
            end
            %BLKM US------------------------------%
            choice = input('us? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BLKM.date, BLKM.u)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BLKM.us = spline_interpolation_v2(BLKM.date,BLKM.u,f_BLKM_us);
                disp(' Fit complete... ')
                disp(' ')
            end
            %BLKM H------------------------------% 
                        choice = input('hs? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BLKM.date, BLKM.horz)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BLKM.hs = spline_interpolation_v2(BLKM.date,BLKM.horz,f_BLKM_hs);
                disp(' Fit complete... ')
                disp(' ')
            end
            %BLKM T------------------------------%
            choice = input('t? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BLKM.date, BLKM.t)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BLKM.ts = spline_interpolation_v2(BLKM.date,BLKM.t,f_BLKM_ts);
                disp(' Fit complete... ')
                disp(' ')
            end
                
                
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BLKS
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
        case 3 %BLKS
            choice = input('new file? y/n: ','s');
            if choice == 'y'
                s_BLKS = BLKS;
            end
            %BLKS NS------------------------------%
            choice = input('ns? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BLKS.date, BLKS.n)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BLKS.ns = spline_interpolation_v2(BLKS.date,BLKS.n,f_BLKS_ns);
                disp(' Fit complete... ')
                disp(' ')
            end
            %BLKS ES------------------------------%
            choice = input('es? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BLKS.date, BLKS.e)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BLKS.es = spline_interpolation_v2(BLKS.date,BLKS.e,f_BLKS_es);
                disp(' Fit complete... ')
                disp(' ')
            end
            %BLKS US------------------------------%
            choice = input('us? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BLKS.date, BLKS.u)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BLKS.us = spline_interpolation_v2(BLKS.date,BLKS.u,f_BLKS_us);
                disp(' Fit complete... ')
                disp(' ')
            end
            %BLKS H------------------------------% 
                        choice = input('hs? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BLKS.date, BLKS.horz)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BLKS.hs = spline_interpolation_v2(BLKS.date,BLKS.horz,f_BLKS_hs);
                disp(' Fit complete... ')
                disp(' ')
            end
            %BLKS T------------------------------%
            choice = input('t? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BLKS.date, BLKS.t)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BLKS.ts = spline_interpolation_v2(BLKS.date,BLKS.t,f_BLKS_ts);
                disp(' Fit complete... ')
                disp(' ')
            end
                
                
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MIDB
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%           
        case 4 %MIDB
            choice = input('new file? y/n: ','s');
            if choice == 'y'
                s_MIDB = MIDB;
            end
            %MIDB NS------------------------------%
            choice = input('ns? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(MIDB.date, MIDB.n)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_MIDB.ns = spline_interpolation_v2(MIDB.date,MIDB.n,f_MIDB_ns);
                disp(' Fit complete... ')
                disp(' ')
            end
            %MIDB ES------------------------------%
            choice = input('es? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(MIDB.date, MIDB.e)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_MIDB.es = spline_interpolation_v2(MIDB.date,MIDB.e,f_MIDB_es);
                disp(' Fit complete... ')
                disp(' ')
            end
            %MIDB US------------------------------%
            choice = input('us? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(MIDB.date, MIDB.u)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_MIDB.us = spline_interpolation_v2(MIDB.date,MIDB.u,f_MIDB_us);
                disp(' Fit complete... ')
                disp(' ')
            end
            %MIDB H------------------------------% 
            choice = input('hs? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(MIDB.date, MIDB.horz)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_MIDB.hs = spline_interpolation_v2(MIDB.date,MIDB.horz,f_MIDB_hs);
                disp(' Fit complete... ')
                disp(' ')
            end
            %MIDB T------------------------------%
            choice = input('t? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(MIDB.date, MIDB.t)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_MIDB.ts = spline_interpolation_v2(MIDB.date,MIDB.t,f_MIDB_ts);
                disp(' Fit complete... ')
                disp(' ')
            end
                
                
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NTOE
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          
        case 5 %NTOE
            choice = input('new file? y/n: ','s');
            if choice == 'y'
                s_NTOE = NTOE;
            end
            %NTOE NS------------------------------%
            choice = input('ns? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(NTOE.date, NTOE.n)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_NTOE.ns = spline_interpolation_v2(NTOE.date,NTOE.n,f_NTOE_ns);
                disp(' Fit complete... ')
                disp(' ')
            end
            %NTOE ES------------------------------%
            choice = input('es? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(NTOE.date, NTOE.e)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_NTOE.es = spline_interpolation_v2(NTOE.date,NTOE.e,f_NTOE_es);
                disp(' Fit complete... ')
                disp(' ')
            end
            %NTOE US------------------------------%
            choice = input('us? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(NTOE.date, NTOE.u)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_NTOE.us = spline_interpolation_v2(NTOE.date,NTOE.u,f_NTOE_us);
                disp(' Fit complete... ')
                disp(' ')
            end
            %NTOE H------------------------------% 
            choice = input('hs? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(NTOE.date, NTOE.horz)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_NTOE.hs = spline_interpolation_v2(NTOE.date,NTOE.horz,f_NTOE_hs);
                disp(' Fit complete... ')
                disp(' ')
            end
            %NTOE T------------------------------%
            choice = input('t? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(NTOE.date, NTOE.t)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_NTOE.ts = spline_interpolation_v2(NTOE.date,NTOE.t,f_NTOE_ts);
                disp(' Fit complete... ')
                disp(' ')
            end
                
                
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% STOE
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         
        case 6 %STOE
            choice = input('new file? y/n: ','s');
            if choice == 'y'
                s_STOE = STOE;
            end
            %STOE NS------------------------------%
            choice = input('ns? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(STOE.date, STOE.n)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_STOE.ns = spline_interpolation_v2(STOE.date,STOE.n,f_STOE_ns);
                disp(' Fit complete... ')
                disp(' ')
            end
            %STOE ES------------------------------%
            choice = input('es? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(STOE.date, STOE.e)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_STOE.es = spline_interpolation_v2(STOE.date,STOE.e,f_STOE_es);
                disp(' Fit complete... ')
                disp(' ')
            end
            %STOE US------------------------------%
            choice = input('us? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(STOE.date, STOE.u)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_STOE.us = spline_interpolation_v2(STOE.date,STOE.u,f_STOE_us);
                disp(' Fit complete... ')
                disp(' ')
            end
            %STOE H------------------------------% 
            choice = input('hs? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(STOE.date, STOE.horz)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_STOE.hs = spline_interpolation_v2(STOE.date,STOE.horz,f_STOE_hs);
                disp(' Fit complete... ')
                disp(' ')
            end
            %STOE T------------------------------%
            choice = input('t? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(STOE.date, STOE.t)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_STOE.ts = spline_interpolation_v2(STOE.date,STOE.t,f_STOE_ts);
                disp(' Fit complete... ')
                disp(' ')
            end
                
                
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BASE
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        case 7 %BASE
            choice = input('new file? y/n: ','s');
            if choice == 'y'
                s_BASE = BASE;
            end
            %BASE NS------------------------------%
            choice = input('ns? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BASE.date, BASE.n)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BASE.ns = spline_interpolation_v2(BASE.date,BASE.n,f_BASE_ns);
                disp(' Fit complete... ')
                disp(' ')
            end
            %BASE ES------------------------------%
            choice = input('es? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BASE.date, BASE.e)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BASE.es = spline_interpolation_v2(BASE.date,BASE.e,f_BASE_es);
                disp(' Fit complete... ')
                disp(' ')
            end
            %BASE US------------------------------%
            choice = input('us? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BASE.date, BASE.u)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BASE.us = spline_interpolation_v2(BASE.date,BASE.u,f_BASE_us);
                disp(' Fit complete... ')
                disp(' ')
            end
            %BASE H------------------------------% 
            choice = input('hs? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BASE.date, BASE.horz)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BASE.hs = spline_interpolation_v2(BASE.date,BASE.horz,f_BASE_hs);
                disp(' Fit complete... ')
                disp(' ')
            end
            %BASE T------------------------------%
            choice = input('t? y/n: ','s');
            if choice == 'y'
                cont = input('Create a new fit model? y/n: ','s');
                if cont == 'y'
                    cftool(BASE.date, BASE.t)
                    disp('After the smoothing model is saved, Hit ENTER to continue ...')
                    pause
                end
                s_BASE.ts = spline_interpolation_v2(BASE.date,BASE.t,f_BASE_ts);
                disp(' Fit complete... ')
                disp(' ')
            end
                
                
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
    cont = input('Do another fit? y/n?','s');
    disp(' ')
end
clear cont;
clear choice;