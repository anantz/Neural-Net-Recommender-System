function [Theta] = optimize(uid)

input_layer_size  = 19;  % 20x20 Input Images of Digits
hidden_layer_size = 10;   % 25 hidden units
num_labels = 5;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)


load('UNew.txt');
m = size(y(:,1), 1);
load('content.txt');

%% ===========Detecting start and end position of userid in the UNew.txt
s = 0;
e = 0;
for i=1:m,
	if (y(i,1) == uid)
		e = e+1;
		if (e == 1)
			s = i;
		endif
	else
		if(s > 0)
			break;
		endif
	endif		
end
e = e + s - 1;
%% ================ Part 6: Initializing Pameters ================

fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];


% =================== Part 8: Training NN ===================

fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', 50);

%  You should also try different values of lambda
lambda = 1;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y(s:e,3), lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));


Theta1 = reshape(Theta1',1,[]);
Theta2 = reshape(Theta2',1,[]);

Theta = [Theta1 Theta2];
%save Theta.txt Theta;
