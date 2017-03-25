function [Dp,Dc] = derivative(c,powers,x,powersn1)
% [Dp,Dc] = derivative(c,powers,x)
%
% DERIVATIVE: computes the derivative of a homogeneous polynomial 
% of degree n in K variables at a given point x on R^K.
% c      = vector of dimension nchoosek(n+K-1,n) containing the coefficients
% powers = nchoosek(n+K-1,n) times K matrix containing the exponents of a
%          homogeneous polynomial of degeee n in K variables. See exponent.m
% x      = K by P matrix containing the data points at which to compute
%          derivative
% Dp     = K by P matrix with the derivatives of the poly at each point
% Dc     = nchoosek(n+K-1,n-1) by K matrix such that Dp=Dc'*veronese(x,n-1)
%
% Copyright @ Rene Vidal, 2004

n = max(powers(:,1));
K = size(powers,2);

index = find(abs(x) < 1e-10);
x(index) = 1e-10;
%logX = log(x);

Dc = (c*ones(1,K)).* powers; 
Dc = Dc(:);
Dc = Dc(find(powers>0));
Dc = reshape(Dc,length(Dc)/K,K);
if(nargin<4)
    Dp = Dc.'*veronese(x,n-1,0);
else
    Dp = Dc.'*veronese(x,n-1,0,powersn1);
end
    