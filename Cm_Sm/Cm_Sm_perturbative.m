function [Cm,Sm] = Cm_Sm_perturbative(XUV,lm,lp,sp,np)
    Cm = zeros((2*np.m_max+1),length(XUV));
    Sm = zeros((2*np.m_max+1),length(XUV));
    im=0;
    for m=-np.m_max:np.m_max
        im=im+1;
        Cm(im,:)=Cm_perturbative(XUV,sp.BG,lm.U_pond,lm.th2,lp.w,m);  
        Sm(im,:) = Sm_DFK_Hilbert(Cm(im,:));
    end
end