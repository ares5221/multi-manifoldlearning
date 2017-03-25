function [idx,assn] = kmanifolds(DATA, clusters, opts)
% KMANIFOLDS Nonlinear Subspace Clustering Algorithm
%
%	Description
%	ASSN = KMANIFOLDS(DATA, CLUSTERS, OPTS) uses an iterative process
%  to assign probabilities to each of N D-dimensional points of 
%  being drawn from each of the specified manifolds.
%
%  Inputs:
%    DATA - (D * N) matrix of input points
%    CLUSTERS - vector of intrinsic dimensionality of target manifolds
%      (e.g., [1 1 2] to search for two 1-D manifolds & one 2-D manifold)
%       Ŀ�����α���ά����������1 1 2�������ҵ�����һά���κ�һ��2ά����
%       Ҳ���������һ������������3�����ν����γɵĻ�����ο���������һά���Ρ�1 1 1��
%       һ����ʿ���һ��ƽ���Ͽ��������ҡ�2 2��
%    OPTS - optional structure of options
%      OPTS.display - plot display of input points and predicted manifolds
%        (1 = yes (default), 0 = no)
%      OPTS.knn - neighborhood size (default = 8)
%      OPTS.nCtrs - number of kernels for radial basis function
%      %����������ĺ˸���
%      OPTS.actfn - type of kernels for radial basis function
%        (see NETLAB options)
%      OPTS.maxIters - maximum number of iterations (default = 50)
%      OPTS.initAssn - Initial assignment of points (to randomly assign
%         points, do not use this value)
%
%  Output:
%    ASSN - Final assignment of input points to target manifolds
%
%  To run this code, you need to download and install Netlab and Isomap
%  which are available at:
%
%  http://www.ncrg.aston.ac.uk/netlab/index.php (Netlab)
%  http://isomap.stanford.edu/ (Isomap)
%
%  (c) 2005 Richard Souvenir
%  Also, published work which uses this could should cite:
%
%  R. Souvenir and R. Pless, Manifold Clustering, 
%  in Proceedings of the 10th International Conference 
%  on Computer Vision (ICCV 2005), Beijing, China, 
%  October 2005, pp. 648 ?653.

%�����ĳ�ʼ��
n = size(DATA,2);
nDims = size(DATA, 1);
nClusters = length(clusters);

if (nargin < 3)
   opts = struct('display', 1);
end

if ~isfield(opts, 'knn')
   opts.knn = 8;
end
if ~isfield(opts, 'display')
   opts.display = 1;
end
if ~isfield(opts, 'maxIters')
   opts.maxIters = 50;
end
if ~isfield(opts, 'initAssn')
   % randomly assign points to clusters
   assn = rand(nClusters, n);
   sumAssn = repmat(sum(assn), [nClusters 1]);
   assn = assn ./ sumAssn;
else
   assn = opts.initAssn;
end
% The following options are free paramters for the radial basis functions
% used to estimate the manifold parameters.  See the Netlab documentation
% for more information.
if ~isfield(opts, 'nCtrs')
   opts.nCtrs = 10;
end
if ~isfield(opts, 'actfn')
   opts.actfn = 'gaussian';
end

oldAssn = zeros(size(assn));

nCtrs = opts.nCtrs;
cString = 'bgrcmyk';
sString = '.O^+xp';
display = opts.display & nDims < 4;  %ά�ȴ���4�ͻ���������
neighbors = opts.knn;
actfn = opts.actfn;
maxIters = opts.maxIters;

%�㷨��һ��������֮��ŷ�Ͼ���
disp(['Calculating Pairwise Distances...']);
dL2 = L2_distance(DATA, DATA);

%�㷨�ڶ�������dijkstra��������ͼ�������·��
% Estimate geodesic distances
% Increment by 2 until there is a single connected component
disp(['Estimating Geodesic Distances...']);

%    Portions of the following code were copied from Isomap.m

%    BEGIN COPYRIGHT NOTICE
%
%    Isomap II code -- (c) 1998-2000 Josh Tenenbaum
%
%    This code is provided as is, with no guarantees except that 
%    bugs are almost surely present.  Published reports of research 
%    using this code (or a modified version) should cite the 
%    article that describes the algorithm: 
%
%      J. B. Tenenbaum, V. de Silva, J. C. Langford (2000).  A global
%      geometric framework for nonlinear dimensionality reduction.  
%      Science 290 (5500): 2319-2323, 22 December 2000.  
%
%    Comments and bug reports are welcome.  Email to jbt@psych.stanford.edu. 
%    I would also appreciate hearing about how you used this code, 
%    improvements that you have made to it, or translations into other
%    languages.    
%
%    You are free to modify, extend or distribute this code, as long 
%    as this copyright notice is included whole and unchanged.  
%
%    END COPYRIGHT NOTICE


