%fire_button_pressed_function

global rand_r;
global left_cannon_initial;
global right_cannon_initial;
global left_cannon_new;
global right_cannon_new;
global firing_var;

firing_var = firing_var + 1;   

power = (app.PowerKnob.Value);
angle = (app.AngleKnob.Value);

disp(power)
disp(angle)
       
       %Change the firing angle (Visual)
            
if mod(firing_var, 2) == 1

    set(left_cannon_initial, 'Visible', 'off')            
    set(left_cannon_new, 'Visible', 'off')

    l_cannon_x2_pivot = rand_r + 0.35;
    l_cannon_y2_pivot = landscape(rand_r + 0.25);

    % The pi/10 corrects for the difference in limits of the graphs 
    % since the y limit is larger than the x you must account for
    % it
    l_cannon_x1_new = l_cannon_x2_pivot - cosd(angle)*(pi/10) * 1;
    l_cannon_y1_new = l_cannon_y2_pivot + sind(angle) * 1;

    hold(app.UIAxes, 'on')
    left_cannon_new = plot(app.UIAxes, [l_cannon_x2_pivot l_cannon_x1_new], [l_cannon_y2_pivot l_cannon_y1_new], 'r', 'LineWidth', 3);
    hold(app.UIAxes, 'off')  

    set(app.PlayerTwoTurnLabel, 'Visible', 'on')
    set(app.PlayerOneTurnLabel, 'Visible', 'off')


elseif mod(firing_var, 2) == 0

    set(right_cannon_initial, 'Visible', 'off')
    set(right_cannon_new, 'Visible', 'off')

    r_cannon_x2_pivot = rand_r + pi -0.40;  
    r_cannon_y2_pivot = landscape(rand_r + pi - 0.5);

    % The pi/10 corrects for the difference in limits of the graphs 
    % since the y limit is larger than the x you must account for
    % it
    r_cannon_x1_new = r_cannon_x2_pivot + cosd(angle)*(pi/10) * 1;
    r_cannon_y1_new = r_cannon_y2_pivot + sind(angle) * 1;

    hold(app.UIAxes, 'on')
    right_cannon_new = plot(app.UIAxes, [r_cannon_x2_pivot r_cannon_x1_new], [r_cannon_y2_pivot r_cannon_y1_new], 'b', 'LineWidth', 3);
    hold(app.UIAxes, 'off')               

    set(app.PlayerOneTurnLabel, 'Visible', 'on')
    set(app.PlayerTwoTurnLabel, 'Visible', 'off')
end