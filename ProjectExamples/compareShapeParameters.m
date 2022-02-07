function shapes=compareShapeParameters(data,pd)
    % compareShapeParameters: Compute the empirical shape parameters (mean,
    % variance, skewness, and kurtosis) of a data set and compare them to
    % the theoretical shape parameters of a probability distributions. The
    % compareShapeParameters function supports the binomial, geometric,
    % hypergeometric, and Poisson's distributions.
    %
    % shapes=comareShapeParameters(data,pd) computes the empirical shape
    % parameters of the data array, computes the empirical shape parameters
    % of the pd probability distributoin, and returns them in a table
    % (shapes).
    
    ds=descriptiveStats(data); %Empirical shape parameters.
    
    % Theoretical shape parameters
    mu=pd.mean;
    sigma2=pd.var;
    
    if isa(pd,'prob.BinomialDistribution')
        n=pd.N;
        p=pd.p;
        gamma=(1-2*p)/sqrt(n*p*(1-p));
        kappa=(1-6*p*(1-p))/(n*p*(1-p))+3;
    elseif isa(pd,'HypergeometricDistribution')
        N=pd.M;
        K=pd.K;
        n=pd.N;
        gamma=((N-2*K)*sqrt(N-1)*(N-2*n))/(sqrt(n*K*(N-K)*(N-n))*(N-2));
        kappa=((N-1)*(N^2)*(N*(N+1)-6*K*(N-K)-6*n*(N-n))+6*n*K*(N-K)*(N-n)*(5*N-6))/(n*K*(N-K)*(N-n)*(N-2)*(N-3))+3;

    elseif isa(pd,'prob.NegativeBinomialDistribution') && pd.R==1
        p=pd.p;
        gamma=(2-p)/sqrt(1-p);
        kappa=9+(p^2)/(1-p);
    elseif isa(pd, 'prob.PoissonDistribution')
        lambda=pd.lambda;
        gamma=1/sqrt(lambda);
        kappa=3+1/lambda;
    else
        error('compareShapeParameters only supports Binomial, Geometric, Hypergeometric, and Poisson Distributions');
    end
    %Put the empirical and theoretical shape parameters into a table
    MEAN=[ds.Mean;mu];
    VARIANCE=[ds.Variance;sigma2];
    SKEWNESS=[ds.Skewness; gamma];
    KURTOSIS=[ds.Kurtosis; kappa];
    shapes=table(MEAN,VARIANCE,SKEWNESS,KURTOSIS,'RowNames',{'Empirical','Theoretical'});
end