%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%lutxmod
function [L,U,p] = lutxmod(A)
%LUTX  Triangular factorization, textbook version
%   [L,U,p] = lutx(A) produces a unit lower triangular matrix L,
%   an upper triangular matrix U, and a permutation vector p,
%   so that L*U = A(p,:)

%   Copyright 2014 Cleve Moler
%   Copyright 2014 The MathWorks, Inc.

[n,n] = size(A);
p = (1:n)';

for k = 1:n-1

    % Find index of largest element below diagonal in k-th column
    [r,m] = max(abs(A(k:n,k)));
    m = m+k-1;

    % Skip elimination if column is zero
    if (A(m,k) ~= 0)

        % Swap pivot row
        if (m ~= k)
            for j = 1:n
                A([k m],j) = A([m k],j);
            end
                p([k m]) = p([m k]);
        end

        % Compute multipliers via explicit for loop
        for i = k+1:n
            A(i,k) = A(i,k)/A(k,k);
        end

        % Update the remainder of the matrix via explicit for loop
        for j = k+1:n
            A(i,j) = A(i,j) - A(i,k)*A(k,j);
        end
    end
end

    % Separate result
    L = tril(A,-1) + eye(n,n);
    U = triu(A);
end