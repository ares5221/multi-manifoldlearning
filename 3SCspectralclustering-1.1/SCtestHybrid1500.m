% This code checks to see that you have the required packages
% in order to test SC

clear;
load('X1500.mat');
tic;
gen_nn_distance(X', 8, 10, 0);
%���������8_NN_sym_distance.mat �У�������һ�д����н��ڸ���k=8�����Խ��Ϊ8_NN...
load ('8_NN_sym_distance.mat');
disp('Running Spectral Clustering...');
[cluster_labels evd_time kmeans_time total_time] = sc(A, 20, 2);
toc
%������ྫ��
  load ('corel_labeForHybrid1500l.mat');
  nmi_score = nmi(label, cluster_labels)
  accuracy_score = accuracy(label, cluster_labels)

%�۳�������ÿһ�����Ϣ������PP��
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
%����SC�ֽ��ķ���ͼ����X1X2���漴��
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
