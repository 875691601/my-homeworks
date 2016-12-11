function [male,female] = preprocess(file_name)
% �����ݽ���Ԥ���������Ժ�Ů�����ݷֱ𵼳�
file = fopen(file_name);
predataset = textscan(file,'%f %f %c');
fclose(file);
dataset = [predataset{1},predataset{2}];
fseq = find(predataset{3}=='F' | predataset{3}=='f'); 
mseq = find(predataset{3}=='M' | predataset{3}=='m');
female(:,1) = dataset(fseq,1); 
female(:,2) = dataset(fseq,2);
male(:,1) = dataset(mseq,1); 
male(:,2) = dataset(mseq,2);
end