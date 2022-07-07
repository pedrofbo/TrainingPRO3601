import $;

EXPORT Search_Crimes (STRING d, STRING p) := FUNCTION
    base_key := $.lab10.File_Crimes;
    filtered_key := base_key(day=d AND primary_type=p);
    RETURN OUTPUT(filtered_key);
END;