clear
close all
A=imread('young-lady.jpg');
imagesc(A, [0 255]); axis image
colormap(gray);
X = double(A(:,:,1)) + 1;
[u s v] = svd(X);
K = min(size(s));
for k = 1:60 
    B = uint8(round(u(:,1:k)*s(1:k,1:k)*v(:,1:k)') - 1);
    imagesc(B, [0 255]); axis image
    colormap(gray);
	M(k) = getframe;
end
figure
movie(M,1,2)
