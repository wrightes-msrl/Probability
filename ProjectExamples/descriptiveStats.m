function ds=descriptiveStats(data)
    ds.Mean=mean(data);
    ds.Median=median(data);
    ds.Mode=mode(data);
    ds.Max=max(data);
    ds.Min=min(data);
    ds.Range=ds.Max-ds.Min;
    ds.StdDev=std(data,1);
    ds.Variance=var(data,1);
    ds.Quartiles=quantile(data,[.25,.5,.75]);
    ds.IQR=ds.Quartiles(3)-ds.Quartiles(1);
    ds.Skewness=skewness(data);
    ds.Bowley=(ds.Quartiles(3)+ds.Quartiles(1)-2*ds.Quartiles(2))/ds.IQR;
    ds.Kurtosis=kurtosis(data);
end