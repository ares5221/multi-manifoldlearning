function [ output_args ] = mycompair( input_args )
%MYCOMPAIR Summary of this function goes here
%   Detailed explanation goes here
XX=load('ppca_label1500.mat');
XX=XX.ppca_label;
a=zeros(1,1);
%�ֳ�60���ÿ������ĵ�����Щ
for j=1:60
    d=0;
    for i=1:1500 
        if (XX(:,i)==j)
           disp (i);
           d=d+1;
           a(j,d)=i;     
        end;       
    end;
end;
%������һ�鵽��60���ͼ
X=load('X1500.mat');
X=X.X;
figure;
for i=1:60
b=find( a(i,:));
X1=X( :, a(i,b));
  hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
end;


%�ȽϷֳɵ�60���ӿ���ڶ����ǲ��Ƕ������ھ���ĵڶ���
 MM=load('cluster_labels1500.mat');
 MM=MM.cluster_labels;
for i=1:60
    b=find( a(i,:));
    if( MM(a(i,b))~= unique( MM(a(i,b)) ))
        disp �в�һ���ĵ�;
    end;   
end;

%�ҳ�������1�ĵ㣬�鿴��X��λ��
for i=1:60
    b=find( a(i,:));
    if(unique( MM(a(i,b))) == 1)
        disp(i);
    end;
end;
%��ʱ�õ�Ϊ1�ĵ���a�е�cc��
c1=[6,15,16,17,18,20,22,26,27,29,30,32,33,44,45,53,57,58,59,60];
%��������Ϊ1�ĵ��λ��
figure;
for i=1:20
b=find( a(c1(i),:));
X1=X( :, a(c1(i),b));
  hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
end;

%�ҳ�������2�ĵ㣬�鿴��X��λ��
% for i=1:60
%     b=find( a(i,:));
%     if(unique( MM(a(i,b))) == 2)
%         disp(i);
%     end;
% end;
%����ֻ�����࣬�ڶ���ֻ��ȫ��60��ȡ��һ���ʱ�õ�Ϊ2�ĵ���a�е�c2��
cc=(1:60);
c2=setdiff(cc,c1);
%��������Ϊ2�ĵ��λ��
figure;
for i=1:40
b=find( a(c2(i),:));
X1=X( :, a(c2(i),b));
  hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
end;
disp ��ɵڶ���scurve�������ͼ��;

end

