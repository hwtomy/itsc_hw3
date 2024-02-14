function counts=optimal(rv)
    vmax = max(rv);
    counts = zeros(1,vmax);
    for i=1:length(rv)
        counts(rv(i))=counts(rv(i))+1;
    end
    for i=1:length(counts)
        counts(i) = ceil(-log2(counts(i)/length(rv)));
    end
end