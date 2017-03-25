function rplot(D, cstr)
% RPLOT Plotting tool to automatically plot 2D or 3D data
%
% RPLOT(X, S) plots the data in matrix X (a D*N matrix) using either plot
% or plot3 depending on the size of D.  S is a character string described
% in the help file of the builtin Matlab function PLOT

% 11/25/2005 Richard Souvenir

if nargin < 2
   cstr = '';
end

dims = size(D, 1);
if (dims == 2)
   plot(D(1,:), D(2,:), cstr);
elseif (dims == 3)
   plot3(D(1, :), D(2, :), D(3, :), cstr);
else
   error('Input matrix must have 2 or 3 rows');
end