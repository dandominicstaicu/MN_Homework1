function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)


	% Init the values
	[m, n] = size(FeaturesMatrix);
	new_mat = [zeros(m, 1) FeaturesMatrix];
	Theta = zeros(n + 1, 1);

	% Check if matrix is positively defined 
	if !min(eig(new_mat' * new_mat)) <= 0
		return;
	endif

	% Calculate Theta using Conjugate Gradient Method
	A = new_mat' * new_mat;
	b = new_mat' * Y;

	r = b - A * Theta;
	p = r;

	for i = 1 : iter
		alpha = (r' * r) / (p' * A * p);
		Theta = Theta + alpha * p;
		r_new = r - alpha * A * p;
		if norm(r_new) < tol
			break;
		endif
		beta = (r_new' * r_new) / (r' * r);
		p = r_new + beta * p;
		r = r_new;
	endfor

endfunction
