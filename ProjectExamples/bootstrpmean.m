function [h,asl,c,stats]=bootstrpmean(ControlData,ExperimentalData,Nsamples)
    bsMeans=bootstrp(Nsamples,@mean,ControlData);
    c=quantile(bsMeans,[0.025 0.975]);
    Me=mean(ExperimentalData);
    Mc=mean(ControlData);
    if Me>Mc
        asl=sum(Me<bsMeans)/Nsamples;
    else
        asl=sum(Me>bsMeans)/Nsamples;
    end
    if asl<0.05
        h=1;
    else
        h=0;
    end
    stats=struct('MeanControl',Mc,'MeanExperimental',Me,'bsm',bsMeans);
end
