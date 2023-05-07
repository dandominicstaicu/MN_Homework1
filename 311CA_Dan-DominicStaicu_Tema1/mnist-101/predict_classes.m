function [classes] = predict_classes(X, weights, ...
                  input_layer_size, hidden_layer_size, ...
                  output_layer_size)
% X -> the feature matrix containing the examples to be predicted
% weights -> a column vector containing the weights from the two matrices
%            Theta1 and Theta2 in an unrolled form
% input_layer_size, hidden_layer_size, output_layer_size -> the sizes of the three layers
%
% classes -> a vector containing the predicted classes for each example in X

% Get Theta1 and Theta2 from weights
theta1 = reshape(weights(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, input_layer_size + 1);
theta2 = reshape(weights(hidden_layer_size * (input_layer_size + 1) + 1:end), output_layer_size, hidden_layer_size + 1);

% Perform forward propagation
m = size(X, 1);
a1 = [ones(m, 1) X];
z2 = a1 * theta1';
a2 = [ones(size(z2, 1), 1) sigmoid(z2)];
z3 = a2 * theta2';
hypothesis = sigmoid(z3);

% Return the predicted classes
[~, classes] = max(hypothesis, [], 2);

endfunction

