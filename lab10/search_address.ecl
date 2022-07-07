import $;

EXPORT Search_Address (STRING d, INTEGER w) := FUNCTION
    base_key := $.lab10.File_Address;
    filtered_key := base_key(district=d AND ward=w);
    RETURN OUTPUT(filtered_key);
END;
