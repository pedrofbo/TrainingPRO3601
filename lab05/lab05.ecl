EXPORT lab05 := Module
	EXPORT layout := Record
		UNSIGNED8 ID;
		STRING9 Case_Number;
		STRING22 Date;
		STRING38 Block;
		STRING4 IUCR;
		STRING33 Primary_Type;
		STRING59 Description;
		STRING47 Location_Description;
		BOOLEAN Arrest;
		BOOLEAN Domestic;
		STRING47 Beat;
		STRING8 District;
		INTEGER8 Ward;
		STRING4 Community_Area;
		STRING4 FBI_Code;
		REAL8 X_Coordinate;
		REAL8 Y_Coordinate;
		UNSIGNED8 Year;
		STRING22 Updated_On;
		REAL8 Latitude;
		REAL8 Longitude;
		STRING22 Location;
		END;
	EXPORT File := DATASET('~class::intro::pfbo::crimes_-_2001_to_present.csv', layout, CSV(heading(1)));
END;
		