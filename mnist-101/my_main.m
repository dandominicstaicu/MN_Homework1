%task 1

%[X, y] = load_dataset("../checker/input/task3/ex1.mat");


%task2

% X = eye(2);
%     y = [1; 1];

%     [X1 y1 X2 y2] = split_dataset(X, y, 0.5);

%     % fdisp(fout, size(X1));
%     % fdisp(fout, size(X2));
%     % fdisp(fout, size(y1));
%     % fdisp(fout, size(y2));

%     newX = [X1; X2];
%     newY = [y1; y2];

% 	ans1 = norm(newX ^ 2 - eye(2));
% 	ans2 = norm(newY - y);

%     % fdisp(fout, norm(newX ^ 2 - eye(2)));
%     % fdisp(fout, norm(newY - y));

%task3

% L_prev = 3;
%     L_next = 3;
%     A = initialize_weights(L_prev, L_next);
    % for i=1:size(A, 1)
    %   fprintf(fout, "%f ", A(i, :));
    %   fprintf(fout, "\n");
    % endfor


	%task4
fout = fopen("out", "w+");
	load("../checker/input/task3/cost1.mat");

    input_layer_size = 400;
    hidden_layer_size = 25;
    output_layer_size = 10;

    lambda = 0;
    [J, grad] = cost_function(weights, X, y, lambda, input_layer_size, ...
                            hidden_layer_size, output_layer_size);
    %fdisp(fout, [J; grad], "%.5f");
	fprintf(fout, "%.5f\n", [J;grad]);
    fclose(fout);
	
    
    