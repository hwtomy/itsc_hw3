load('p2_data.mat','x');
N= length(x);
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

rmax = max(rv);
lent = zeros(1,rmax);
for i=1: length(rv);
    lent(rv(i))= lent(rv(i))+1
end

N2 = length(rv);
for i=1: rmax
    lent(i)= ceil(-log2(lent(i)/N2));
end

leng = 0;
for i = 1:length(rv)
    leng = leng + lent(rv(i));
end
