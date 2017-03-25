% [y,powers] = veronese(x,n,scale,powers)
%     Computes the Veronese map of degree n, that is all
%     the monomials of a certain degree.
%     x is a K by N matrix, where K is dimension and N number of points
%     y is a K by Mn matrix, where Mn = nchoosek(n+K-1,n)
%     powes is a K by Mn matrix with the exponent of each monomial
%
%     Example veronese([x1;x2],2) gives
%     y = [x1^2;x1*x2;x2^2]
%     powers = [2 0; 1 1; 0 2]
%
% Copyright @ Rene Vidal, 2003

function [y,powers] = veronese(x,n,scale,powers)

[K,N] = size(x);
if(nargin<4)
    powers = exponent(n,K);
end

if n==0
  y=ones(1,size(x,2));
elseif n==1
  y=x;
else
  Mn = nchoosek(n+K-1,n);
  xpower=ones(size(x,1),n+1,N);
  x=reshape(x',[1,N,K]);
  xpower=ones(n+1,N,K);
  for(i=2:n+1)
      xpower(i,:,:)=xpower(i-1,:,:).*x;
  end
  y=xpower(powers(:,1)+1,:,1);
  for(i=2:K)
      y=y.*xpower(powers(:,i)+1,:,i);
  end;
%   index = find(abs(x) < 1e-10);
%   x(index) = 1e-10;
%   y = exp(powers*log(x));
end

if isreal(x)
    y = real(y);
end

if nargin==3
    if scale==1
        y = diag(sqrt(factorial(n)./prod(factorial(powers),2)))*y;
    end
end