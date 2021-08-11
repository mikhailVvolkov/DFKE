function [obs_ac, obs_dc] = static_FK_module(sc,lm,lp,sp)
    optical_cycle = [0:0.01:1]*2*pi/lp.w;
    F_ac=abs(lm.F.*sin(lp.w*optical_cycle'));

    JDOS.dc = FK_JDOS(sc.XUV,sp.BG,sp.mu,lm.F);
    JDOS.ac = FK_JDOS(sc.XUV,sp.BG,sp.mu,F_ac);
    JDOS.zero = FK_JDOS(sc.XUV,sp.BG,sp.mu,0);
    
    obs.eq = observables(JDOS.zero,sc.XUV,sp.n_XUV,sp.p_matr,sp.z_film);
    obs.dc = observables(JDOS.dc,sc.XUV,sp.n_XUV,sp.p_matr,sp.z_film);
    obs.ac = observables(JDOS.ac,sc.XUV,sp.n_XUV,sp.p_matr,sp.z_film);
    
    obs_ac.d_OD = differential_profile(obs.ac.OD, obs.eq.OD);
    obs_ac.d_Re_s = differential_profile(obs.ac.Re_s, obs.eq.Re_s);
    obs_ac.d_Im_e = differential_profile(obs.ac.Im_e, obs.eq.Im_e);
    obs_ac.d_alpha = differential_profile(obs.ac.alpha, obs.eq.alpha);
    obs_ac.d_JDOS = differential_profile(JDOS.ac, JDOS.zero);
    
    obs_dc.d_OD = differential_profile(obs.dc.OD, obs.eq.OD);
    obs_dc.d_Re_s = differential_profile(obs.dc.Re_s, obs.eq.Re_s);
    obs_dc.d_Im_e = differential_profile(obs.dc.Im_e, obs.eq.Im_e);
    obs_dc.d_alpha = differential_profile(obs.dc.alpha, obs.eq.alpha);
    obs_dc.d_JDOS = differential_profile(JDOS.dc, JDOS.zero);
    
    %adiabatic_OD = differential_matrix(obs.ac.OD, obs.eq.OD);
    %figure;pcolor(optical_cycle - max(optical_cycle)/2,sc.XUV,adiabatic_OD);shading interp;
end