function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

% COST_FUNCTION Implements the neural network cost function and gradient for a two-layer neural network
% [J, grad] = cost_function(params, X, y, lambda, input_layer_size, hidden_layer_size, output_layer_size) computes 
% the cost and gradient of the neural network. The parameters for the neural network are "unrolled" into the 
% vector params and need to be converted back into the weight matrices. The returned parameter grad should be a 
% "unrolled" vector of the partial derivatives of the neural network.
%
% params -> vector containing the weights from the two matrices
%           Theta1 and Theta2 in an unrolled form (as a column vector)
% X -> the feature matrix containing the training examples
% y -> a vector containing the labels (from 1 to 10) for each
%      training example
% lambda -> the regularization constant/parameter
% [input|hidden|output]_layer_size -> the sizes of the three layers
%
% J -> the cost function for the current parameters
% grad -> a column vector with the same length as params
% These will be used for optimization using fmincg

	theta_sep = hidden_layer_size * (input_layer_size + 1);

	% get Theta1 and Theta2 from params
	theta1 = reshape(params(1 : theta_sep), hidden_layer_size, input_layer_size + 1);
	theta2 = reshape(params(theta_sep + 1 : end), output_layer_size, hidden_layer_size + 1);

	% Number of training examples
	m = size(X, 1);

	% Convert labels to vectors
	y_matrix = eye(output_layer_size)(y, :);

	% Forward propagation
	% add a column of ones to the input matrix X to get the bias unit for the input layer
	a1 = [ones(m, 1) X];
	% calculate the activations and outputs of the hidden layer
	z2 = a1 * theta1';
	a2 = [ones(size(z2, 1), 1) sigmoid(z2)];
	% calculate the activations and outputs of the output layer
	z3 = a2 * theta2';
	hypothesis = sigmoid(z3);

	% Calculate cost
	J = 0.00000;
	% calculate the cost using the cross-entropy loss function
	J = (-1 / m) * sum(sum(y_matrix .* log(hypothesis) + (1 - y_matrix) .* log(1 - hypothesis))) + ...
		(lambda / (2 * m)) * (sum(sum(theta1(:, 2 : end) .^ 2)) + sum(sum(theta2(:, 2 : end) .^ 2)));

	% Back propagation
	% compute the error of the output layer
	delta3 = hypothesis - y_matrix;
	% calculate the derivate of the sigmoid function for the activations of the hidden layer
	sigmoid_gradient_z2 = sigmoid(z2) .* (1 - sigmoid(z2));
	% calculate the error of the hidden layer
	delta2 = (delta3 * theta2) .* [ones(size(z2, 1), 1) sigmoid_gradient_z2];
	% remove the error corresponding to the bias unit of the hidden layer
	delta2 = delta2(:, 2 : end);

	% Calculate the gradients
	Theta1_grad = (1 / m) * (delta2' * a1) + (lambda / m) * [zeros(size(theta1, 1), 1) theta1(:, 2 : end)];
	Theta2_grad = (1 / m) * (delta3' * a2) + (lambda / m) * [zeros(size(theta2, 1), 1) theta2(:, 2 : end)];

	% Unroll gradients into a single vector
	grad = [Theta1_grad(:); Theta2_grad(:)];

endfunction