WITH sq_potasium AS (
SELECT
 patientunitstayid
,labresult AS potassium_adm
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY labresultoffset ASC) AS rn
FROM
`physionet-data.eicu_crd.lab`
WHERE labname = 'potassium'
AND
labresultoffset >= -6*60 -- window where first labresults can be recorded.
), sq_bicarbonate AS (
SELECT
 patientunitstayid
,labresult AS bicarbonate_adm
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY labresultoffset ASC) AS rn
FROM
`physionet-data.eicu_crd.lab`
WHERE labname = 'bicarbonate'
AND
labresultoffset >= -6*60 -- window where first labresults can be recorded.
), sq_ua AS (
SELECT
 patientunitstayid
,labresult AS ua_adm
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY labresultoffset ASC) AS rn
FROM
`physionet-data.eicu_crd.lab`
WHERE labname = 'uric acid'
AND
labresultoffset >= -6*60 -- window where first labresults can be recorded.
), sq_heartrate AS (
SELECT
 patientunitstayid
,heartrate AS heartrate_adm
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM
`physionet-data.eicu_crd_derived.pivoted_vital`
WHERE
chartoffset >= -6*60 -- window where first labresults can be recorded.
), sq_systolic AS (
SELECT
 patientunitstayid
,COALESCE (nibp_systolic ,ibp_systolic) AS systolic_adm -- We want nibp in case we can't find it, ibp is extracted
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM
`physionet-data.eicu_crd_derived.pivoted_vital`
WHERE
chartoffset >= -6*60 -- window where first labresults can be recorded.
), sq_temperature AS (
SELECT
 patientunitstayid
,temperature AS temperature_adm
,ROW_NUMBER() OVER (PARTITION BY patientunitstayid ORDER BY chartoffset ASC) AS rn
FROM
`physionet-data.eicu_crd_derived.pivoted_vital`
WHERE
chartoffset >= -6*60 -- window where first labresults can be recorded.
)
SELECT
 patient.patientunitstayid
,potassium_adm
,bicarbonate_adm
,ua_adm
,heartrate_adm
,systolic_adm
,temperature_adm
FROM
`physionet-data.eicu_crd.patient` patient
LEFT JOIN
sq_potasium
ON 
(patient.patientunitstayid=sq_potasium.patientunitstayid AND sq_potasium.rn=1)
LEFT JOIN
sq_bicarbonate
ON 
(patient.patientunitstayid=sq_bicarbonate.patientunitstayid AND sq_bicarbonate.rn=1)
LEFT JOIN
sq_ua
ON 
(patient.patientunitstayid=sq_ua.patientunitstayid AND sq_ua.rn=1)
LEFT JOIN
sq_heartrate
ON 
(patient.patientunitstayid=sq_heartrate.patientunitstayid AND sq_heartrate.rn=1)
LEFT JOIN
sq_systolic
ON 
(patient.patientunitstayid=sq_systolic.patientunitstayid AND sq_systolic.rn=1)
LEFT JOIN
sq_temperature
ON 
(patient.patientunitstayid=sq_temperature.patientunitstayid AND sq_temperature.rn=1)