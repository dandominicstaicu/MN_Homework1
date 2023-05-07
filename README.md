# Numerical Methods - First Homework

## License

This Homework was written by **Dan-Dominic Staicu** 311CAb

## Homework quote

Fourth Law of Applied Terror: The night before the English History mid-term, your Biology instructor will assign 200 pages on planaria. 

    Corollary: Every instructor assumes that you have nothing else to do except study for that instructor's course.

Credits: https://www.angelo.edu/faculty/kboudrea/cheap/cheap3_murphy.htm#Computers

## Markov is coming

	This task uses *Markov's chain* in order to solve a path of a robot in a maze;
	
- parse_labyrinth gets a path to a text file, opens it, reads size of matrix
from it and finally reads the matrix;

- get_adjacency_matrix creates the adjacency matrix of size lines * cols + 2,
transforms numbers inside the cells to bit numbers, and than saves the links of
a cell to it's neighbors in a sparse matrix of 0s and 1s;

- get_link_matrix creates the link matrix from the adj_matrix by dividing every
element of a line by how many nnz elements are on that line;

- get_Jacobi_parameters creates 2 new matrixes by copying parts from the Link;

- perform_iterative performs jacobi matrix form algorithm on the parameters
created above;

- heuristic_greedy uses greedy method based on DFS on the graph created by the
links of the matrix (with their probability to win) to find the path with the
highest probability of reaching the win state which is the end node represented
by the adj_mat;

- decode_path decodes the input path (a vector of node indices) into a vector of
pairs of coords (lin, col);

## Linear Regression

	It uses *Multiple Linear Regression* in order to make predictions about the
	price of apartments.

- parse_data_set_file creates a matrix of cell type where it saves all the data
read from the given file and an Y double type column array of prices;

- prepare_for_regression transforms the cell type matrix to a double type matrix
of only double values (from the InitialMatrix) and 0/1 for string values
transformed according to the requirements;

- linear_regression_cost_function implements a cost function for limnear regression
with regularization; it calculates h(x) fir each training example and substracts
the actual output value from it; the difference is squared and added to the
total s_tot sum; The regularized cost is calculated by dividing s_tot by
2 * nr of training examples;

- parse_csv_file parses a csv file where columns are separated by ",";
it reads each whole line and splits it by ","; the words are placed in the cell
type matrix Initial Matrix;

- gradient_descent implements gradient descent algorithm for linear regression;
The function first initializes Theta with zeros and adds a column of zeros to
the feature matrix to account for the intercept term. It then iteratively updates
the values of Theta by calculating the hypothesis function h_theta(x) for each
training example, computing the error between h_theta(x) and the actual output
value, calculating the gradient of the cost function with respect to Theta, and
updating Theta using the learning rate and the gradient. The process is repeated
iter times, and the final values of Theta are returned.

- normal_equation implements the normal equation algorithm using the conjugate
gradient method to solve for the optimal values of the vector of weights Theta
in a linear regression problem

- lasso_regression_cost_function implements Lasso regression is a linear regression
method that uses L1 regularization as explained in the requirements

- ridge_regression_cost_function is an implementation of the ridge regression
cost function in Octave, a type of linear regression model that uses L2

## MNIST 101


- load_dataset reads a .mat file and saves it in the workspace

- split_dataset randomly splits the dataset into a training and a test set;
randomly permutates the indices of data into 2 sets; theirs size is determined
by the percent parameter;

- initialize_weights  initializes the weights of a neural network between two
consecutive layers. The function generates a matrix of random values of size
L_next * (L_prev + 1). The + 1 is added to L_prev because the bias term is
included as an additional input to each node in the next layer.

- cost_function implements the neural network cost function and gradient for a
two-layer neural network; it computes the cost and gradient of the neural network.
The parameters for the neural network are "unrolled" into the vector params and
need to be converted back into the weight matrices. The returned parameter grad
should be a "unrolled" vector of the partial derivatives of the neural network.

- predict_classes erforms prediction on a set of examples using a neural network
with two hidden layers. 

	* The function first reshapes the weights vector to obtain
the matrices Theta1 and Theta2, which represent the weights between the input
layer and the first hidden layer and between the first hidden layer and the
output layer, respectively.

	* Then, the function performs forward propagation to compute the output of the
neural network for each example in X. The computation involves computing the
activation values for the hidden layers using the sigmoid function, and then
applying the weights in Theta2 to compute the output values.

	* Finally, the function returns a vector classes of size (m x 1) containing the
predicted classes for each example in X. The predicted class is the index of
the output unit with the highest activation value, which is computed using the
max function.