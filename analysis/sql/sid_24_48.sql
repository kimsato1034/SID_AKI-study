-- sodium and chloride
-- difference between sodium ion and chloride ion = strong ion difference (SID)
-- Maximum value, minimum value for 24 hours after ICU admission.
-- Maximum value, minimum value for 48 hours after ICU admission.

WITH
  sq AS (
  SELECT
    patientunitstayid
-- MIN

-- first 24 hrs
    ,MIN(CASE
      WHEN LOWER(labname) = 'sodium' AND labresultoffset BETWEEN -6*60 AND 24*60 AND labresult IS NOT NULL THEN labresult END) AS sodium_min_24
    ,MIN(CASE
      WHEN LOWER(labname) = 'chloride' AND labresultoffset BETWEEN -6*60 AND 24*60 AND labresult IS NOT NULL THEN labresult END) AS chloride_min_24
-- first 48 hrs
    ,MIN(CASE
      WHEN LOWER(labname) = 'sodium' AND labresultoffset BETWEEN -6*60 AND 48*60 AND labresult IS NOT NULL THEN labresult END) AS sodium_min_48
    ,MIN(CASE
      WHEN LOWER(labname) = 'chloride' AND labresultoffset BETWEEN -6*60 AND 48*60 AND labresult IS NOT NULL THEN labresult END) AS chloride_min_48
-- MAX

-- first 24 hrs
    ,MAX(CASE
      WHEN LOWER(labname) = 'sodium' AND labresultoffset BETWEEN -6*60 AND 24*60 AND labresult IS NOT NULL THEN labresult END) AS sodium_max_24
    ,MAX(CASE
      WHEN LOWER(labname) = 'chloride' AND labresultoffset BETWEEN -6*60 AND 24*60 AND labresult IS NOT NULL THEN labresult END) AS chloride_max_24
-- first 48 hrs
    ,MAX(CASE
      WHEN LOWER(labname) = 'sodium' AND labresultoffset BETWEEN -6*60 AND 48*60 AND labresult IS NOT NULL THEN labresult END) AS sodium_max_48
    ,MAX(CASE
      WHEN LOWER(labname) = 'chloride' AND labresultoffset BETWEEN -6*60 AND 48*60 AND labresult IS NOT NULL THEN labresult END) AS chloride_max_48    
FROM
    `physionet-data.eicu_crd.lab`
GROUP BY
patientunitstayid    
)SELECT
    patientunitstayid
  , sodium_min_24
  , chloride_min_24
  , sodium_min_48
  , chloride_min_48
  , sodium_max_24
  , chloride_max_24
  , sodium_max_48
  , chloride_max_48  
  , sodium_min_24 - chloride_min_24 AS SID_min_24
  , sodium_max_24 - chloride_max_24 AS SID_max_24
  , sodium_min_48 - chloride_min_48 AS SID_min_48
  , sodium_max_48 - chloride_max_48 AS SID_max_48  
FROM
  sq
ORDER BY
  patientunitstayid