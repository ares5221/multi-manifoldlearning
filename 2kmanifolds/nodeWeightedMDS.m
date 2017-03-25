function Y = nodeWeightedMDS(D, weights, dimensions)
% NODEWEIGHTEDMDS Performs Node-Weighted Multidimensional Scaling
%
%  NODEWEIGHTEDMDS(X, W, D) finds the D-dimensional embedding of the points
%  in X where the weight is each point is described by the vector W.  

N = size(D,1);
e = ones(N,1);
w = weights ./ sum(weights);
H = eye(N) - e*w;

tau = -0.5 * H * D.^2 * H';

[B, Y] = LRAwithSymRankOneWeights(tau, weights, dimensions);

