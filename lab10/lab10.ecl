EXPORT lab10 := Module
	EXPORT layout_crimes := Record
		UNSIGNED row_id;
		STRING8 day;
		STRING6 time;
		UNSIGNED8 ID;
		STRING9 Case_Number;
		STRING4 IUCR;
		STRING33 Primary_Type;
		STRING59 Description;
		BOOLEAN Arrest;
		BOOLEAN Domestic;
		STRING4 FBI_Code;
		UNSIGNED8 Year;
		STRING22 Updated_On;
		END;
	EXPORT layout_address := Record
		UNSIGNED row_id;
		STRING38 Block;
		STRING47 Location_Description;
		STRING47 Beat;
		STRING8 District;
		INTEGER8 Ward;
		STRING4 Community_Area;
		REAL8 X_Coordinate;
		REAL8 Y_Coordinate;
		REAL8 Latitude;
		REAL8 Longitude;
		STRING22 Location;
		END;
	EXPORT File_Crimes := DATASET('~class::pfbo::persist::crimes_transform__p4123561784', layout_crimes, FLAT);
	EXPORT File_Address := DATASET('~class::pfbo::persist::crimes_transform__p4123561784', layout_address, FLAT);
    EXPORT Index_Crimes := INDEX(File_Crimes,{day, primary_type},{File_Crimes},'~class::pfbo::crimes::dp');
    EXPORT Index_Address := INDEX(File_Address,{district, ward},{File_Address},'~class::pfbo::addresses::dw');
END;
