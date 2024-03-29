clc;
clear all;
clc;

al = 0.05:0.05:0.95;
N=19600;
ratio = zeros(1,length(al));
ratio1 = zeros(1,length(al));

for k1 = 1:length(al)
    a = al(k1);
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
    for i=1:length(counts)
        counts(i) = ceil(-log2(counts(i)/length(rv)));
    end
    leng = 0;
    for i=1:length(rv)
        leng = leng + counts(rv(i));
    end
    ratio(k1) = N/leng;

    N1 = 1;
    A = mean(rv);
    Nmax = round(length(rv)/2);
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
    ratio1(k1) = N/length(gc);
end

figure;
plot(al,ratio);
hold on
plot(al,ratio1);
hold on
legend('ideal run length value', 'adaptive Golomb encoder');
