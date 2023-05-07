% Copyright (c) 2023 Dan-Dominic Staicu 311CAb
function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
	m = size(X, 1);

	% random permutation of ind
	rand_inds = randperm(m);

	interval = m * percent;

	%split inds in training and test sets according to the percent
	train_inds = rand_inds(1 : floor(interval));
	test_inds = rand_inds(floor(interval) + 1 : end);


	% extract to the output variables
	X_train = X(train_inds, :);
	y_train = y(train_inds);

	X_test = X(test_inds, :);
	y_test = y(test_inds);
endfunction
