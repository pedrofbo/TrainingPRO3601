﻿IMPORT $;
Property := $.File_Property.File;
ML_Prop  := $.File_Property.MLPropMI;

EXPORT Prep01_MI := MODULE

  MLPropExt := RECORD(ML_Prop)
    UNSIGNED4 rnd; // A random number
  END;
  // Clean the data, assign a random number to each record and 
  CleanFilter := Property.zip <> '' AND Property.assessed_value <> 0 AND Property.year_acquired <> 0 AND 
                 Property.land_square_footage <> 0 AND Property.living_square_feet <> 0 AND 
							   Property.bedrooms <> 0 AND Property.year_Built <> 0;
  EXPORT myDataE := PROJECT(Property(CleanFilter), TRANSFORM(MLPropExt, 
                                                             SELF.rnd := RANDOM(),
                                                             SELF.Zip := (UNSIGNED3)LEFT.Zip,
			  																										 SELF.wi_id := MAP(LEFT.State = 'CA' => 1,
				  																									                   LEFT.State = 'NY' => 2,
					  																																	 LEFT.State = 'FL' => 3,
						  																																 0),
                                                             SELF := LEFT));
								  															             
  // Shuffle your data by sorting on the random field
  SHARED myDataES := SORT(myDataE(wi_id <> 0), rnd);
  // Now cut the deck and you have random samples within each set
  // While you're at it, project back to your original format -- we dont need the rnd field anymore
  // Treat first 5000 as training data.  Transform back to the original format.
  EXPORT myTrainData := PROJECT(myDataES[1..5000], ML_Prop);
                                 
  // Treat next 2000 as test data
  EXPORT myTestData  := PROJECT(myDataES[5001..7000], ML_Prop);
                               
END;
