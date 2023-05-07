% Copyright (c) 2023 Dan-Dominic Staicu 311CAb
function [Y, InitialMatrix] = parse_csv_file(file_path)
	csv_file = fopen(file_path, 'r');

	% step over the header line
	header = fgetl(csv_file);

	line = fgetl(csv_file);
	i = 1;
	j = 1;
	InitialMatrix = cell(1, 1);

	% while it can read from file
	while ischar(line)
		j = 1;

		% split every lines by ,
		args = strsplit(line, ',');
		[n m] = size(args);

		Y(i) = str2num(args{1, 1});
		for k = 2 : m
			InitialMatrix{i, j} = args{1, k};
			j++;
		endfor

		i++;
		line = fgetl(csv_file);
	endwhile

	% transform the line array to an column array
	Y = Y';

endfunction
