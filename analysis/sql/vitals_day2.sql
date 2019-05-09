-- this query extracts Vital signs within the first 48 hrs of ICU admission:
-- in order to address missing data issues and since some data points were stored incorrectly, we broadened the window since -6 hour from admission,  
-- the query prioritizes data coming from the following sources in the following order:
--     vitalaperiodic:  vital sign data which is interfaced into eCareManager at irregular intervals (non invasive bp measurements).
--     pivoted_vital:   nurse charting table duplication: vitalsigns charted at the bed (invasive bp measurements).
--     vitalperiodic:   vital signs values from the bedside vital signs monitors (invasive bp measurements).
-- hst means highest
-- me means mean

WITH pivoted_vitals AS
(
SELECT
  patientunitstayid,
  MAX(CASE
      WHEN heartrate IS NOT NULL THEN heartrate END ) AS hst_hr_day1,
  AVG(CASE
      WHEN heartrate IS NOT NULL THEN heartrate END ) AS me_hr_day1,      
  MIN(CASE
      WHEN ibp_systolic IS NOT NULL THEN ibp_systolic END ) AS lest_sys_day1,
  AVG(CASE
      WHEN ibp_systolic IS NOT NULL THEN ibp_systolic END ) AS me_sys_day1,      
  MIN(CASE
      WHEN ibp_diastolic IS NOT NULL THEN ibp_diastolic END ) AS lest_dia_day1,
  AVG(CASE
      WHEN ibp_diastolic IS NOT NULL THEN ibp_diastolic END ) AS me_dia_day1      
FROM
  `physionet-data.eicu_crd_derived.pivoted_vital`
-- Within the first 48 hrs of ICU admission
WHERE
  chartoffset BETWEEN -6*60 AND 48*60 
GROUP BY patientunitstayid
)
, periodic_vitals AS 
(
SELECT
  patientunitstayid,
  MAX(CASE
      WHEN heartrate IS NOT NULL THEN heartrate END ) AS hst_hr_day1,
  AVG(CASE
      WHEN heartrate IS NOT NULL THEN heartrate END ) AS me_hr_day1,      
  MIN(CASE
      WHEN systemicsystolic IS NOT NULL THEN systemicsystolic END ) AS lest_sys_day1,
  AVG(CASE
      WHEN systemicsystolic IS NOT NULL THEN systemicsystolic END ) AS me_sys_day1,      
  MIN(CASE
      WHEN systemicdiastolic IS NOT NULL THEN systemicdiastolic END ) AS lest_dia_day1,
  AVG(CASE
      WHEN systemicdiastolic IS NOT NULL THEN systemicdiastolic END ) AS me_dia_day1      
FROM
  `physionet-data.eicu_crd.vitalperiodic`
  -- Within the first 48 hrs of ICU admission
WHERE
  observationoffset BETWEEN -6*60 AND 48*60 
GROUP BY
  patientunitstayid
)
, aperiodic_vitals AS
(
SELECT
  patientunitstayid,
  MIN(CASE
      WHEN noninvasivesystolic IS NOT NULL THEN noninvasivesystolic END ) AS lest_sys_day1,
  AVG(CASE
      WHEN noninvasivesystolic IS NOT NULL THEN noninvasivesystolic END ) AS me_sys_day1,      
  MIN(CASE
      WHEN noninvasivediastolic IS NOT NULL THEN noninvasivediastolic END ) AS lest_dia_day1,
  AVG(CASE
      WHEN noninvasivediastolic IS NOT NULL THEN noninvasivediastolic END ) AS me_dia_day1    
FROM
  `physionet-data.eicu_crd.vitalaperiodic`
  -- Within the first 48 hrs of ICU admission
WHERE
  observationoffset BETWEEN -6*60 AND 48*60 
GROUP BY
  patientunitstayid
)
SELECT
 aperiodic_vitals.patientunitstayid
,COALESCE( pivoted_vitals.hst_hr_day1, periodic_vitals.hst_hr_day1) AS hst_hr_day1 --prioritizing pivoted data-points
,COALESCE( pivoted_vitals.me_hr_day1, periodic_vitals.me_hr_day1) AS me_hr_day1 --prioritizing pivoted data-points
,COALESCE( aperiodic_vitals.lest_sys_day1,pivoted_vitals.lest_sys_day1, periodic_vitals.lest_sys_day1) AS lest_sys_day1 --prioritizing non invasive data-points
,COALESCE( aperiodic_vitals.me_sys_day1,pivoted_vitals.me_sys_day1, periodic_vitals.me_sys_day1) AS me_sys_day1 --prioritizing non invasive data-points
,COALESCE( aperiodic_vitals.lest_dia_day1,pivoted_vitals.lest_dia_day1, periodic_vitals.lest_dia_day1) AS lest_dia_day1 --prioritizing non invasive data-points
,COALESCE( aperiodic_vitals.me_dia_day1,pivoted_vitals.me_dia_day1, periodic_vitals.me_dia_day1) AS me_dia_day1 --prioritizing non invasive data-points
FROM aperiodic_vitals FULL JOIN pivoted_vitals
ON aperiodic_vitals.patientunitstayid  = pivoted_vitals.patientunitstayid
FULL JOIN periodic_vitals
ON aperiodic_vitals.patientunitstayid  = periodic_vitals.patientunitstayid