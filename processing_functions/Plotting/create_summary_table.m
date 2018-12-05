%Full Summary

summ = table('RowNames', {'well'; 'lake'; 'creek'; 'USGS'; 'BLKM'; 'MIDB'; 'NTOE'});

%averages
summ.mean = {nanmean(well.depth);nanmean(lake.depth);nanmean(creek.depth);nanmean(creek_cms_c.cms);nanmean(s_BLKM.tv);nanmean(s_MIDB.tv);nanmean(s_NTOE.tv)};
summ.std = {nanstd(well.depth);nanstd(lake.depth);nanstd(creek.depth);nanstd(creek_cms_c.cms);nanstd(s_BLKM.tv);nanstd(s_MIDB.tv);nanstd(s_NTOE.tv)};
summ.min = {nanmin(well.depth);nanmin(lake.depth);nanmin(creek.depth);nanmin(creek_cms_c.cms);nanmin(s_BLKM.tv);nanmin(s_MIDB.tv);nanmin(s_NTOE.tv)};
summ.max = {nanmax(well.depth);nanmax(lake.depth);nanmax(creek.depth);nanmax(creek_cms_c.cms);nanmax(s_BLKM.tv);nanmax(s_MIDB.tv);nanmax(s_NTOE.tv)};
summ.yr = {nanmean(0);nanmean(0);nanmean(0);nanmean(0);nanmean(s_BLKM.tv)*365/10;nanmean(s_MIDB.tv)*365/10;nanmean(s_NTOE.tv)*365/10};

%GPS summary ONLY

GPSsumm = table('RowNames', {'BLKM'; 'MIDB'; 'NTOE'; 'BLOK'; 'BLKS'; 'STOE';'BASE'});

%averages
GPSsumm.mean = {nanmean(s_BLKM.tv);nanmean(s_MIDB.tv);nanmean(s_NTOE.tv);nanmean(s_BLOK.tv);nanmean(s_BLKS.tv);nanmean(s_STOE.tv);nanmean(s_BASE.tv)};
GPSsumm.std = {nanstd(s_BLKM.tv);nanstd(s_MIDB.tv);nanstd(s_NTOE.tv);nanstd(s_BLOK.tv);nanstd(s_BLKS.tv);nanstd(s_STOE.tv);nanstd(s_BASE.tv)};
GPSsumm.min = {nanmin(s_BLKM.tv);nanmin(s_MIDB.tv);nanmin(s_NTOE.tv);nanmin(s_BLOK.tv);nanmin(s_BLKS.tv);nanmin(s_STOE.tv);nanmin(s_BASE.tv)};
GPSsumm.max = {nanmax(s_BLKM.tv);nanmax(s_MIDB.tv);nanmax(s_NTOE.tv);nanmax(s_BLOK.tv);nanmax(s_BLKS.tv);nanmax(s_STOE.tv);nanmax(s_BASE.tv)};
GPSsumm.yr = {nanmean(s_BLKM.tv)*365/10;nanmean(s_MIDB.tv)*365/10;nanmean(s_NTOE.tv)*365/10;nanmean(s_BLOK.tv)*365/10;nanmean(s_BLKS.tv)*365/10;nanmean(s_STOE.tv)*365/10;nanmean(s_BASE.tv)*365/10};
