% Copyright (c) 2023 Dan-Dominic Staicu 311CAb
function [G, c] = get_Jacobi_parameters(Link)

	% split the matrix into G and c
	% which are used in jacobi algorithm
	[n, m] = size(Link);

	G = Link(1 : n - 2, 1 : m - 2);

	c = Link(1 : n - 2, m - 1);

endfunction
