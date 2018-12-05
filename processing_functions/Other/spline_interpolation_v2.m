%User defined functions
%Currently using the cftool toolbox (Curve Fitting Toolbox), not this.
%Manual implementation would be nice to avoid that dependency if possible

%new funtion, exports u and v, input of A B C
function [smooth_out] = spline_interpolation_v2(x_var, y_var, smooth_model)
% help section : Explain what it does
% and how to call it
%Usage: [u,v] = myfun(A,B,C);
% Explain Inputs and outputs here
% A = some input, what should be here (vector computation, etc)
%NO BLANK LINES

% plot(x_var, y_var, '-sr', 'LineWidth', 2);

%cftool(gps_in.date, gps_in.t)
%pause;

new_x = x_var;    %new could be used to collect all NAN spots, currently redundant
new_y = smooth_model(new_x);

% hold on; % Don't destroy the first curve plotted.
% plot(new_x, new_y, '-ob');
% title('Spline Fit Check', 'FontSize', 20);
% legend('Original Points', 'Spline Points');

smooth_out = new_y;

%MUST have a return value ending function
return

