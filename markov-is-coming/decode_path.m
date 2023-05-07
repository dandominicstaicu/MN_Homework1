% Copyright (c) 2023 Dan-Dominic Staicu 311CAb
function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  	%                 corresponding to path states
  	len = length(path) - 1;
	decoded_path = zeros(len, 2);

	% iterate through all elements in the path array
	for i = 1 : len
		line_ind = 1;

		% state = lines * cols + cols_rest
		% i_elem = [state / cols]
		% j_elem = cols_rest
		while path(i) > cols
			path(i) = path(i) - cols;
			line_ind = line_ind + 1;
		endwhile

		decoded_path(i, :) = [line_ind, path(i)];
	endfor


endfunction
