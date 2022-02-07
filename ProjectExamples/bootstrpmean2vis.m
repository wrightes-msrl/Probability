function bootstrpmean2vis(c,stats)
    CIc=c(1,:);
    CIe=c(2,:);
    Mc=stats.MeanControl;
    Me=stats.MeanExperimental;
    xbar=stats.xb;
    ybar=stats.yb;
    zbar=stats.zb;
    hc=histogram(Mc+xbar-zbar);
    hold on 
    he=histogram(Me+ybar-zbar);
    plot(CIc,[0,0],'b','LineWidth',5)
    plot(CIe,[0,0],'r','LineWidth',5)
    plot([xbar xbar],[0,max(hc.BinCounts)],'b',"LineWidth",5)
    plot([ybar ybar],[0,max(he.BinCounts)],'r',"LineWidth",5)
    legend('Control','Experimental','$\bar{x}_C$ and CI', '$\bar{x}_E$ and CI','interpreter','latex')
hold off
end