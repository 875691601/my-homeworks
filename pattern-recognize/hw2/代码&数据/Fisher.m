clc
clear
% for k = 1:30
    %************����ͬҪ��ȡ��ѵ���������Լ�����************%
    [train_m,train_f] = preprocess('dataset3.txt',0,1);
    [test_m,test_f] = preprocess('dataset4.txt',0,0);
    %****************************************************%
    [N1,~] = size(train_m);
    [N2,~] = size(train_f);
    % �����ֵ������������ɢ�Ⱦ���
    mm = (mean(train_m))';
    mf = (mean(train_f))';
    train_m = train_m'; train_f = train_f';
    Sm = 0; Sf = 0;
    for i = 1:N1
        Sm = Sm + (train_m(:,i) - mm)*(train_m(:,i) - mm)';
    end
    for i = 1:N2
        Sf = Sf + (train_f(:,i) - mf)*(train_f(:,i) - mf)';
    end
    % ��������ɢ�Ⱦ���
    Sw = Sm + Sf;
    % ����ͶӰ����
    w = inv(Sw) * (mm - mf);
    %% ���Բ��Լ��Ա����
    err_m = 0;
    for i = 1:size(test_m,1)
        g = w'*(test_m(i,:)' - 0.5*(mm + mf));
        if(g < 0)
            err_m = err_m + 1;
        else       
        end
    end
    %% Ů�Բ��Լ��Ա����
    err_f = 0;
    for i = 1:size(test_f,1)
        g = w'*(test_f(i,:)' - 0.5*(mm + mf));
        if(g > 0)
            err_f = err_f + 1;
        else
        end
    end
    %% ���������
   err = (err_m + err_f)/(size(test_m,1)+size(test_f,1));
%     err(k) = (err_m + err_f)/(size(test_m,1)+size(test_f,1));
% end
% mean(err)