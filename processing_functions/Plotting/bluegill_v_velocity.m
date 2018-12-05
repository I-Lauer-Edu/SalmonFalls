i_months = months(13:27);
i_tick_locations = i_months;

figure
subplot(2,1,1)
yyaxis left
p1 = plot(lake_l.date, lake_l.depth, '-b');
p1.LineWidth = 2;
hold on
% p2 = plot(creek.date, creek.depth+(min(lake.depth)-min(creek.depth)), '-r');
% p3 = plot(creek_fill.date, creek_fill.depth+(min(lake.depth)-min(creek.depth)), ':r');
title('2: Bluegill Lake')
ylabel('Water Level (m)')
title('14-day lag: Bluegill Lake Water Level and Slump Velocity')
set(gca,'XTick',i_tick_locations)
datetick('x','mmm yy','keepticks');
ylim([0.8 3])
xtickangle(45);

yyaxis right
i_ymin = 0;
i_p5 = plot(s_BLKM.date, s_BLKM.hv, '-', 'Color', bc);
i_p6 = plot(s_MIDB.date, s_MIDB.hv, '-', 'Color', gc);
i_p7 = plot(s_NTOE.date, s_NTOE.hv, '-', 'Color', yc);
i_e1 = plot(events.date(89), events.events(89)+i_ymin, '*b');
i_e2 = plot(events.date(76), events.events(76)+i_ymin, '*b');
i_e3 = plot(events.date(289), events.events(289)+i_ymin, '*b');
ylabel('Daily Velocity (mm/day)')
legend([p1 i_p5 i_p6 i_p7 i_e1],'Bluegill','BLKM','MIDB', 'NTOE', 'Events')
ylim([i_ymin 1.2])
yyaxis left

figure
plot(lake_l.depth, s_BLKM.hv, 'o', 'Color', bc);
hold on
plot(lake_l.depth, s_MIDB.hv, 'o', 'Color', gc);
plot(lake_l.depth, s_NTOE.hv, 'o', 'Color', yc);
ylabel('Water Level (m)')
xlabel('Daily Velocity (mm/day)')
title('14-day lag: Bluegill Water level vs Velocity')

clear i_*;
