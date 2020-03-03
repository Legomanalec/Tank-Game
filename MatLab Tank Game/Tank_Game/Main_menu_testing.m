clc;
clear;

main_menu = menu('Select an option', 'Play Game', 'Instructions','Exit Game') 

if main_menu == 1
   %Run the main game function
   disp('Run Game') 
   Main_UI
elseif main_menu == 2
    %Deploy Instructions
    disp('Instructions')
    Instructions_function
    Main_menu_testing
elseif main_menu == 3
    %do_nothin_function()
end
