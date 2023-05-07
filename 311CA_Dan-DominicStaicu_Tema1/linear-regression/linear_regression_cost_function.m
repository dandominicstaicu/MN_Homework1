function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  	% FeatureMatrix -> the matrix with all training examples

	% Error -> the error of the regularized cost function
	[m n] = size(FeatureMatrix);
	Error = 0;
	s_tot = 0;

	% sum from 1 to m
	for i = 1 : m 
		% calculate h(x)
		% where x is the m-th line of InitMat
		s = 0;
		for j = 1 : n
			% bcs theta starts from 0 to n, so the first elem is 0
			s = s + Theta(j + 1) * FeatureMatrix(i, j);
		endfor 

		s = s - Y(i);

		s = s ^ 2;

		s_tot = s_tot + s;
	endfor

	Error = s_tot / (2 * m);
endfunction