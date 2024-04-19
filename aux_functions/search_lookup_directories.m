function [lookup_ok,warnings,full_path] = search_lookup_directories(base_path,th2,np)
    full_path = '';
    lookup_ok = false;
    warnings = '';
    path = [base_path 'Lookup tables\'];
    D = dir(path);
    for k = 3:length(D)
        currD = [D(k).folder filesep D(k).name];
        [lookup_ok,warnings]=check_lookup_tables(currD,th2,np);
        if lookup_ok
            full_path = currD;
            break
        end
    end
end