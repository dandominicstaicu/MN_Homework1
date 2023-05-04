function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

  % TODO: decode_path implementation
  	len = length(path) - 1;
	decoded_path = zeros(len, 2);
	for i = 1:len
		line_ind = 1;
		while path(i) > cols
			path(i) = path(i) - cols;
			line_ind = line_ind + 1;
		endwhile

		decoded_path(i, :) = [line_ind, path(i)];
	endfor


endfunction
