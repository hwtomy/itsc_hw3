function rv=runlength(x)
    N=length(x);
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
end