while (neighbors < 20)
   dL2temp = dL2;
   [tmp, ind] = sort(dL2temp);
   for i=1:n
      dL2temp(i,ind((2+neighbors):end,i)) = 0;
   end
   dL2temp = sparse(dL2temp);  %������Xת��Ϊϡ��������ʽ��������X���κ���Ԫ��ȥ��������Ԫ�ؼ����±꣨��������ɾ���S
   dL2temp = max(dL2temp, dL2temp');  %����һ����dL2temp��dL2temp'ͬ��С�����飬���е�Ԫ���Ǵ�A��B��ȡ�������Ԫ�ء�
   avgKDist = full(mean(dL2temp(dL2temp > 0))); %full��ϡ�����Xת��Ϊȫ����洢��ʽ
   D = dijkstra(dL2temp, 1:n);
   if (all(isfinite(D(:))))
      break;
   else
      neighbors = neighbors + 2;
      disp(['Neighborhood graph not connected.  Increasing KNN to ' ...
         num2str(neighbors)]);
   end
end
clear dL2temp;

%�㷨���Ĳ���ʼ������w wci��Xi��������c�ĸ���
% Display initial classification
if (display)
   for ix = 1:nClusters
      idx{ix} = find(assn(ix,:) == max(assn, [], 1));
   end
   
   % Plot entire dataset, using different colors to represent
   % the most likely cluster for each data point
   figure(998); clf; hold on;
   for ix = 1:nClusters
      rplot(DATA(:,idx{ix}), [cString(ix) sString(ix)]);
   end
   hold off;
   drawnow;
   axisHiD = axis;
end

%�㷨����������ʼMEֱ������
disp(['Beginning Iterative Procedure...']);
iters = 0;
while (median(abs(oldAssn(:) - assn(:)) ./ assn(:)) > .02 & iters < maxIters)
   % Save old assignment;
   oldAssn = assn;
   
   % Run Weighted MDS (# cluster) times using each class of 
   % probabilities for weighting
   for ix = 1:nClusters
      mdsLoc = nodeWeightedMDS(D, assn(ix, :), clusters(ix));
      Y{ix} = mdsLoc';
   end

   if (display)  
      figure(997); clf; hold on;
      title('Manifold Predictions');
   end
   options(1,:) = foptions;
   options(2,:) = foptions;
   options(2, 14) = 10; % 10 iterations of EM

   for ix = 1:nClusters
      lowDPts = Y{ix};
      rbfSurf{ix} = rbf(size(lowDPts, 1), nCtrs, nDims, actfn);
      rbfSurf{ix} = wrbftrain(rbfSurf{ix}, options, lowDPts', DATA', assn(ix, :));
      highDPred = rbffwd(rbfSurf{ix}, lowDPts');
      highDPred = highDPred';
      residual(ix, :) = sqrt(sum((highDPred - DATA).^2));
      if (display)
         %rplot(DATA, 'k.'); %hold on;
         rplot(highDPred, [cString(ix) sString(ix)]);
         axis(axisHiD);
        % hold off;
      end
   end
   if (display)
      hold off;
      drawnow;
   end
   
   % Assign a probabilty to each point that it originates
   % from the manifolds implied by node-weighted MDS
   
   cStd = '[ ';
   % For each cluster calculate the standard deviation
   % and convert the residuals into weights
   for ix = 1:nClusters
      sDev = sqrt( sum((residual(ix, :).^2).*assn(ix, :)) ...
         .* (sum(assn(ix,:)) ./ (sum(assn(ix,:)).^2 - sum(assn(ix,:).^2))));
      sDev = max(sDev, avgKDist);
      cStd = [cStd num2str(sDev) ' '];
      assn(ix, :) = exp(-(residual(ix, :).^2) ./ (sDev.^2));
   end
   disp(['Iteration: ' num2str(iters) ', Cluster StdDev: ' cStd ']']);
   
   
   %Normalize weights to convert to probabilities
   sumAssn = repmat(sum(assn, 1), [nClusters 1]);
   assn = (assn ./ (sumAssn + eps)) + eps;
   
   iters = iters + 1;
     
   % For display purposes - assign each point to the cluster
   % for which it has the highest probability
   if (display)
      for ix = 1:nClusters
         idx{ix} = find(assn(ix,:) == max(assn, [], 1));
      end
      
      % Plot entire dataset, coloring each cluster
      figure(998); clf; hold on;
      title('Cluster Assignments');
      for ix = 1:nClusters
         rplot(DATA(:,idx{ix}), [cString(ix) sString(ix)]);
      end
      hold off;
      drawnow;
   end
   % To allow Ctrl-C
   pause(.001);
end

disp(['Number of iteration: ' num2str(iters)]);
return;