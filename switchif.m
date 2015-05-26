%Test whether switch statement or nested if-else statements are faster.

('Nested if else')
if 1>2
    fprintf('Hi\n')
else
    fprintf('What?\n')
end
toc

('Switch statement')
tic
    switch
        case 1>2;
            fprintf('Hi\n')
        otherwise
            fprintf('What?\n')
    end
toc
    

