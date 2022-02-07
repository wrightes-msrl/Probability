function bootstrpmeanvis(c,stats)
    h=histogram(stats.bsm);
    hold on
    plot(c,[0,0],'b','LineWidth',5)
    plot([stats.MeanExperimental,stats.MeanExperimental],[0,max(h.BinCounts)],'r','LineWidth',5)
    plot([stats.MeanControl,stats.MeanControl],[0,max(h.BinCounts)],'b','LineWidth',5)
    legend('Bootstrap Values','$\mu_C$ and CI', '$\bar{x}_E$', 'interpreter','Latex')
    hold off
end
