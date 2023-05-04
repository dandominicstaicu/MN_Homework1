function [G, c] = get_Jacobi_parameters(Link)

	[n, m] = size(Link);

	G = Link(1:n-2, 1:m-2);

	c = Link(1:n-2, m-1);

endfunction
