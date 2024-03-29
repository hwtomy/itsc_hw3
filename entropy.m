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
   a=a/N;
   b=b/N;
   if r==0
       estimator=-(a*log2(a)+b*log2(b));
   elseif r==1
          for cb=0:1
              for pb=0:1
                  count=sum(x(2:N)==cb&x(1:N-1)==pb);
                    if pb==0
                        p = count/(N-1);
                        estimator=estimator-p*log2(p/a);
                    else
                        p = count/(N-1);
                       estimator=estimator-p*log2(p/b); 
                    end
              end
          end
   
   end
 
end
