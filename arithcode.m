function enc=arithcode(inx,a) 
    N1=22;
    P=8;
    C=0;
    A=2^N1;
    r= -1;
    b=0;
    pre = 0;
    enc = [];
    for i=1:length(inx)
        if pre==1
            T=A*floor(2^P*a);
        else
            T=A*floor(2^P*(1-a));
        end
        pre=inx(i);
        if inx(i)==1
            C=C+T;
            T=2^P*A-T;
        end
    
        if C>=2^(N1+P)
            C=mod(C,2^(N1+P));
            enc=[enc,1];
            if r>0
                for q=1:r-1
                    enc=[enc,0];
                end
                r=0;
            else
                r=-1;
            end
        end
    
        while T<2^(N1+P-1)
            b=b+1;
            T=T*2;
            C=C*2;
            if C>=2^(N1+P)
                C=mod(C,2^(N1+P));
                if r<0
                    enc=[enc,1];
                else
                    r=r+1;
                end
            elseif r>=0
                enc=[enc,0]
                for q=1:r
                    enc=[enc,1];
                end
                r=0;
            end
        end
    
        A=floor(T/2^P);
    end
    
    if r>=0
        enc=[enc,0];
        for q=1:r
            enc=[enc,1];
        end
    end
    tc=dec2bin(C)-48;
    if length(tc)>(N1+P)
        tc=tc(1:N1+P);
    else
        hl=N1+P-length(tc);
        for g=1:hl
            tc=[tc,0];
        end
    end
    enc = [enc,tc];
end

            
             



