%% More on loss of significance
%% Avoid adding a small number to a large number
% Define a large number and a small number
large_number = 1e16;   % A large number
small_number = 1e-8;   % A small number

% Add the small number to the large number
result = large_number + small_number;

% Display the results
disp('Large number:');
disp(large_number);

disp('Small number:');
disp(small_number);

disp('Result of adding the small number to the large number:');
disp(result);

% Check if the result is exactly the same as the large number
if result == large_number
    disp('The small number was lost due to floating-point precision.');
else
    disp('The small number was preserved.');
end

