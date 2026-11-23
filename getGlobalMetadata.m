function GlobalStruct = getGlobalMetadata()
    %% this function describes the general global metadata for atmospheric longwave data
    % 
    % 
    GlobalStruct(1).Name        = 'Title';
    GlobalStruct(1).Value       = 'Atmospheric clear-sky downward longwave radiation data';

    GlobalStruct(2).Name        = 'Summary';
    GlobalStruct(2).Value       = 'Modelisation of the atmospheric downward longwave radiation data measured at Payerne, Switzerland during clear-sky. Measurements originate from a instrument further denoted as 1, Eppley PIR pyrgeometer, and another instrument further denoted as 2, Kipp & Zonen CG4 pyrgeometer.';

    GlobalStruct(3).Name        = 'References';
    GlobalStruct(3).Value       = 'DOI:???';

    GlobalStruct(4).Name        = 'Institution';
    GlobalStruct(4).Value       = 'MeteoSwiss Payerne';

    GlobalStruct(5).Name        = 'Station_name';
    GlobalStruct(5).Value       = 'PAY (Payerne)';
    GlobalStruct(6).Name        = 'Station_scientist';
    GlobalStruct(6).Value       = 'Laurent Vuilleumier (laurent.vuilleumier@meteoswiss.ch)';
    GlobalStruct(7).Name        = 'Latitude';
    GlobalStruct(7).Value       = '46.812300';
    GlobalStruct(8).Name        = 'Longitude';
    GlobalStruct(8).Value       = '6.942200';
    GlobalStruct(9).Name        = 'Elevation';
    GlobalStruct(9).Value       = '491.0 m';
    GlobalStruct(10).Name       = 'Method';
    GlobalStruct(10).Value      = 'Monitoring station (MONS)';
    GlobalStruct(11).Name       = 'Comment';
    GlobalStruct(11).Value      = 'BSRN station no: 21; Surface type: cultivated; Topography type: hilly, rural';

    GlobalStruct(12).Name       = 'Conventions';
    GlobalStruct(12).Value      = 'CF-1.11';
    GlobalStruct(13).Name       = 'conventions_url';
    GlobalStruct(13).Value      = 'https://cfconventions.org/Data/cf-standard-names/current/build/cf-standard-name-table.html';
    GlobalStruct(14).Name       = 'standard_name_vocabulary';
    GlobalStruct(14).Value      = 'NetCDF Climate and Forecast (CF) Standard Name Table';
    GlobalStruct(15).Name       = 'variable_definition_vocabulary';
    GlobalStruct(15).Value      = 'World Meteorological Organization (WMO) Observing Systems Capability Analysis and Review tool (OSCAR)';
    GlobalStruct(16).Name       = 'variable_definition_vocabulary_url';
    GlobalStruct(16).Value      = 'https://space.oscar.wmo.int/variables';
    GlobalStruct(17).Name       = 'Instruments';
    GlobalStruct(17).Value      = 'Instrument 1: Pyrgeometer Eppley PIR / Instrument 2: Pyrgeometer Kipp & Zonen CG4';
    GlobalStruct(18).Name       = 'License';
    GlobalStruct(18).Value      = 'Creative Commons Attribution 4.0 International (CC BY 4.0)';
    GlobalStruct(19).Name       = 'License_url';
    GlobalStruct(19).Value      = 'https://creativecommons.org/licenses/by/4.0/';

    GlobalStruct(20).Name       = 'History';
    GlobalStruct(20).Value      = 'Created from 1-minute averaged measurements and themselves averages on 30 minutes. Only clear-sky is present in this documentation.';
    
    GlobalStruct(21).Name       = 'Time coverage start';
    GlobalStruct(21).Value      = '01-01-2011 00:00:00';
    GlobalStruct(22).Name       = 'Time coverage end';
    GlobalStruct(22).Value      = '01-01-2026 00:00:00';
    GlobalStruct(23).Name       = 'Creation date';
    GlobalStruct(23).Value      = '01-01-2026 00:00:00';
    

end