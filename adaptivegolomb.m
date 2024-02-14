function gc=adaptivegolomb(rv,Nmax)
    N1 = 1;
    A = mean(rv);
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
end