import $;

// BUILD($.lab10.Index_Crimes);
// BUILD($.lab10.Index_Address);

Search_Crimes (STRING d, STRING p) := FUNCTION
    base_key := $.lab10.File_Crimes;
    filtered_key := base_key(day=d AND primary_type=p);
    RETURN OUTPUT(filtered_key);
END;

crimes := $.lab10.File_Crimes;
crimes;

c2 := Search_Crimes ('20220101', 'THEFT');
c2;

Search_Address (STRING d, INTEGER w) := FUNCTION
    base_key := $.lab10.File_Address;
    filtered_key := base_key(district=d AND ward=w);
    RETURN OUTPUT(filtered_key);
END;

address := $.lab10.File_Address;
address;

a2 := Search_Address('007', 20);
a2;
