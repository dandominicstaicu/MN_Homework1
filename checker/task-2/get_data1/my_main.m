%[Y InitialMatrix] = parse_csv_file("test.in");
%FeatureMatrix = prepare_for_regression(InitialMatrix);

%load("../checker/input/task2/linear_cost_1");


%[Error] = linear_regression_cost_function(weights, y, X);

%     [Y InitialMatrix] = parse_csv_file("../checker/input/task2/Housing.csv");
%   [FeatureMatrix] = prepare_for_regression(InitialMatrix);
   % alpha = (1e-4)^4;
    %[m n] = size(FeatureMatrix);
    %iter = 125;

    %[Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter);
    


% load("../checker/input/task2/normal_eq1");

%     tol = 1e-10;
%     max_iter = 200;

%     [Theta] = normal_equation(X, y, tol, max_iter);



%     lambda = 1;

%     [Error] = lasso_regression_cost_function(weights, y, X, lambda);

% load("../../input/task2/linear_cost_1");
load("../checker/input/task2/linear_cost_1");
    lambda = 1;

    [Error] = ridge_regression_cost_function(weights, y, X, lambda);


