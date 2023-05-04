function [matrix] = initialize_weights(L_prev, L_next)
  	eps_0 = sqrt(6) / sqrt(L_prev + L_next);

	% fill the matrix with random values mapped in [-eps_0, eps_0]
	% rand(L_next, L_prev + 1) generates a matrix of random values from [0; 1]
	% 2 * eps_0 scales the range to [0; 2 * eps_0]
	% - eps_0 shifts the interval to [-eps_0, eps_0]
	matrix = rand(L_next, L_prev + 1) * 2 * eps_0 - eps_0;
endfunction
