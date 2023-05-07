function [path] = heuristic_greedy(start_position, probabilities, Adj)
  	path = [start_position];
	[n, m] = size(probabilities);
	visited = zeros(n * m + 2, 1);
	visited(start_position) = 1;

	[adj_n, adj_m] = size(Adj);

	while !isempty(path)
		pos = path(end);
		if pos >= adj_n - 1
      		path = path';
			return;
		endif
		
		neighbors = find(Adj(pos, :) != 0);
		unvisited_neighbors = neighbors(visited(neighbors) == 0);

		if isempty(unvisited_neighbors)
			path = path(1 : end - 1);
		endif

		[~, max_prob_ind] = max(probabilities(unvisited_neighbors));
		max_prob_neighbor = unvisited_neighbors(max_prob_ind);
		visited(max_prob_neighbor) = 1;
		path = [path, max_prob_neighbor];

	endwhile
	path = path';
endfunction