clc;
clear all;
clc;

al = 0.05:0.05:0.95;
N=19600;
ratio = zeros(1,3);
% figure;
for k = 1:length(al)
    a = al(k);
    x = zeros(1,N);
    
    ga = rand(x);
    if ga >0.5
        x(1) = 1;
    else
        x(1) = 0;
    end
    
    for i=2:N
        if x(i-1) == 0
            x(i) = rand() <= a;
        else
            x(i) = rand() > a;
        end
    end
    
    rv = [1];
    j=1;
    for i=2:N
        if x(i)==x(i-1)
            rv(j)= rv(j)+1;
        else
            j=j+1;
            rv = [rv, 1];
        end
    end
    
    vmax = max(rv);
    counts = zeros(1,vmax);
    for i=1:length(rv)
        counts(rv(i))= counts(rv(i))+1;
    end
    % plot(1:vmax,log10(counts/length(rv)));
    % hold on;
    for i=1:length(counts)
        counts(i) =ceil(-log2(counts(i)/length(rv)));
    end
    leng = 0;
    for i=1:length(rv)
        leng = leng + counts(rv(i));
    end
    ratio(k) = N/leng;
end

% legend('alpah=0.05','alpha=0.5','alpha=0.95');
% xlabel('value of length');
% ylabel('pmf(log10)');
% title('pmf of run_length values');

figure;
plot(al, ratio);
title('compression ratio');
