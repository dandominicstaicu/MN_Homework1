function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
	% perform the iterative Jacobi algorithm

	prev_x = x0;
	steps = 0;
	
	while 1
		steps++;

		x = G * prev_x + c;
		err = norm(x - prev_x);

		if (steps == max_steps) || (err < tol)
			return;
		endif
		
		prev_x = x;
	endwhile

endfunction