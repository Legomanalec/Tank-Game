%tank_cannon_setup

  %Tank cannons  
            
            %Right Tank Cannon
            r_cannon_x1 = rand_r + pi -0.40;
            r_cannon_x2_pivot = rand_r + pi -0.40;
            r_cannon_y1 = landscape(rand_r + pi - 0.5) + 1;
            r_cannon_y2_pivot = landscape(rand_r + pi - 0.5);
            
            hold(app.UIAxes, 'on')
           right_cannon_initial = plot(app.UIAxes, [r_cannon_x1 r_cannon_x2_pivot], [r_cannon_y1 r_cannon_y2_pivot], 'b', 'LineWidth', 3);
            hold(app.UIAxes, 'off')
            
            %Left Tank Cannon
            l_cannon_x1 = rand_r + 0.35;
            l_cannon_x2_pivot = rand_r + 0.35;
            l_cannon_y1 = landscape(rand_r + 0.25);
            l_cannon_y2_pivot = landscape(rand_r + 0.25) + 1;
       
            hold(app.UIAxes, 'on')
            left_cannon_initial = plot(app.UIAxes, [l_cannon_x1 l_cannon_x2_pivot], [l_cannon_y1 l_cannon_y2_pivot], 'r', 'LineWidth', 3);   
            hold(app.UIAxes, 'off')
            
            left_cannon_new = left_cannon_initial;
            right_cannon_new = right_cannon_initial;
            
            set(app.PlayerTwoTurnLabel, 'Visible', 'off')
        end