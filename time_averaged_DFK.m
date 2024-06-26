function obs_av = time_averaged_DFK(lp,sp,sc,np,Cm,Sm)
    % Legacy. to be replaced with m = 0 selection
    m_max_store = np.m_max;
    np.m_max = 0;
    selected.m = ones(2*m_max_store+1,1);
    selected.cos = 1;
    selected.sin = 1;
    JDOS_non_eq = JDOS_DFK(lp,sp,sc,np,Cm,Sm,selected);% cycle-averaged is Cm0 only
    np.m_max = m_max_store;
    
    %JDOS_eq = JDOS_const(sp.mu)*abs(sqrt(sc.XUV-sp.BG)).*heaviside(sc.XUV-sp.BG);
    JDOS_eq = JDOS_const(sp.mu)*abs(sqrt(sc.XUV-sp.BG)).*my_heaviside(sc.XUV-sp.BG);
    obs_av.non_eq = observables(JDOS_non_eq,sc.XUV,sp.n_XUV,sp.p_matr,sp.z_film);
    obs_av.eq = observables(JDOS_eq,sc.XUV,sp.n_XUV,sp.p_matr,sp.z_film);  
    
    obs_av.d_Re_s = differential_profile(obs_av.non_eq.Re_s,obs_av.eq.Re_s);
    obs_av.d_Im_e = differential_profile(obs_av.non_eq.Im_e,obs_av.eq.Im_e);
    obs_av.d_alpha = differential_profile(obs_av.non_eq.alpha,obs_av.eq.alpha);
    obs_av.d_OD = differential_profile(obs_av.non_eq.OD,obs_av.eq.OD);
    obs_av.d_JDOS = differential_profile(JDOS_non_eq,JDOS_eq)/cnst.c_light^3;
end