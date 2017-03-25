function [ output_args ] = testKmeans( input_args )
%TESTKMEANS Summary of this function goes here
%  
clear;
load('two_spirals.mat');
%����kmeans��X���࣬�õ���IDX���Ƿ�����  ���ͨ��accuracy�ļ�������ྫȷ������������
%�������ʱ����Data dimension does not match dimension of centres�����ر�matlab���´򿪼���
tic;
[IDX,C]=kmeans(X',2);
toc
IDX=IDX';
%�۳���2��
for j=1:2
    d=0;
    for i=1:size(IDX,2)
        if (IDX(:,i)==j)
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

figure;     
hold on;        
hin=scatter(X1(1,:),X1(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter(X2(1,:),X2(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;

%������ྫ��nmi.m accuracy.m hungarian.m
  nmi_score = nmi(IDX', true_labels)
  accuracy_score = accuracy(IDX', true_labels)
end

