

num_games = 10000;

counts = [0, 0];
record_probs = zeros(num_games, 2);
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

    record_probs(i,:) = [counts(1)/i, counts(2)/i];

    if rem(i,1000) == 0
        subplot(2,1,1)
        bar(counts/i)
        set(gca, 'xticklabel', {'keep'; 'switch'})
        ylim([0,1])
        title('Monty Hall Probabilities')
        

        subplot(2,1,2)
        plot((1:i), record_probs(1:i,:), '-')
        ylim([0,1])

        drawnow
    end

end
