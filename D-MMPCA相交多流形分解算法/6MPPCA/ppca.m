function [var, U, lambda] = ppca(x, ppca_dim)
%PPCA	Probabilistic Principal Components Analysis
%
%	Description
%	 [VAR, U, LAMBDA] = PPCA(X, PPCA_DIM) computes the principal
%	component subspace U of dimension PPCA_DIM using a centred covariance
%	matrix X. The variable VAR contains the off-subspace variance (which
%	is assumed to be spherical), while the vector LAMBDA contains the
%	variances of each of the principal components.  This is computed
%	using the eigenvalue and eigenvector  decomposition of X.
%
%	See also
%	EIGDEC, PCA
%

%	Copyright (c) Ian T Nabney (1996-2001)

%  Modified by yong wang (yongwang82@gmail.com)

if ppca_dim ~= round(ppca_dim) | ppca_dim < 1 | ppca_dim > size(x, 2)
   error('Number of PCs must be integer, >0, < dim');
end

[ndata, data_dim] = size(x);
% Assumes that x is centred and responsibility weighted
% covariance matrix
[l Utemp] = eigdec(x, data_dim);
% Zero any negative eigenvalues (caused by rounding)
l(l<0) = 0;
% Now compute the sigma squared values for all possible values
% of q
s2_temp = cumsum(l(end:-1:1))./[1:data_dim]';
% If necessary, reduce the value of q so that var is at least
% eps * largest eigenvalue
q_temp = min([ppca_dim; data_dim-min(find(s2_temp/l(1) > eps))]);
if q_temp ~= ppca_dim
  wstringpart = 'Covariance matrix ill-conditioned: extracted';
  wstring = sprintf('%s %d/%d PCs', ...
      wstringpart, q_temp, ppca_dim);
  warning(wstring);
end

% make sure no 0/0 or something like 1/0 (i.e., NaN or Inf) appear in
% gmmactiv.m. otherwise, eigdec.m will not work.

% make sure var>0, and each value in lambda is larger than var;
if q_temp < ppca_dim;
  nz = min(find (l < 1e-2));
  if nz > ppca_dim
    l(nz:end) = 1e-2;
  else 
    l(nz:ppca_dim) = 1e-1;
    l(ppca_dim+1:end) = 1e-2;
  end;
end;
var = mean(l(ppca_dim+1:end)); 
U = Utemp(:, 1:ppca_dim);
lambda(1:ppca_dim) = l(1:ppca_dim);


