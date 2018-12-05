%gps velocity estimates from gps input
cont = input('Process velocities? y/n? : ','s');
disp(' ')
while lower(cont) == 'y'
        i_sw = input(' 1=Horz, 2=Vert, 3=Total:  ');
        disp(' ')
        switch i_sw
            case 1
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    i_sw = input(' 0=All, 1=BLOK, 2=BLKM, 3=BLKS, 4=MIDB, 5=NTOE, 6=STOE, 7=BASE?: ');
        disp(' ')
        while i_sw > 7 || i_sw < 0
            i_sw = input(' 1=BLOK, 2=BLKM, 3=BLKS, 4=MIDB, 5=NTOE, 6=STOE, 7=BASE?');
            disp(' ')
        end
        switch i_sw
            case 0
                s_BLOK.hv = gradient(s_BLOK.hs);
                s_BLKM.hv = gradient(s_BLKM.hs);
                s_BLKS.hv = gradient(s_BLKS.hs);
                s_MIDB.hv = gradient(s_MIDB.hs);
                s_NTOE.hv = gradient(s_NTOE.hs);
                s_STOE.hv = gradient(s_STOE.hs);
                s_BASE.hv = gradient(s_BASE.hs);
            case 1
                s_BLOK.hv = gradient(s_BLOK.hs);
            case 2
                s_BLKM.hv = gradient(s_BLKM.hs);
            case 3
                s_BLKS.hv = gradient(s_BLKS.hs);
            case 4
                s_MIDB.hv = gradient(s_MIDB.hs);
            case 5
                s_NTOE.hv = gradient(s_NTOE.hs);
            case 6
                s_STOE.hv = gradient(s_STOE.hs);
            case 7
                s_BASE.hv = gradient(s_BASE.hs);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            case 2
                    i_sw = input(' 0=All, 1=BLOK, 2=BLKM, 3=BLKS, 4=MIDB, 5=NTOE, 6=STOE, 7=BASE?: ');
        disp(' ')
        while i_sw > 7 || i_sw < 0
            i_sw = input(' 1=BLOK, 2=BLKM, 3=BLKS, 4=MIDB, 5=NTOE, 6=STOE, 7=BASE?');
            disp(' ')
        end
        switch i_sw
            case 0
                s_BLOK.vv = gradient(s_BLOK.us);
                s_BLKM.vv = gradient(s_BLKM.us);
                s_BLKS.vv = gradient(s_BLKS.us);
                s_MIDB.vv = gradient(s_MIDB.us);
                s_NTOE.vv = gradient(s_NTOE.us);
                s_STOE.vv = gradient(s_STOE.us);
                s_BASE.vv = gradient(s_BASE.us);
            case 1
                s_BLOK.vv = gradient(s_BLOK.us);
            case 2
                s_BLKM.vv = gradient(s_BLKM.us);
            case 3
                s_BLKS.vv = gradient(s_BLKS.us);
            case 4
                s_MIDB.vv = gradient(s_MIDB.us);
            case 5
                s_NTOE.vv = gradient(s_NTOE.us);
            case 6
                s_STOE.vv = gradient(s_STOE.us);
            case 7
                s_BASE.vv = gradient(s_BASE.us);
        end
        case 3
                    i_sw = input(' 0=All, 1=BLOK, 2=BLKM, 3=BLKS, 4=MIDB, 5=NTOE, 6=STOE, 7=BASE?: ');
        disp(' ')
        while i_sw > 7 || i_sw < 0
            i_sw = input(' 1=BLOK, 2=BLKM, 3=BLKS, 4=MIDB, 5=NTOE, 6=STOE, 7=BASE?');
            disp(' ')
        end
        switch i_sw
            case 0
                s_BLOK.tv = gradient(s_BLOK.ts);
                s_BLKM.tv = gradient(s_BLKM.ts);
                s_BLKS.tv = gradient(s_BLKS.ts);
                s_MIDB.tv = gradient(s_MIDB.ts);
                s_NTOE.tv = gradient(s_NTOE.ts);
                s_STOE.tv = gradient(s_STOE.ts);
                s_BASE.tv = gradient(s_BASE.ts);
            case 1
                s_BLOK.tv = gradient(s_BLOK.ts);
            case 2
                s_BLKM.tv = gradient(s_BLKM.ts);
            case 3
                s_BLKS.tv = gradient(s_BLKS.ts);
            case 4
                s_MIDB.tv = gradient(s_MIDB.ts);
            case 5
                s_NTOE.tv = gradient(s_NTOE.ts);
            case 6
                s_STOE.tv = gradient(s_STOE.ts);
            case 7
                s_BASE.tv = gradient(s_BASE.ts);
        end
        end
        cont = input('Process more velocities? y/n? : ','s');
disp(' ')
end

