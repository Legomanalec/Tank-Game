
classdef Main_UI < matlab.apps.AppBase

    
    
    % Properties that correspond to app components
    properties (Access = public)
        UIFigure         matlab.ui.Figure;
        UIAxesHealth     matlab.ui.control.UIAxes;
        UIAxes           matlab.ui.control.UIAxes;
        AngleGaugeLabel  matlab.ui.control.Label;
        AngleKnob        matlab.ui.control.Knob;
        PowerKnobLabel   matlab.ui.control.Label;
        PowerKnob        matlab.ui.control.Knob;
        WindGaugeLabel   matlab.ui.control.Label;
        WindGauge        matlab.ui.control.SemicircularGauge;
        StartButton      matlab.ui.control.Button;
        FireButton       matlab.ui.control.Button;
        AngleSpinner     matlab.ui.control.Spinner;
        HealthLabel      matlab.ui.control.Label;
        PlayerLabel      matlab.ui.control.Label;
    end

    methods 

        % Button pushed function: StartButton
        function StartButtonPushed(app, event)
           close(figure(1))
            %Landscape plot with tanks
            
            rand_r = randi(40)/10;
                      
            x = rand_r:.1:(pi + rand_r);

            y = 2 + (sin(0.5*pi.*x) + sin(1.5*pi.*x)); 
          
            plot(app.UIAxes, x, y)
            plot_main_area = area(app.UIAxes, x, y);
            plot_main_area.FaceColor = [ .25 .75 .25];
            xlim(app.UIAxes, [rand_r (pi + rand_r)])
            ylim(app.UIAxes, [0 9])
            
        %Tank Setup 
        
            %Left tank
            left_tank = rectangle(app.UIAxes, 'position', [(rand_r + .25), landscape(rand_r + .25), .2, .4]);
            left_tank.FaceColor = [1 0 0];
            
            %Left Tank Cannon
            l_cannon_x1 = rand_r + 0.35;
            l_cannon_x2_pivot = rand_r + 0.35;
            l_cannon_y1 = landscape(rand_r + 0.25);
            l_cannon_y2_pivot = landscape(rand_r + 0.25) + 1;
       
            hold(app.UIAxes, 'on')
            plot(app.UIAxes, [l_cannon_x1 l_cannon_x2_pivot], [l_cannon_y1 l_cannon_y2_pivot], 'r')
            hold(app.UIAxes, 'off')
            
            
            %Right Tank
            right_tank = rectangle(app.UIAxes, 'position', [(rand_r + pi - .5), landscape(rand_r + pi -.5), .2, .4]);
            right_tank.FaceColor = [0 0 1];
            
            %Right Tank Cannon
            r_cannon_x1 = rand_r + pi -0.40;
            r_cannon_x2_pivot = rand_r + pi -0.40;
            r_cannon_y1 = landscape(rand_r + pi - 0.5) + 1;
            r_cannon_y2_pivot = landscape(rand_r + pi - 0.5);
            
            hold(app.UIAxes, 'on')
            plot(app.UIAxes, [r_cannon_x1 r_cannon_x2_pivot], [r_cannon_y1 r_cannon_y2_pivot], 'b')
            hold(app.UIAxes, 'off')
           
         
            
            %Health Bar Graph
            Health = [100 100];
            bar(app.UIAxesHealth, Health)
            
            
            %Firing Physics Function
            Firing_Physics(rand_r)
            
            
            
            
        end
        
        function FireButtonPushed(app, event)
            power = (app.PowerKnob.Value);
            angle = (app.AngleKnob.Value);
            
            %Change the firing angle (Visual)
            
            l_cannon_x1 = rand_r + 0.35;
            l_cannon_x2_pivot = rand_r + 0.35;
            l_cannon_y1 = landscape(rand_r + 0.25);
            l_cannon_y2_pivot = landscape(rand_r + 0.25) + 1;
            
            l_cannon_x1 = l_cannon_x1*cos(angle);
            l_cannon_y1 = l_cannon_y1*sin(angle);
            
            hold(app.UIAxes, 'on')
            plot(app.UIAxes, [l_cannon_x1 l_cannon_x2_pivot], [l_cannon_y1 l_cannon_y2_pivot], 'r')
            hold(app.UIAxes, 'off')
            
            
            
            disp(power)
            disp(angle)
                                 
        end
                    
    end
    

    % App initialization and construction
    methods 

        % Create UIFigure and components
        function createComponents(app)
            
                 
            
            
            
            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'UI Figure';

            % Plot of game
            app.UIAxes = uiaxes(app.UIFigure);
            app.UIAxes.XTick = [];
            app.UIAxes.XTickLabel = '';
            app.UIAxes.YTick = [];
            app.UIAxes.YTickLabel = '';
            app.UIAxes.Color = [0.0745 0.6235 1];
            app.UIAxes.Position = [1 182 640 299];

            % Health Plot
            app.UIAxesHealth = uiaxes(app.UIFigure);
            app.UIAxesHealth.XTick = [];
            app.UIAxesHealth.XTickLabel = '';
            app.UIAxesHealth.YTick = [];
            app.UIAxesHealth.YTickLabel = '';
            app.UIAxesHealth.Color = [1 1 1];
            app.UIAxesHealth.Position = [530 0 80 150];
            
            %Health Plot Label 
            app.HealthLabel = uilabel(app.UIFigure);
            app.HealthLabel.HorizontalAlignment = 'center';
            app.HealthLabel.Position = [550 165 36 22];
            app.HealthLabel.Text = 'Health';
            
            %Player Health Label
            app.PlayerLabel = uilabel(app.UIFigure);
            app.PlayerLabel.HorizontalAlignment = 'center';
            app.PlayerLabel.Position = [550 135 40 40];
            app.PlayerLabel.Text = 'P1 P2';
            
                       
            % Angle Guage Label
            app.AngleGaugeLabel = uilabel(app.UIFigure);
            app.AngleGaugeLabel.HorizontalAlignment = 'center';
            app.AngleGaugeLabel.Position = [50 15 36 22];
            app.AngleGaugeLabel.Text = 'Angle';

            % Create Angle Knob
            app.AngleKnob = uiknob(app.UIFigure, 'continuous');
            app.AngleKnob.Position = [40 50 60, 60];
            app.AngleKnob.Limits = [0 180];
            app.AngleKnob.MajorTicks = [0 30 60 90 120 150 180]
             
            % Power Knob Label
            app.PowerKnobLabel = uilabel(app.UIFigure);
            app.PowerKnobLabel.HorizontalAlignment = 'center';
            app.PowerKnobLabel.Position = [187 15 40 22];
            app.PowerKnobLabel.Text = 'Power';

            % Power Knob
            app.PowerKnob = uiknob(app.UIFigure, 'continuous');
            app.PowerKnob.Position = [176 50 60 60];
            
            % Wind Guage Label
            app.WindGaugeLabel = uilabel(app.UIFigure);
            app.WindGaugeLabel.HorizontalAlignment = 'center';
            app.WindGaugeLabel.Position = [318.5 22 33 22];
            app.WindGaugeLabel.Text = 'Wind';

            % Wind Guage
            app.WindGauge = uigauge(app.UIFigure, 'semicircular');
            app.WindGauge.Limits = [0 10];
            app.WindGauge.MajorTicks = [0 5 10];
            app.WindGauge.Position = [291 59 88 47];

            % Create StartButton
            app.StartButton = uibutton(app.UIFigure, 'push');
            app.StartButton.ButtonPushedFcn = createCallbackFcn(app, @StartButtonPushed, true);
            app.StartButton.Position = [11 138 100 22];
            app.StartButton.Text = 'Start';
            
            %Create Fire Button
            app.FireButton = uibutton(app.UIFigure, 'push');
            app.FireButton.ButtonPushedFcn = createCallbackFcn(app, @FireButtonPushed, true);
            app.FireButton.Position = [280 138 100 22];
            app.FireButton.Text = 'Fire';
            
            
            
            
        end
    end

    methods (Access = public)

        % Construct app
        function app = Main_UI

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end