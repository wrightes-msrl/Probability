function [h,asl,c,stats]=bootstrpmean2(ControlData,ExperimentalData,Nsamples)
    Nc=length(ControlData);
    Ne=length(ExperimentalData);
    xbar=mean(ControlData);
    ybar=mean(ExperimentalData);
    z=[ControlData(:); ExperimentalData(:)];
    zbar=mean(z(:));

    statsc=bootstrp(Nsamples,@(x)[mean(x),std(x)],ControlData'-xbar+zbar);
    statse=bootstrp(Nsamples,@(x)[mean(x),std(x)],ExperimentalData'-ybar+zbar);
    Mc=statsc(:,1); 
    Sc=statsc(:,2);
    Me=statse(:,1);
    Se=statse(:,2);
    t=(Me-Mc);
    t=t./sqrt((Se.^2/Ne)+(Sc.^2/Nc));
    t0=(mean(ExperimentalData)-mean(ControlData))/sqrt((var(ExperimentalData)/length(ExperimentalData))+(var(ControlData)/length(ControlData)));
    if(xbar<ybar)
        asl=sum(t>=t0)/Nsamples;
    else
        asl=sum(t<t0)/Nsamples;
    end
    if asl<0.05
        h=1;
    else
        h=0;
    end
    CIc=quantile(Mc+xbar-zbar,[0.025,0.975]);
    CIe=quantile(Me+ybar-zbar,[0.025,0.975]);
    c=[CIc;CIe];
    stats=struct('MeanControl',Mc,'MeanExperimental',Me,'xb',xbar,'yb',ybar,'zb',zbar);
end