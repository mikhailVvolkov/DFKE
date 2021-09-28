function obs = make_spectrogram(lp,sp,sc,np,Cm,Sm,selected_m)
    JDOS_non_eq = JDOS_DFK(lp,sp,sc,np,Cm,Sm,selected_m); 

    %JDOS_eq = JDOS_const(sp.mu)*abs(sqrt(sc.XUV-sp.BG)).*heaviside(sc.XUV-sp.BG);
    JDOS_eq = JDOS_const(sp.mu)*abs(sqrt(sc.XUV-sp.BG)).*my_heaviside(sc.XUV-sp.BG);
             
%   extract_fishbone_tilt(JDOS_upper.',sc,lp); 
    
    obs.non_eq = observables(JDOS_non_eq,sc.XUV,sp.n_XUV,sp.p_matr,sp.z_film);
    obs.eq = observables(JDOS_eq,sc.XUV,sp.n_XUV,sp.p_matr,sp.z_film);  
    
    remove_eq = selected_m(np.m_max+1); % do not subtract equilibrium if m=0 element is not requested
    
    obs.d_Re_s = differential_matrix(obs.non_eq.Re_s,obs.eq.Re_s,remove_eq);
    obs.d_Im_e = differential_matrix(obs.non_eq.Im_e,obs.eq.Im_e,remove_eq);
    obs.d_alpha = differential_matrix(obs.non_eq.alpha,obs.eq.alpha,remove_eq);
    obs.d_OD = differential_matrix(obs.non_eq.OD,obs.eq.OD,remove_eq);
    obs.d_JDOS = differential_matrix(JDOS_non_eq,JDOS_eq,remove_eq)/cnst.c_light^3;
end