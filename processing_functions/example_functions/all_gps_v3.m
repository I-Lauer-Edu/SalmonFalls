
%---------- Clip data to ranges from firstday to lastday
d_BASE = intersect_dates(BASE,dates);
d_BLOK = intersect_dates(BLOK,dates);
d_BLKS = intersect_dates(BLKS,dates);
d_BLKM = intersect_dates(BLKM,dates);
d_MIDB = intersect_dates(MIDB,dates);
d_NTOE = intersect_dates(NTOE,dates);
d_STOE = intersect_dates(STOE,dates);

%---------- Create a Table with ALL clipped data

ALL_GPS = table(dates,d_BASE.n,d_BASE.e,d_BASE.u,d_BLOK.n,d_BLOK.e,d_BLOK.u,d_BLKM.n,d_BLKM.e,d_BLKM.u,d_BLKS.n,d_BLKS.e,d_BLKS.u,d_MIDB.n,d_MIDB.e,d_MIDB.u,d_NTOE.n,d_NTOE.e,d_NTOE.u,d_STOE.n,d_STOE.e,d_STOE.u);
ALL_GPS.Properties.VariableNames = {'date', 'BASE_n', 'BASE_e', 'BASE_u', 'BLOK_n', 'BLOK_e', 'BLOK_u', 'BLKM_n', 'BLKM_e', 'BLKM_u', 'BLKS_n', 'BLKS_e', 'BLKS_u', 'MIDB_n', 'MIDB_e', 'MIDB_u', 'NTOE_n', 'NTOE_e', 'NTOE_u', 'STOE_n', 'STOE_e', 'STOE_u'};

%----------- Replace 0 with Nan

ALL_GPS = standardizeMissing(ALL_GPS, 0);
d_BASE = standardizeMissing(d_BASE, 0);
d_BLOK = standardizeMissing(d_BLOK, 0);
d_BLKM = standardizeMissing(d_BLKM, 0);
d_BLKS = standardizeMissing(d_BLKS, 0);
d_MIDB = standardizeMissing(d_MIDB, 0);
d_NTOE = standardizeMissing(d_NTOE, 0);
d_STOE = standardizeMissing(d_STOE, 0);

%----------- CLEAR JUNK

clear i*;
clear C*;
