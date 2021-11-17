function [E,O]=frequencyPlot(data,pd)
    if isa(pd,'prob.BinomialDistribution') || isa(pd,'STAT121utils.HypergeometricDistribution')
        n=pd.N;
    else
        n=round(max(data)*1.2);
    end
    
    x=0:n; %Sample space
    
    tbl=tabulate(data);
    O=zeros(1,n+1);
    O(tbl(:,1)+1)=tbl(:,2);
    
    E=pd.pdf(x)*length(data);
    bar(x,[O;E])
    xlabel('x')
    ylabel('Frequency')
    legend('Observed','Expected')
end