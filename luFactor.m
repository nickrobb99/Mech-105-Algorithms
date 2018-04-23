function [L,U,P] = luFactor(A)
% This function will give the LU Factorization of any system of equations.
% A: Array form of the system of equations, must be square. 
% Ex: [1 2 3;4 5 6;7 8 9]
% L: The lower triangle of LU Factorization
% U: The upper triangle of LU Factorization
% P: The pivot matrix of LU Factorization
if nargin > 1
    error('Only input the matrix A') 
end
[r,c] = size(A); %Defines size of matrix
if r ~= c
    error('Matrix must be square') %Checks for proper input
end
L = eye(r); %Defines lower triangle
U = A; %Defines upper triangle
P = eye(r); %Defines pivoting matrix
for z = 1:r-1
    piv = max(abs(U(z:r,z))); %Finds maximum value in column
    for y = z:r 
        if (abs(U(y:z))==piv) %Checks if elimination is needed
            break;
        end
    end
    L([z,y],1:z-1) = L([y,z],1:z-1); %Pivots elements in lower trinagle
    U([z,y],z:r) = U([y,z],z:r); %Pivots elements in upper triangle
    P([z,y],:) = P([y,z],:); %Pivots elements in pivot matrix
    for y = z+1:r
        L(y,z) = U(y,z)/U(z,z); %Calculates values for lower triangle
        U(y,z:r) = U(y,z:r)-L(y,z)*U(z,z:r); %Calculates values for upper triangle
    end
end
disp(L)
disp(U)
disp(P)
end