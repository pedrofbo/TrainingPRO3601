IMPORT $;

crimes := $.lab06.File;

//remove all columns except for id and year
c2 := TABLE(crimes, {id, year});
//c2;

//remove years before 2010 and after 2020
c3 := c2(year >= 2010 AND year <= 2020);
//c3;

//crimes per year
rec2 := RECORD
  c3.year;
    cnt := COUNT(GROUP);
END;

cpy := TABLE(c3, rec2, year);
//cpy;

//sort by year
cpys := SORT(cpy, year);
cpys;

//average number of crimes per year
avg := AVE(cpys, cnt);
avg;
