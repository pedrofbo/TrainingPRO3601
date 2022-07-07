import $, Visualizer;

crimes := $.lab11.Index_Crimes;
c2 := TABLE(crimes(primary_type='THEFT'), {primary_type, year});

rec := RECORD
  c2.year;
    cnt := COUNT(GROUP);
END;

c3 := TABLE(c2, rec, year);
OUTPUT(c3, NAMED('TheftCount'));
Visualizer.TwoD.Pie('Pie',,'TheftCount');
