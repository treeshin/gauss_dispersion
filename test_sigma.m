for j=1:7
    for x=100:100000
        sigma(x,j)=calc_sigma(x,j);
    end
    plot(log10(100:100000),log10(sigma(100:100000,j)))
    hold on
end

