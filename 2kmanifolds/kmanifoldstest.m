% This code checks to see that you have the required packages
% in order to run kmanifolds

fprintf('Checking for IsomapII...');
isoCheck = exist('L2_distance') & exist('dijkstra');
if (isoCheck)
   fprintf(' OK\n');
else
   error('Isomap not correctly installed');
end

fprintf('Checking for Netlab...');
netCheck = exist('rbftrain');
if (netCheck)
   fprintf(' OK\n');
else
   error('Netlab not correctly installed');
end

disp('Constructing spiral example...');
P = makeSpiral(500, .02, 4);

disp('Running k-Manifolds...')
assn = kmanifolds(P, [1 1]);

