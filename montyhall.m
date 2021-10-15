

num_games = 10000;

counts = [0, 0];
for i = 1:num_games

    % generate new location for grand prize
    car_location = randi(3);

    % select a door
    first_choice = randi(3);

    % Monty Hall reveals the unselected door that is the goat
    show_door = setdiff([1,2,3], [first_choice, car_location]);

    % decide to replace your first choice
    second_choice = setdiff([1,2,3], [show_door, first_choice]);

    if second_choice == car_location % switched to the winning door
        counts(2) = counts(2) + 1;
    else % sticking with original door
        counts(1) = counts(1) + 1;
    end

    if rem(i,1000) == 0
        bar(counts/i)
        set(gca, 'xticklabel', {'keep'; 'switch'})
        ylim([0,1])
        title('Monty Hall Probabilities')
        drawnow
    end

end
