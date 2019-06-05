-- sodium and chloride first available data 24 hours prior to or 24 hours after ICU admission
-- difference between sodium ion and chloride ion = strong ion difference (SID)
-- first available data 24 hours prior to or 24 hours after ICU admission
WITH
  all_data AS (
  SELECT
    patientunitstayid,
    labresultoffset,
    CASE
      WHEN LOWER(labname) = 'sodium' THEN labresult END AS sodium,
    CASE
      WHEN LOWER(labname) = 'chloride' THEN labresult END AS chloride
  FROM
    `physionet-data.eicu_crd.lab`
  WHERE
    LOWER(labname) IN ('sodium','chloride')
    AND labresultoffset BETWEEN -6*24 AND 24*60 ),
  aggregated_data AS (
  SELECT
    patientunitstayid,
    labresultoffset,
    MAX(sodium) AS sodium_first,
    MAX(chloride) AS chloride_first,
    ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY labresultoffset ASC) AS rn
  FROM
    all_data
  GROUP BY
    patientunitstayid,
    labresultoffset)
SELECT
  patientunitstayid,
  sodium_first,
  chloride_first,
  sodium_first - chloride_first AS SID_first
FROM
  aggregated_data
WHERE rn = 1
