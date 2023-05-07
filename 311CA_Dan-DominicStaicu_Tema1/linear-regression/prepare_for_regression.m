function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
	[n m] = size(InitialMatrix);
	% init the new matrix with one more column
	% (as we know an argument splits into 2 cells)
	FeatureMatrix = zeros(n, m + 1);

	% apply str2double to all elements inside the matrix
	numMat = cellfun(@(x) str2double(x), InitialMatrix, 'UniformOutput', false);
	numMat = cell2mat(numMat);

	new_j = 1;
	for i = 1 : n
		new_j = 1;
		for j = 1 : m
			% if str2doube was applied to a string, it's value in numMat is nan
			if isnan(numMat(i, j))
				if strcmp(InitialMatrix{i, j}, "yes")
					FeatureMatrix(i, new_j) = 1;
					
				elseif strcmp(InitialMatrix{i, j}, "no")
					FeatureMatrix(i, new_j) = 0;

				elseif strcmp(InitialMatrix{i, j}, "semi-furnished")
					FeatureMatrix(i, new_j) = 1;
					FeatureMatrix(i, new_j + 1) = 0;
					new_j++;

				elseif strcmp(InitialMatrix{i, j}, "unfurnished")
					FeatureMatrix(i, new_j) = 0;
					FeatureMatrix(i, new_j + 1) = 1;
					new_j++;

				elseif strcmp(InitialMatrix{i, j}, "furnished")
					FeatureMatrix(i, new_j) = 0;
					FeatureMatrix(i, new_j + 1) = 0;
					new_j++;

				endif
			else
				FeatureMatrix(i, new_j) = numMat(i, j);
			endif
			new_j++;
		endfor

	endfor
endfunction
