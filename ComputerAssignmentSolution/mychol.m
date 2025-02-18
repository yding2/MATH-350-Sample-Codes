%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%my_chol return an upper triangular matrix, the cholesky 
%factorization of a positive definite matrix
function R = mychol(A)
    if (A~=A')
        error('The input is noa a positive definite matrix');
    end   
%Initialize the upper triangular matrix with the same size
%as the input A
    R = zeros(size(A));
    %Get the dimension of A
    [n,~]= size(A);
    %Step 1. Get the R_11
    R(1,1) = sqrt(A(1,1));
    %Get the first row of R
    R(1,2:n) = A(1,2:n)/R(1,1);
    for i = 2:n-1
        %Get R_ii
        R(i,i) = sqrt(A(i,i)-R(1:i-1,i)'*R(1:i-1,i));
        for j = i+1:n
        %Get the i-th row of R
            R(i,j) = (A(i,j)-R(1:i-1,i)'*R(1:i-1,j))/R(i,i);
        end
    end
%Get R_nn
    R(n,n) = sqrt(A(n,n)-R(1:n-1,n)'*R(1:n-1,n));
end