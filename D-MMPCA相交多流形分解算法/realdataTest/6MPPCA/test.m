clear;
path(path, 'benchmark data sets');
name = 'two_spirals';
disp('-->Reading database');
% �������ݼ�
M = load(name);
X=M.X;
ss = M.true_labels;
% �ֱ�õ����������
for i=1:1000; 
    if(ss(i,:)==1)
        a{i}=i;
    else
        b{i}=i;
    end ;
end ;
s1=cell2mat (a); 
s2=cell2mat (b); 
X1=X(:,s1); X2=X(:,s2);
col(1:1000,:)=0.999; 
col1=col(s1,:);
col2=col(s2,:); col2(1:503,:)=0.001;
% ������������ֱ��ͼ��
figure;      hold on;        
hin=scatter(X1(1,:),X1(2,:),50, col1,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
figure;      hold on;        
hin=scatter(X2(1,:),X2(2,:),50, col2,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
% ����smmc
nClusts=2;
ppca_dim=1;
ncentres=2;
knn=8;
power=8;
tic;
[cluster_labels,ppca_label,mse,time_mppca,time_smmc,time_sc,W] = smmc(X,nClusts,ppca_dim,ncentres,knn,power)
toc;
%����smmc�����Ľ��
for i=1:1000; 
    if(cluster_labels(i,:)==1)
        aa{i}=i;
    else
        bb{i}=i;
    end ;
end ;
s11=cell2mat (aa); 
s22=cell2mat (bb); 
X1=X(:,s11); X2=X(:,s22);
col(1:1000,:)=0.999; 
col1=col(s11,:);
col2=col(s22,:); col2(1:172,:)=0.001;
% ����smmc���·������������ֱ��ͼ��
figure;      hold on;        
hin=scatter(X1(1,:),X1(2,:),50, col1,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
figure;      hold on;        
hin=scatter(X2(1,:),X2(2,:),50, col2,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
%����׼ȷ��
for i=1:1000
    if (ss(i)==cluster_labels(i))
        c{i}=i;
    end;
end;
 cc=cell2mat (c); 
 acc=size(cc,2)/1000;
 acc;