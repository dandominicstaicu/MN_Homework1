function [Y, InitialMatrix] = parse_data_set_file(file_path)
	data_file = fopen(file_path, 'r');
	nm = fscanf(data_file, '%d', 2);
	n = nm(1);
	m = nm(2);
	Y = zeros(n, 1);

	% init the matrix as cell type
	InitialMatrix = cell(n, m);
	for i = 1:n
		% read the first column in Y
		Y(i) = fscanf(data_file, '%ld', 1);
		for j = 1:m
			InitialMatrix{i, j} = fscanf(data_file, '%s', 1);
		endfor
	endfor

	fclose(data_file);
endfunction