mbta = input('Enter line letter in capitals: ','s');
    switch mbta
        case 'A';
            fprintf('This line is now obsolete!\n')
        case 'B';
            fprintf('Every 7 minutes\n')
        case 'C';
            fprintf('Every 10 minutes\n')
        case 'D';
            fprintf('Every 7 minutes\n')
        case 'E';
            fprintf('Every 12 minutes\n')
        otherwise
            fprintf('Error - there is no such trolley!\n')
    end
        