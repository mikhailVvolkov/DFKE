function M2 = kane_matrix_element(sp)
    M2 = 0.5*cnst.e_mass*sp.BG*(1/sp.eEffMass - 1); % [eV^2/c^2] Dresselhaus MIT, and other books confirm. However, no excitonic effect considered
end