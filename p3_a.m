clc; 
clear all;
clc;
load('p2_data.mat', 'x');
k = max(0,ceil(log2(mean(x))));
m = 2^k;
gc = [];
for i=1:length(x)
    ka = floor(x(i)/m);
    s1 = [];
    for j=1:ka
        s1 = [s1,0];
    end
    s1 = [s1,1];
    s2 = mod(x(i),m);
    s3 = zeros(1,k);
    for g=k:1
        if (s2 - 2^(g-1))>=0
            s3(k-g+1)=1;
            s2 = s2 - 2^(g-1);
        end
    end
    gc = [gc,s1,s3];
end
