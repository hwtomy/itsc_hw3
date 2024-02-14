function x=markov(a,N)
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
end