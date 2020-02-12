-- Lab data (maximum and minimum) within the first 48 hours and within 48 hours after ICU admission
SELECT patientunitstayid
-- MIN
-- first 48 hrs
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND glucose IS NOT NULL THEN glucose END) AS glucose_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND hemoglobin IS NOT NULL THEN hemoglobin END) AS hemoglobin_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND hematocrit IS NOT NULL THEN hematocrit END) AS hematocrit_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND platelets IS NOT NULL THEN platelets END) AS platelets_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND BUN IS NOT NULL THEN BUN END) AS BUN_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND wbc IS NOT NULL THEN wbc END) AS wbc_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND albumin IS NOT NULL THEN albumin END) AS albumin_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND bilirubin IS NOT NULL THEN bilirubin END) AS bilirubin_min48

-- MAX
-- first 48 hrs
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND glucose IS NOT NULL THEN glucose END) AS glucose_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND hemoglobin IS NOT NULL THEN hemoglobin END) AS hemoglobin_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND hematocrit IS NOT NULL THEN hematocrit END) AS hematocrit_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND platelets IS NOT NULL THEN platelets END) AS platelets_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND BUN IS NOT NULL THEN BUN END) AS BUN_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND wbc IS NOT NULL THEN wbc END) AS wbc_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND albumin IS NOT NULL THEN albumin END) AS albumin_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND bilirubin IS NOT NULL THEN bilirubin END) AS bilirubin_max48

FROM `physionet-data.eicu_crd_derived.pivoted_lab`
WHERE   
      glucose IS NOT NULL
  AND hemoglobin IS NOT NULL
  AND hematocrit IS NOT NULL
  AND platelets IS NOT NULL
  AND BUN IS NOT NULL
  AND wbc IS NOT NULL
  AND albumin IS NOT NULL
  AND bilirubin IS NOT NULL
  --OFFSET--
 AND chartoffset between -6*60 AND 48*60
GROUP BY patientunitstayid
