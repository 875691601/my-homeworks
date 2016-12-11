function [male,female] = preprocess(file_name,lessFeature,lessNum)
%****************************************************
% preprocess���������ݽ���Ԥ���������Ժ�Ů�����ݷֱ𵼳�
% file_nameΪ�������txt�ļ�
% lessFeature��lessNumΪbool�ͱ�����Ϊ1ʱ�ֱ��ʾ
% ��ֻȡ2���������͡����ȡ10�����ݡ�
%****************************************************
file = fopen(file_name);
data = textscan(file,'%f %f %f %f %f %f %f %f %f %f %c');
fclose(file);
dataset = [data{1},data{2},data{3},data{4},data{5},data{6},...
    data{7},data{8},data{9},data{10}];
fseq = find(data{11}=='F' | data{11}=='f'); 
mseq = find(data{11}=='M' | data{11}=='m');
female = dataset(fseq,:); 
male = dataset(mseq,:); 
% ֻȡ��3�͵�5������
if(lessFeature == true)
    female = female(:,[3 5]);
    male = male(:,[3 5]);
end
% ���ȡ10����
if(lessNum == true)
    index1 = randperm(469);
    index2 = randperm(485);
    female = female(index1(1:10),:);
    male = male(index2(1:10),:);
end
end