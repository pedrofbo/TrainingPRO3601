IMPORT $, STD;

Crimes := $.lab05.File;

profileResults := STD.DataPatterns.Profile(Crimes);
bestrecord     := STD.DataPatterns.BestRecordStructure(Crimes);

OUTPUT(profileResults, ALL, NAMED('profileResults'));
OUTPUT(bestrecord, ALL, NAMED('BestRecord'));
