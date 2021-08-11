function obs = make_spectrogram(lp,sp,sc,np,Cm,Sm)
    JDOS_non_eq = JDOS_DFK(lp,sp,sc,np,Cm,Sm); 
    
    JDOS_eq = JDOS_const(sp.mu)*abs(sqrt(sc.XUV-sp.BG)).*heaviside(sc.XUV-sp.BG);
    obs.non_eq = observables(JDOS_non_eq,sc.XUV,sp.n_XUV,sp.p_matr,sp.z_film);
    obs.eq = observables(JDOS_eq,sc.XUV,sp.n_XUV,sp.p_matr,sp.z_film);  
    
    obs.d_Re_s = differential_matrix(obs.non_eq.Re_s,obs.eq.Re_s);
    obs.d_Im_e = differential_matrix(obs.non_eq.Im_e,obs.eq.Im_e);
    obs.d_alpha = differential_matrix(obs.non_eq.alpha,obs.eq.alpha);
    obs.d_OD = differential_matrix(obs.non_eq.OD,obs.eq.OD);
    obs.d_JDOS = differential_matrix(JDOS_non_eq,JDOS_eq);
end