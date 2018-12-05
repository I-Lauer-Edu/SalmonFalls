%converts from serial dates 'datenum' to datetime vectors
sw = input(' 1 = datenum to datetime, 2 = datetime to datenum ');
switch sw
    case 1
        
        sw = input(' 1 = gps, 2 = water ');
    switch sw
        case 1

t_BLOK = s_BLOK;
t_BLKM = s_BLKM;
t_BLKS = s_BLKS;
t_MIDB = s_MIDB;
t_NTOE = s_NTOE;
t_STOE = s_STOE;
t_BASE = s_BASE;


s_BLOK.date = datetime(s_BLOK.date,'ConvertFrom', 'datenum');
s_BLKM.date = datetime(s_BLKM.date,'ConvertFrom', 'datenum');
s_BLKS.date = datetime(s_BLKS.date,'ConvertFrom', 'datenum');
s_MIDB.date = datetime(s_MIDB.date,'ConvertFrom', 'datenum');
s_NTOE.date = datetime(s_NTOE.date,'ConvertFrom', 'datenum');
s_STOE.date = datetime(s_STOE.date,'ConvertFrom', 'datenum');
s_BASE.date = datetime(s_BASE.date,'ConvertFrom', 'datenum');
% t = datetime(s_NTOE.date,'ConvertFrom', 'datenum')
        case 2
well.date = datetime(well.date,'ConvertFrom', 'datenum');
lake.date = datetime(lake.date,'ConvertFrom', 'datenum');
creek.date = datetime(creek.date,'ConvertFrom', 'datenum');
    end
    
    case 2
        sw = input(' 1 = gps, 2 = water ');
switch sw
    case 1

t_BLOK = s_BLOK;
t_BLKM = s_BLKM;
t_BLKS = s_BLKS;
t_MIDB = s_MIDB;
t_NTOE = s_NTOE;
t_STOE = s_STOE;
t_BASE = s_BASE;


s_BLOK.date = datenum(s_BLOK.date);
s_BLKM.date = datenum(s_BLKM.date);
s_BLKS.date = datenum(s_BLKS.date);
s_MIDB.date = datenum(s_MIDB.date);
s_NTOE.date = datenum(s_NTOE.date);
s_STOE.date = datenum(s_STOE.date);
s_BASE.date = datenum(s_BASE.date);
% t = datetime(s_NTOE.date,'ConvertFrom', 'datenum')  
    case 2
well.date = datenum(well.date);
lake.date = datenum(lake.date);
creek.date = datenum(creek.date);
end
        
end

