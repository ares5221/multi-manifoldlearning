% This code checks to see that you have the required packages
% in order to test SC

clear;
load('X1500.mat');
tic;
gen_nn_distance(X', 8, 10, 0);
%结果保存在8_NN_sym_distance.mat 中，其中上一行代码中近邻个数k=8，所以结果为8_NN...
load ('8_NN_sym_distance.mat');
disp('Running Spectral Clustering...');
[cluster_labels evd_time kmeans_time total_time] = sc(A, 20, 2);
toc
%计算分类精度
  load ('corel_labeForHybrid1500l.mat');
  nmi_score = nmi(label, cluster_labels)
  accuracy_score = accuracy(label, cluster_labels)

%聚成了两类每一类的信息保存在PP中
cluster_labels=cluster_labels';
for j=1:2
    d=0;
    for i=1:1500 
        if (cluster_labels(:,i)==j)
%            disp (i);
           d=d+1;
           PP(j,d)=i;     
        end;       
    end;
end;
%画出SC分解后的分类图，将X1X2保存即可
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
