 classdef cnst
    properties( Constant = true )
        e_mass=5.1100e+05; % [eV/c^2]
        c_light=2.9979e+03; % [A/fs]
        F_atomic=51.4220652; % [V/A]
        h_bar=0.6582119514; % [eV*fs]
        epsilon_0 = (8.8541878128/1.602176634)*1e-3; % [e^2/eV/A]
        Coulomb = (4*pi*cnst.epsilon_0)^-1; % [eV*A] e^2/(4pi*epsilon0)
        e = 1.602176634e-19; % [Coulomb]
        a_bohr = 0.5291772; % [A]  
        E_Hartree  = 27.211386; % [eV]
    end
 end