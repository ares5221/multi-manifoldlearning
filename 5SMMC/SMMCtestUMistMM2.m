% This code checks to see that you have the required packages
% in order to run SMMC
clear;
load('X1500.mat');
disp('Running SMMC...')
nClusts=2;
ppca_dim=2;
ncentres=60;
knn=6;
power=8;
tic;
[cluster_labels,ppca_label,mse,time_mppca,time_smmc,time_sc,W] = smmc(X,nClusts,ppca_dim,ncentres,knn,power)
toc
cluster_labels=cluster_labels';
for j=1:2
    d=0;
    for i=1:1500 
        if (cluster_labels(:,i)==j)  
           d=d+1;
           PP(j,d)=i;     
        end;       
    end;
end;
%画出kmeans分解后的分类图，将X1X2保存即可
b=find(PP(1,:));
X1=X(:,b);
figure;      hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
bb=setdiff(1:1500,b);
X2=X(:,bb);
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;
view(-10,10)


%计算分类精度

accuracy_score = accuracy(cluster_labels', true_labels)
