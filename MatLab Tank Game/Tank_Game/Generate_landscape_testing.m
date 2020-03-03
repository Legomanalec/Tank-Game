rand_r = randi(40)/10;
cannon_angle = 90;


x = rand_r:.1:(pi + rand_r);

y = 2 + (sin(0.5*pi.*x) + sin(1.5*pi.*x)); 


plot(app.UIAxes, x, y)
plot_main_area = area(app.UIAxes, x, y);
plot_main_area.FaceColor = [ .25 .75 .25];
xlim(app.UIAxes, [rand_r (pi + rand_r)])
ylim(app.UIAxes, [0 7])

left_tank = rectangle(app.UIAxes, 'position', [(rand_r + .25), landscape(rand_r + .25), .2, .2]);
left_tank.FaceColor = [ .75 .25 .25];
left_tank_cannon = rectangle(app.UIAxes, 'position', [(rand_r + .25), landscape(rand_r + .25), .2, .2]);
left_tank_cannon.FaceColor = [ .75 .25 .25];
left_tank_cannon = rotate(left_tank_cannon, cannon_angle);
show(left_tank_cannon)

right_tank = rectangle(app.UIAxes, 'position', [(rand_r + pi - .5), landscape(rand_r + pi -.5), .2, .2]);
right_tank.FaceColor = [ .25 .25 .75];

Firing_Physics