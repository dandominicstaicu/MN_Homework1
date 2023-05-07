% Copyright (c) 2023 Dan-Dominic Staicu 311CAb
function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  	% Theta -> the vector of weights
	% Y -> the vector with all actual values
	% FeatureMatrix -> the matrix with all training examples
	% lambda -> regularization parameter that controls the amount of 
	%           shrinkage applied to the regression coefficients

	% Error -> the error of the regularized cost function

	
	% number o training examples
	m = length(Y); 

	% add a bias column of 1s to the matrix
  	FeMatrix = [ones(m,1) FeatureMatrix];

	% clculate the predictions
  	predictions = FeMatrix * Theta; 
  	sqErrors = (predictions - Y) .^ 2;

	% regularization term
  	regTerm = lambda * sum(abs(Theta));

	% calculate the error of cost function
  	Error = (1 / m) * sum(sqErrors) + regTerm;
endfunction
