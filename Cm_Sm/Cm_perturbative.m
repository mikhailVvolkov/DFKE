function Cm = Cm_perturbative(XUV,Eg,Up,th2,w,m)
    power_real = @(x,n) x.^n.*heaviside(x);
    if m==0
        Cm_1 = 2*pi*power_real(XUV-Eg-Up,1/2);
        Amp_3 = 1/6*power_real(XUV-Eg-Up+w*cnst.h_bar,3/2) + 1/6*power_real(XUV-Eg-Up-w*cnst.h_bar,3/2) - 1/3*power_real(XUV-Eg,3/2);        
        Cm_3 = pi*Amp_3*16*th2/w/cnst.h_bar;
        
        Amp_5 = 1/160*power_real(XUV-Eg-Up-2*w*cnst.h_bar,5/2) + 1/160*power_real(XUV-Eg-Up+2*w*cnst.h_bar,5/2);
        Cm_5 = pi*Amp_5*(16*th2/w/cnst.h_bar)^2;
        
        Cm = Cm_3 + Cm_1;% + Cm_5;  
    elseif m==1
        
        Amp_3 = 1/12*power_real(XUV-Eg-Up+2*w*cnst.h_bar,3/2)- 1/6*power_real(XUV-Eg-Up+w*cnst.h_bar,3/2)+ 1/12*power_real(XUV-Eg-Up,3/2);
        Amp_3_th2 = -power_real(XUV-Eg-Up+2*w*cnst.h_bar,1/2)+ power_real(XUV-Eg-Up,1/2);
        Cm_3 =  pi*th2*(Amp_3*16/w/cnst.h_bar + Amp_3_th2);
        Cm = Cm_3;
    elseif m==-1
        Amp_3 = 1/12*power_real(XUV-Eg-Up-2*w*cnst.h_bar,3/2) - 1/6*power_real(XUV-Eg-Up-w*cnst.h_bar,3/2)  + 1/12*power_real(XUV-Eg-Up,3/2);
        Amp_3_th2 = power_real(XUV-Eg-Up-2*w*cnst.h_bar,1/2) - power_real(XUV-Eg-Up,1/2);
        Cm_3 =  pi*th2*(Amp_3*16/w/cnst.h_bar + Amp_3_th2);
        Cm = Cm_3;
    end 
end