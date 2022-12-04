% Number of places - spatial dimension
m = 12;

% Time dimension
n = 50;

% Calculate matrix, matrix size (50x12) x (50x12)
corrmat = calculate_covmat(n, m);

% set parameters
lambdaL = 10;
lambdaS = 0.2;

% int=50?
[T,S,kron_mat,err_full] = comp_kron_Robust_rr(corrmat, m, 50, lambdaL, lambdaS, 0, 'SVT');
