IMPORT $;
IMPORT STD;

layout := $.lab07.layout;
crimes := $.lab07.File;

crimes2 := RECORD
  UNSIGNED recid;
  STRING8 dia;
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

crimes2 MyTransf(layout Le, UNSIGNED cnt) := TRANSFORM
  SELF.recid := cnt;
  SELF.dia := (STRING8)STD.Date.FromStringToDate(Le.date[1..10], '%m/%d/%Y');
  SELF := Le;
END;

c2 := PROJECT(crimes, MyTransf(LEFT,COUNTER));

c2;
