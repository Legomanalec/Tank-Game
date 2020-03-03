function generate_game(Axes_Game, Axes_Game_Health)
            global rand_r;
            
            rand_r = randi(40)/10;
                      
            x = rand_r:.1:(pi + rand_r);

            y = 2 + (sin(0.5*pi.*x) + sin(1.5*pi.*x)); 
          
            plot(Axes_Game, x, y)
            plot_main_area = area(Axes_Game, x, y);
            plot_main_area.FaceColor = [ .25 .75 .25];
            xlim(Axes_Game, [rand_r (pi + rand_r)])
            ylim(Axes_Game, [0 9])
            
        %Tank Setup 

            %Left tank
            left_tank = rectangle(Axes_Game, 'position', [(rand_r + .25), landscape(rand_r + .25), .2, .4]);
            left_tank.FaceColor = [1 0 0];
              
            
            %Right Tank
            right_tank = rectangle(Axes_Game, 'position', [(rand_r + pi - .5), landscape(rand_r + pi -.5), .2, .4]);
            right_tank.FaceColor = [0 0 1];
                
            
            %Health Bar Graph
            Health = [100 100];
            bar(Axes_Game_Health, Health)
end
