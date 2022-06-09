IMPORT $;
IMPORT STD;

layout := $.lab07.layout;
crimes := $.lab07.File;

crimes2 := RECORD
  UNSIGNED row_id;
  STRING8 day;
  STRING6 time;
  layout
END;

crimes2 MyTransf(layout Le, UNSIGNED cnt) := TRANSFORM
  SELF.row_id := cnt;
  SELF.day := (STRING8)STD.Date.FromStringToDate(Le.date[1..10], '%m/%d/%Y');
  hour := (STRING2)IF(
    Le.date[21..22] = 'PM',
    IF(
      (UNSIGNED)Le.date[12..13] < 12,
      (STRING2)((UNSIGNED)Le.date[12..13] + 12),
      Le.date[12..13]
    ),
    IF(
      (UNSIGNED)Le.date[12..13] = 12,
      '00',
      Le.date[12..13]
    )
  );
  minute := Le.date[15..16];
  second := Le.date[18..19];
  SELF.time := hour + minute + second;
  SELF := Le;
END;

c2 := PROJECT(crimes, MyTransf(LEFT,COUNTER))
              :PERSIST('~class::pfbo::persist::crimes_transform');

c2;
