clc;
clear all;
clc;

 N=19600;
 a = 0.05;
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
 for i=2:length(x)
        if x(i)==x(i-1)
            rv(j)= rv(j)+1;
        else
            j=j+1;
            rv = [rv, 1];
        end
 end
sg = 2000;
ratio = zeros(1,sg);
for ct = 1:sg
    N1 = 1;
    A = mean(rv);
    Nmax = round(length(rv)/ct);
    gc = [];
    for i=1:length(rv)
        k = max(0,ceil(log2(A/(N1/2))));
        m = 2^k;
        ka = floor(rv(i)/m);
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
        if N1==Nmax
            A = floor(A/2);
            N1= floor(N1/2);
        end
        A = A+ rv(i);
        N1 = N1+1;
    end
    ratio(ct) = length(x)/length(gc);
    if ct == 500
        A
    end
end

figure;

plot(1:sg,ratio);