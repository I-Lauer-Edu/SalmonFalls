%Needs re-writing
%Most of these have been changed w/ final revision of thesis

%---------- Plotting ----------%
cont = input('Plot processed data? y/n? : ','s');
 
disp(' ')
while cont == 'y'
  
    data_type = input('Choose data: original (o), or spline (s)','s');

    if data_type == 's'
        disp('Spline Data')
        while cont == 'y'
            i_sw = input(' 1=Pos v. T, 2=WL v. T, 3=Vel v. T 4=Pos v Water, 5=Vel v Water : ');
            switch i_sw
                case 1
                    plot_residual
                case 2
                    plot_wl
                case 3
                    plot_vel
                case 4
                    plot_residuals_v_wl
                case 5
                    plot_vel_v_wl
            end
        cont = input('Plot again? y/n?','s');
        disp(' ')
        end

    elseif data_type == 'o'
        disp('Original Data')
        while cont == 'y'
            i_sw = input(' 1=Pos v. T, 2=WL v. T, 3=Vel v. T 4=Pos v Water, 5=Vel v Water : ');
            switch i_sw
                case 1
                    plot_residual
                case 2
                    plot_wl
                case 3
                    plot_vel
                case 4
                    plot_residuals_v_wl
                case 5
                    plot_vel_v_wl
            end
            cont = input('Plot again? y/n?','s');

        disp(' ')
        end
    else
        disp('Invalid Type, Try again');
    end
        cont = input('Plot again? y/n?','s');
end


        






