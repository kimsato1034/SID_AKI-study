-- this query extracts Past medical history for evey patientunitstayid
SELECT
patientunitstayid
, MAX(CASE WHEN  REGEXP_CONTAINS(LOWER(pasthistoryvaluetext), '(congestive heart failure|chf)')  THEN 1 ELSE 0 END) AS pasthistory_chf
, MAX(CASE WHEN  REGEXP_CONTAINS(LOWER(pasthistoryvaluetext), '(peripheral vascular disease|pvd)')  THEN 1 ELSE 0 END) AS pasthistory_pvd
, MAX(CASE WHEN  REGEXP_CONTAINS(LOWER(pasthistoryvaluetext), '(hypertension|ht|htn)')  THEN 1 ELSE 0 END) AS pasthistory_hypertension
, MAX(CASE WHEN  REGEXP_CONTAINS(LOWER(pasthistoryvaluetext), '(chronic pulmonary disease|copd|asthma|ip)')  THEN 1 ELSE 0 END) AS pasthistory_copd
, MAX(CASE WHEN  REGEXP_CONTAINS(LOWER(pasthistoryvaluetext), '(diabetes|dm)')  THEN 1 ELSE 0 END) AS pasthistory_diabetes
, MAX(CASE WHEN  REGEXP_CONTAINS(LOWER(pasthistoryvaluetext), '(chronic liver disease|hbv|hcv|nash)')  THEN 1 ELSE 0 END) AS pasthistory_cld
, MAX(CASE WHEN  REGEXP_CONTAINS(LOWER(pasthistoryvaluetext), '(malignancy|lk|ek|lung cancer| lung cancer|esophageal cancer)')  THEN 1 ELSE 0 END) AS pasthistory_malignancy
FROM
  `physionet-data.eicu_crd.pasthistory`
GROUP BY patientunitstayid 
