function exp = exponent(n,K)
% exp = exponent(n,K)
%
% EXPONENT: computes tha matrix of exponents of a homogeneous polynomial of
% degree n in K variables. exp is a nchoosek(n+K-1,n) by K matrix
% For example, if n=2 and K =2, then exp = [2 0; 1 1; 0 2];
%
% Copyright @ Rene Vidal, 2003

id  = eye(K);
exp = id;

for i=2:n
  rene = [];
  for j=1:K
    for k=size(exp,1)-nchoosek(i+K-j-1,i-1)+1:size(exp,1)
      rene = [rene; id(j,:)+exp(k,:)];
    end
  end
  exp = rene;
end