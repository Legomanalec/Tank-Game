%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Firing physics for the tank program


function rand_r = Firing_Physics(rand_r)
    rand_r = rand_r;
    
    
    


    %Code used to find random tank placement
    % rand_r = randi(40)/10;

    % left_tank = rectangle('position', [(rand_r + .25), landscape(rand_r + .25), .2, .2]);
    % left_tank.FaceColor = [ .75 .25 .25];

    % right_tank = rectangle('position', [(rand_r + pi - .5), landscape(rand_r + pi -.5), .2, .2]);
    % right_tank.FaceColor = [ .25 .25 .75];
    %inputs nessary for the program
    % Leftpos = left_tank; %initial position of left tank
    % Rightpos = right_tank; %initial position of right tank
    Initial_velocity = 20;%this will be connected to knob later
    fireangle = 45; % from 0 to 180. Want to attempt to make bullet travel back to graph
    onesixsevenmm_cannonball = 19; %kg
    g = 9.81; %m/s^2
    wind = 20; %m/s this will have rand funtion attatched and possibly a more realistic range
    %time calculations
    dt = 10e-4; % time discretizationseconds
    tmax = 5; % seconds, maximum calculationtime
    t = 0:dt:tmax;
    disp(t);
    %calcultations to have the working program
    %initial definition of variables above at time = 0
    x(1) = rand_r + .25; %initial position of x cordinate talk to alec about finding x and y to make work
    y(1) = landscape(rand_r + .25);
    Vx(1) = Initial_velocity*cosd(fireangle);
    Vy(1) = Initial_velocity*sind(fireangle);
    ax(1) = (1/onesixsevenmm_cannonball) * (-1)*0.05 * (Vx(1) - wind)^2;
    ay(1) = (1/onesixsevenmm_cannonball) * ((-1)*0.05 * Vy(1)^2 - onesixsevenmm_cannonball*g);
   
    
    
    for i = 2:length(t)
        x(i) = x(i-1) + Vx(i-1)*dt + 1/2*ax(i-1)*dt^2;
        y(i) = y(i-1) + Vy(i-1)*dt + 1/2*ay(i-1)*dt^2;

        Vx(i) = (x(i) - x(i-1))/dt;
        Vy(i) = (y(i) - y(i-1))/dt;

        ax(i) = (1/onesixsevenmm_cannonball) * (-1)*0.05 * (Vx(i) - wind)^2;
        ay(i) = (1/onesixsevenmm_cannonball) * ((-1)*0.05 * Vy(i)^2 - onesixsevenmm_cannonball*g);
    end

end


