% Copyright (c) 2023 Dan-Dominic Staicu 311CAb
function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
	% FeatureMatrix -> the matrix with all training examples
	% Y -> the vector with all actual values
	% n -> the number of predictors
	% m -> the number of trainings
	% alpha -> the learning rate
	% iter -> the number of iterations

	% Theta -> the vector of weights

	% init Theta with zeros in cnt of n + 1 becuase of theta values start
	% from Theta(0), Theta(1), ..., Theta(n)
	Theta = zeros(n + 1, 1);

	% add a bias 0s column at FeatureMatrix so the dimensions match
	X = [zeros(m, 1) FeatureMatrix];

  	for i = 1:iter
		% calculate h_theta(x) for every value in X
    	h_theta = X * Theta;

		% calculate error between h_theta(x) and values of Y
    	error = h_theta - Y;

		% calculate the gradient
    	gradient = X' * error / m; 

		% get new coeficients using the gradient
    	Theta = Theta - alpha * gradient;
	endfor
endfunction