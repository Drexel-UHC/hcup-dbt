
select 
"KEY",
  AGE,
  DIED,
  RACE,
  HISPANIC,
  FEMALE,
  admit_date,
  ZIP,
  flu,
  flu_like,
  ili_diagnosis_var
FROM "main"."parquet"."int_sedd_flu_line_level"