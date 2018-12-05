function gps_out = init_zero(gps_in)
%help: Find the first value in n,e,and u residuals and sets this to be the
%origin, 0, at the initial date of the experiment
%gps_in MUST be a table of date,n,e,u format INCLUDING interpolated fill
%points
%--
% Essentially reduces position offset at the initialization of GPS signals

i_n = find(~isnan(gps_in.n), 1);
i_e = find(~isnan(gps_in.e), 1);
i_u = find(~isnan(gps_in.u), 1);

first_n = gps_in.n(i_n);
first_e = gps_in.e(i_e);
first_u = gps_in.u(i_u);

gps_out = gps_in;
gps_out.n = gps_in.n - first_n;
gps_out.e = gps_in.e - first_e;
gps_out.u = gps_in.u - first_u;

return