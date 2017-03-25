function [B, COORD] = LRAwithSymRankOneWeights(M, V, dimension)
% LRAWITHSYMRANKONEWEIGHTS Fast Low Rank Approximation Method
%
% [B, Y] = LRAWITHSYMRANKONEWEIGHTS(S, V, D) performs fast weighted low
% rank approximation for the special case with the a symmetric weight
% matrix with rank one.  S is a pairwise similarity matrix, V is vector
% such that W = V * V' is desired weight matrix, and D is the desired
% dimensionality of Y.  B is the D-rank approximation of S. This special
% case allows the weighting to be computed by pre and post multiplying by
% diag(V);

W = diag(V);
A = W * M * W;
if (rank(A)<dimension)
   display('insufficient rank'); keyboard;
end

% find best "dimension"-d  approx of weighted M
[u s v] = svds(A,dimension);

% "unweight the matrix"
B = inv(W) * u * s * v' * inv(W);

% since it is convenient, also output low D coordinates.
COORD = inv(W) * u * sqrt(s);
