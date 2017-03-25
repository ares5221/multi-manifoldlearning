function    [ppca_label,mse,time_mppca] = MPPCA(X,ppca_dim,ncentres,knn,power)

%%%%  MPPCA(M mixtures of probabilistic principal component analyzers) from spectral multi-manifold clustering (smmc) algorithm
%%%% Input
%  X            D by N data matrix
%  ppca_dim     dimension of principal component subspace in PPCA
%  ncentres     number of centres in the mixture model
%  knn          number of nearest neighbors
%  power        power of affinity 
%%%% Output
%  cluster_labels      the label of each point using smmc      
%  ppca_label          the mixture label of each point in PPCA
%  mse                 average L2 error using the mixture model
%  time_mppca          running time of MPPCA
%  time_smmc           running time of smmc
%  time_sc             running time of spectral clustering on the affinity matrix
%  W                   affinity matrix used in spectral clustering
%    Feb,2017
%
%    Written by liujiefei  


[D,N] = size(X);
if nargin < 6
    power = 8;
end
if nargin < 5
    knn = 2*round(log(size(X,2)));
end
if nargin < 4
    ncentres = floor(N/(10*ppca_dim));
end

data = X';

t1  = clock;
disp('Creates a mixture subspace model using probabilistic PCA');
mix = gmm(D, ncentres, 'ppca', ppca_dim);

options = foptions;
options(14) = 10; % Just use 10 iterations of k-means in initialisation
options(1) = -1;  % Switch off all warnings
% Initialise the model parameters from the data
mix = gmminit(mix, data, options);

options(1)  = -1;		% Prints out error values.
options(14) = 50;		% Number of iterations.%50
[mix,options, errlog] = gmmem(mix, data, options);

a = gmmactiv(mix, data);
[uu,vv] = sort(a');
ppca_label = vv(end,:);
time_mppca = etime(clock,t1);

t2 = clock;
for k = 1:ncentres
    ctr{k,1} = mix.centres(k,:);
    dir{k,1} = mix.U(:,:,k)';
end;
mse = computing_L2_error(data, ppca_dim, ppca_label, ctr, dir);


%{
%%
%%%利用扩展的方法来进行子流形的分解，此处分了60个块

figure;
for i=1:size(ccc,2)
b=find( aaa(ccc(i),:));
X1=X( :, aaa(ccc(i),b));
  hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
end;
%}
%{
fprintf(1,'  -->Computing the affinity matrix.\n'); 
UU = zeros(ncentres,ncentres);
for i = 1:ncentres;
    for j = 1:ncentres;
%         UU(i,j) = prod(cos(subspacea(mix.U(:,:,i),mix.U(:,:,j))));
        UU(i,j) = prod(flipud(svd(mix.U(:,:,j)'*mix.U(:,:,i))));
    end;
end;

X2 = sum(X.^2,1);
Distance = repmat(X2,N,1)+repmat(X2',1,N)-2*X'*X;
[sorted,index] = sort(Distance);
G = zeros(N,N);
for ii = 1:N
   for jj = index(2:knn+1,ii);
       G(ii,jj) = UU(ppca_label(1,ii),ppca_label(1,jj)).^power;
   end;
end
W = max(G,G');

fprintf(1,'  -->Computing the generalized eigenvectors.\n'); 
DD = diag(sum(W,2));
OPTS.disp = 0;
N1 = min(20,size(W,1));
[eigvector, eigvalue] = eigs(DD-W,DD,N1,'sa',OPTS);
eigvalue = diag(eigvalue);
[junk, ind] = sort(eigvalue);
eigvalue = eigvalue(ind);
eigvector = eigvector(:, ind);
V = eigvector(:,1:nClusts);
    
fprintf(1,'  -->kmeans.\n');
%%%%%% Try 10 runs of k-means and save the one with minimal distortion
cluster_labels = kmeans(V,nClusts,'EmptyAction','drop','Replicates',10);
time_sc = etime(clock,t2);
time_smmc = etime(clock,t1);

%}
