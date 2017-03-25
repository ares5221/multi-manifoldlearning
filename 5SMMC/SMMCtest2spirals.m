% This code checks to see that you have the required packages
% in order to run SMMC ��������ƽ��
clear;
load( 'two_spirals.mat');

disp('Running SMMC in two_spirals...')
nClusts=2;
ppca_dim=1;
ncentres=40;
knn=7;
power=15; 
tic;
[cluster_labels,ppca_label,mse,time_mppca,time_smmc,time_sc,W] = smmc(X,nClusts,ppca_dim,ncentres,knn,power)
toc
cluster_labels=cluster_labels';
for j=1:2
    d=0;
    for i=1:size(cluster_labels,2)
        if (cluster_labels(:,i)==j)  
           d=d+1;
           PP(j,d)=i;     
        end;       
    end;
end;
%����kmeans�ֽ��ķ���ͼ����X1X2���漴��
[m,n,b]=find(PP(1,:));
X1=X(:,b);
[m,n,bb]=find(PP(2,:));
X2=X(:,bb);
figure;      hold on;        
hin=scatter(X1(1,:),X1(2,:),50,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter(X2(1,:),X2(2,:),50,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor','m');       hold off;

%������ྫ��

  accuracy_score = accuracy(cluster_labels', true_labels)

