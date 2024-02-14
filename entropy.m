function estimator=entropy(x,r)
   N=length(x);
   a=0;
   b=0;
   estimator=0;
   for i=1:N
       if x(i)==0
              a=a+1;
       elseif x(i)==1
              b=b+1;
       end
   end
   a=a/(N);
   b=b/(N);
   if r==0
       estimator=-(a*log2(a)+b*log2(b));
   elseif r==1
          for i=2:N
              cb=x(i);
              pb=x(i-1);
              count=sum(x(2:N)==cb&x(1:N-1)==pb);
              p=count/sum(x(1:N-1)==pb);
              estimator=estimator-p*log2(p);
          end
           estimator=estimator/N;
   end
 
end
