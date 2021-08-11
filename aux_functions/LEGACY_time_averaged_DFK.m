function obs_av = LEGACY_time_averaged_DFK(sp,sc,Cm)
    m_lkp_max = (length(Cm(:,1))-1)/2;    

    % An extra 1/pi division needed to match with static absoprtion. It is
    % a matter of definition.
    prefactor = 1/pi./sc.XUV*cnst.h_bar;
    a_dfk=prefactor.*Cm(m_lkp_max+1,:);

    a_dfk = a_dfk';
    % "A" constant is the same for both equilibrium and non-equilibrium
    % conductivity. It is lacking e^2/4/pi/epsilon_0
    A = cnst.Coulomb/4/pi/cnst.c_light*((2*sp.mu)^(3/2))*sp.p_matr/(cnst.e_mass^2)/(cnst.h_bar^3); % the free electorn mass here comes from the fine constant e/mc, through the dipole matrix element
    
    % Note: in addition to 1/4/pi in the Si_Unit, 1/4/pi is included (deliberately) again.
    % This is not a mistake. 
    Re_s_eq = A*(cnst.h_bar./sc.XUV).*abs(sqrt(sc.XUV-sp.BG)).*heaviside(sc.XUV-sp.BG); % [fs^-1]
    mismatch_constant = 0.5;
    Re_s_non_eq = mismatch_constant*A*a_dfk; % [fs^-1] 
    
    % If we want eq conductivity in SI units, we need to compute
    Re_s_eq_SI = Re_s_eq/cnst.Coulomb * 1e25* cnst.e; % [S/m]
    Re_s_non_eq_SI = Re_s_non_eq/cnst.Coulomb * 1e25* cnst.e; % [S/m]

    obs_av.d_Re_s = Re_s_non_eq_SI - Re_s_eq_SI';
    
    Im_e_eq = 4*pi*Re_s_eq*cnst.h_bar./sc.XUV; 
    Im_e_non_eq = 4*pi.*Re_s_non_eq.*(cnst.h_bar./sc.XUV');
    
    obs_av.d_Im_e = Im_e_non_eq - Im_e_eq';

    alpha_eq = (4*pi)*Re_s_eq'/cnst.c_light./sp.n_XUV;
    alpha_non_eq = (4*pi)*Re_s_non_eq./cnst.c_light./sp.n_XUV;
    
    absorbance_non_eq = alpha_non_eq*sp.z_film;
    absorbance_eq = alpha_eq*sp.z_film;
    
    obs_av.d_OD = absorbance_non_eq - absorbance_eq;
    obs_av.d_alpha = alpha_non_eq - alpha_eq;
end