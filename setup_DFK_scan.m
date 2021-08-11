function [lp,sp,sc,np,lm]=setup_DFK_scan(lp,sp,sc,np)
    sc.XUV = [sc.XUVlow:sc.XUVdelta:sc.XUVhigh]; % [eV]
    sc.delay = [-round(sc.delayRange/2):sc.delayDelta:round(sc.delayRange/2)]; % [fs]
    
    % Reduced electron-hole mass
    sp.mu=cnst.e_mass*sp.eEffMass*sp.hEffMass/(sp.eEffMass+sp.hEffMass); % [eV/c^2]
    %mu = 1*1.4*e_mass; % for Otobe Tests
    %sp.p_matr = sp.p_matr_au*(cnst.h_bar/cnst.a_bohr*cnst.c_light)^2; % [eV^2/c^2]
    sp.p_matr = cnst.e_mass^2*(sp.BG/4/sp.mu); % [eV^2/c^2] Kane formula
    % Find laser-matter parameters
    lm = laser_matter(lp,sp);
    % Find parameters for numeric integration: E_max, d_thata_min
    np = calc_theta_max(sc,lm,lp,sp,np); 
    np.th1 = linspace(0,np.th1_max,np.th1_max/np.dth1);
end