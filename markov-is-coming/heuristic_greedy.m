% Copyright (c) 2023 Dan-Dominic Staicu 311CAb
function [path] = heuristic_greedy(start_position, probabilities, Adj)
  	% - start_position: the starting node
	% - probabilities: a matrix containing the probability of success for each node in the graph
	% - Adj: the adjacency matrix of the graph

	% - path: a vector representing the path found by the algorithm

	% Initialize the path with the starting node
    path = [start_position];
    % Get the size of the probabilities matrix
    [n, m] = size(probabilities);
    % Initialize a vector to keep track of visited nodes
    visited = zeros(n * m + 2, 1);
    % Mark the starting node as visited
    visited(start_position) = 1;
    % Get the size of the adjacency matrix
    [adj_n, adj_m] = size(Adj);

    % While there are nodes to explore
    while !isempty(path)
        % Get the last node added to the path
        pos = path(end);
        % If the last node is the end node, return the path
        if pos >= adj_n - 1
            path = path';
            return;
        endif
        
        % Get the neighbors of the last node
        neighbors = find(Adj(pos, :) != 0);
        % Get the unvisited neighbors
        unvisited_neighbors = neighbors(visited(neighbors) == 0);

        % If there are no unvisited neighbors, remove the last node from the path
        if isempty(unvisited_neighbors)
            path = path(1 : end - 1);
        endif

        % Find the unvisited neighbor with the highest probability of success
        [~, max_prob_ind] = max(probabilities(unvisited_neighbors));
        max_prob_neighbor = unvisited_neighbors(max_prob_ind);
        % Mark the chosen neighbor as visited
        visited(max_prob_neighbor) = 1;
        % Add the chosen neighbor to the path
        path = [path, max_prob_neighbor];

    endwhile
    % If no path was found, return an empty vector
    path = path';
endfunction
