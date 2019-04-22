%%%script for manipulating Jacobian matrices for the eigenvalues,
%%%%determinants, and traces.

%practive making matrices
syms r a b k x

%A = [a, b;
%    c, d;];

A= [r-0 -1;
    a*(k-b) 0;];
A
% %find eigenvalue of the 2x2 matrix
lambda = eig(A);
lambda

% %find determinant of the 2x2 matrix
detA = det(A);
detA

% %find trace of
traceA = trace(A);
traceA

clear all