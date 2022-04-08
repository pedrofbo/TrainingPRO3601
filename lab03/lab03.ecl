EXPORT lab03 := Module
	EXPORT layout := Record
		UNSIGNED ID;
		STRING CaseNumber;
		STRING Date;
		STRING Block;
		STRING IUCR;
		STRING PrimaryType;
		STRING Description;
		STRING LocationDescription;
		BOOLEAN Arrest;
		BOOLEAN Domestic;
		STRING Beat;
		STRING District;
		INTEGER Ward;
		STRING CommunityArea;
		STRING FBICode;
		REAL XCoordinate;
		REAL YCoordinate;
		UNSIGNED Year;
		STRING UpdatedOn;
		REAL Latitude;
		REAL Longitude;
		STRING Location;
		END;
	EXPORT File := DATASET('~class::intro::pfbo::crimes_-_2001_to_present.csv', layout, CSV(heading(1)));
END;
		