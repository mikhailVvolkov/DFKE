function [Cm,Sm] = Cm_Sm_generate(XUV,lm,lp,sp,np,th1,Ak)
    Cm = zeros((2*np.m_max+1),length(XUV));
    Sm = zeros((2*np.m_max+1),length(XUV));
    im=0;
    f = waitbar(0,'1','Name','Calculating Fourier Amplitudes');
    for m=-np.m_max:np.m_max
        im=im+1;
        waitbar((np.m_max+m)/(2*np.m_max+1),f,['C_m & S_m ','    m = ',num2str(m)])
        Cm(im,:)=Cm_DFK(XUV,lm,lp,sp,Ak,th1,np.maxl_int,m);
        if np.Hilbert == 1
            Sm(im,:) = Sm_DFK_Hilbert(Cm(im,:));
        else
            Sm(im,:)=Sm_DFK(XUV,lm,lp,sp,Ak,th1,np.maxl_int,np.Emax_int,np.dEint,m);
        end
    end
    delete(f) 
end

