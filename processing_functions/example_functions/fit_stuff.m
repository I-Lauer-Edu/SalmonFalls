
%help
cont = input('Create a new fit model? y/n: ','s');
if cont == 'y'
    cftool(xvar, yvar)
    disp('After the smoothing model is saved, Hit ENTER to continue ...')
    pause
end
smoothed = xvar;
smoothed.spline = spline_interpolation_v2(xvar,yvar,fittedmodel);
disp(' Fit complete... ')
disp(' ')