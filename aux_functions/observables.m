function obs = observables(JDOS,XUV,n,p_matr,z_film)
    Re_s_CGS = cnst.Coulomb*p_matr/(cnst.e_mass^2)*pi/2/cnst.c_light*cnst.h_bar./XUV.*JDOS; % [fs^-1] CGS units
    obs.Re_s = Re_s_CGS/cnst.Coulomb*cnst.e*1e25; % [S/m] SI units
    obs.Im_e = 4*pi*Re_s_CGS*cnst.h_bar./XUV; 
    obs.alpha = 4*pi/cnst.c_light/n*Re_s_CGS;
    obs.OD = obs.alpha*z_film;
end