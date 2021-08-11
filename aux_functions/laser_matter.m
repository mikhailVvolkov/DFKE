function lm = laser_matter(lp,sp)
    lm.I = lp.vac_intensity; % can be replaced with a more sophisticated model
    lm.F = sqrt(2*lm.I/(cnst.c_light*cnst.epsilon_0*sp.n));
    lm.U_pond=((cnst.c_light^2)*lm.F^2)/(4*sp.mu*(lp.w^2)); % [eV]
    lm.gamma_FKE=lm.U_pond/(cnst.h_bar*lp.w); % [Dimensionless]
    lm.gamma_Keldysh=sqrt(sp.BG/(2*lm.gamma_FKE*cnst.h_bar*lp.w)); % with Ip=bandgap
    lm.th2 = 0.5*lm.gamma_FKE; %
end