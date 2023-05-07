% Copyright (c) 2023 Dan-Dominic Staicu 311CAb
function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
	% Theta -> the vector of weights
	% Y -> the vector with all actual values
	% FeatureMatrix -> the matrix with all training examples
	% lambda -> regularization parameter that controls the amount of 
	%           shrinkage applied to the regression coefficients

	% Error -> the error of the regularized cost function

	% number o training examples
  	m = size(FeatureMatrix, 1);

	% add a bias column of 1s to the matrix
  	X = [zeros(m, 1) FeatureMatrix];

  	h_x = X * Theta;

	% calculate the error of cost function
  	Error = sum((h_x - Y) .^ 2) / (2 * m) + lambda * sum(Theta(2 : end) .^ 2);
endfunction