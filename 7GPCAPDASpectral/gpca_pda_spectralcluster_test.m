addpath 'helper_functions/';
%Function to test routine for GPCA PDA
randn('state',2)
rand('state',1)

k=4;    %dimension of subspaces
K=5;    %dimension of ambient space
N=100;  %number of points in each group
n=2;    %number of groups
addnoise=false; %add random gaussian noise?

%prepare dataset
X=[];s=[];
for(in=1:n)
    basis=orth(randn(K,k));
    X=[X basis*rand(k,N)];
	s=[s in*ones(1,N)];
end

%add noise if asked for
if(addnoise)
    X=X+0.01*randn(size(X));
end


%call GPCA
groups=gpca_pda_spectralcluster(X,n);

%compute misclassification rate
groups=bestMap(s,groups);
missrate = sum(s(:) ~= groups(:)) / length(s);

disp(['Missclassification error: ' num2str(missrate*100) '%'])
