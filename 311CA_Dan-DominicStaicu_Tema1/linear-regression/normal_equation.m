% Copyright (c) 2023 Dan-Dominic Staicu 311CAb
function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
	[m, n] = size(FeaturesMatrix);

	% Add a column of zeros to the feature matrix
	new_mat = [zeros(m, 1) FeaturesMatrix];
	% Initialize the parameter vector
	Theta = zeros(n + 1, 1); 

	% Check if the matrix is positively defined
	% Check if the eigenvalues of the transpose of the feature matrix times the
	% feature matrix are positive
	if !min(eig(new_mat' * new_mat)) <= 0
		% If not, exit the function
		return;
	endif

	% Calculate Theta using Conjugate Gradient Method
	A = new_mat' * new_mat; 
	b = new_mat' * Y;

	% Initialize residual r
	r = b - A * Theta; 
	% Initialize search direction p
	p = r; 

	for i = 1 : iter 
		% Compute the step size alpha
		alpha = (r' * r) / (p' * A * p); 

		Theta = Theta + alpha * p;
		r_new = r - alpha * A * p;

		% Check if the norm of the new residual is smaller than the tolerance
		if norm(r_new) < tol 
			break;
		endif

		beta = (r_new' * r_new) / (r' * r);

		% Compute the new search direction
		p = r_new + beta * p;
		% Update the residual
		r = r_new;
	endfor

endfunction
