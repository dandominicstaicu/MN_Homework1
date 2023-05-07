% Copyright (c) 2023 Dan-Dominic Staicu 311CAb
function [Adj] = get_adjacency_matrix(Labyrinth)
	#get the size of labyrinth
  	[n, m] = size(Labyrinth);
	
	% create an empty sparse matrix
  	Adj = sparse(n * m + 2, n * m + 2);

	% create a matrix of the same size as the maze and keep the index of states
	states = zeros(n, m);
	for i = 1:n
		for j = 1:m
			states(i,j) = (i - 1) * m + j;
		endfor
	endfor

	for i = 1:n
		for j = 1:m
			% break each element from the matrix into bits
	  		cell = Labyrinth(i, j);
	  		b3 = bitget(cell, 4);
			b2 = bitget(cell, 3);
			b1 = bitget(cell, 2);
			b0 = bitget(cell, 1);
			
			% for each bit check if there is a connection
		
			% if the connection is to a outer wall of the maze
			if i == 1
				if b3 == 0
					Adj(states(i, j), n * m + 1) = 1;
					Adj = sparse(Adj);
				endif

			%if it's an element inside the matrix
			elseif b3 == 0
				Adj(states(i,j), states(i - 1, j)) = 1;
				Adj = sparse(Adj);
			endif

			if i == n
				if b2 == 0
					Adj(states(i, j), n * m + 1) = 1;
					Adj = sparse(Adj);
				endif
			elseif b2 == 0
				Adj(states(i, j), states(i + 1, j)) = 1;
				Adj = sparse(Adj);
			endif
			
			if j == m
				if b1 == 0
					Adj(states(i, j), n * m + 2) = 1;
					Adj = sparse(Adj);
				endif
			elseif b1 == 0
				Adj(states(i, j), states(i, j + 1)) = 1;
				Adj = sparse(Adj);
			endif

			if j == 1
				if b0 == 0
					Adj(states(i, j), n * m + 2) = 1;
					Adj = sparse(Adj);
				endif
			elseif b0 == 0
				Adj(states(i, j), states(i, j - 1)) = 1;
				Adj = sparse(Adj);
			endif

		endfor
	endfor

	% connection from win-win lose-lose
	Adj(n * m + 1, n * m + 1) = 1;
	Adj(n * m + 2, n * m + 2) = 1;
	Adj = sparse(Adj);

endfunction