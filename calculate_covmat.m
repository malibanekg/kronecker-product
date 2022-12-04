function [cov_matrix] = calculate_covmat(n, m)

wind = load('wind.mat');
tt = struct2table(wind.labpcexport);
% tt.Properties

% TAKE DATA
% TIMESERIE length 50;
% SPATIAL 12;

Stack_cols = [];

for i = 1:n
	% i
	% 50 x 12, times x spatial
	X = tt(i:(n+i-1), {'RPT', 'VAL', 'ROS', 'KIL', 'SHA', 'BIR', 'DUB', 'CLA', 'MUL', 'CLO', 'BEL', 'MAL'});
	
	% n timepoints x m location
	X_mat=table2array(X);
	
	% m location x n timepoints
	% X_mat = transpose(X_mat);
	% X_mat
	
	% create vector
	X_vec = X_mat(:);
	% Stack_cols
	Stack_cols = [Stack_cols, X_vec];
end;

% covariance matrix
cov_matrix = zeros(m*n, m*n);
for i = 1:n
	cov_matrix = cov_matrix + Stack_cols(:, i) * transpose(Stack_cols(:, i));
end;

cov_matrix = (1/n)*cov_matrix;
