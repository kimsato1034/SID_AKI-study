-- Blood Gas data (maximum and minimum) within the first 24 hours and within 48 hours after ICU admission
SELECT patientunitstayid
-- first 24 hrs
--  min
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND fio2 IS NOT NULL AND peep IS NOT NULL THEN fio2 END) AS fio2_min_24--only using fio2 values when aligned with peep values
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND pao2 IS NOT NULL THEN pao2 END) AS pao2_min_24
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND paco2 IS NOT NULL THEN paco2 END) AS paco2_min_24
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND pH IS NOT NULL THEN pH END) AS pH_min_24
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND aniongap IS NOT NULL THEN aniongap END) AS aniongap_min_24
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND basedeficit IS NOT NULL THEN basedeficit END) AS basedeficit_min_24
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND baseexcess IS NOT NULL THEN baseexcess END) AS baseexcess_min_24
, MIN(CASE WHEN chartoffset between -6*60 AND 24*60 AND peep IS NOT NULL AND fio2 IS NOT NULL THEN peep END) AS peep_min24--only using fio2 values when aligned with peep values
-- max
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND fio2 IS NOT NULL AND peep IS NOT NULL THEN fio2 END) AS fio2_min_48--only using fio2 values when aligned with peep values
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND pao2 IS NOT NULL THEN pao2 END) AS pao2_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND paco2 IS NOT NULL THEN paco2 END) AS paco2_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND pH IS NOT NULL THEN pH END) AS pH_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND aniongap IS NOT NULL THEN aniongap END) AS aniongap_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND basedeficit IS NOT NULL THEN basedeficit END) AS basedeficit_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND baseexcess IS NOT NULL THEN baseexcess END) AS baseexcess_min_48
, MIN(CASE WHEN chartoffset between -6*60 AND 48*60 AND peep IS NOT NULL AND fio2 IS NOT NULL THEN peep END) AS peep_min_48--only using fio2 values when aligned with peep values
-- first 48 hrs
--  min
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND fio2 IS NOT NULL AND peep IS NOT NULL THEN fio2 END) AS fio2_max_24--only using fio2 values when aligned with peep values
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND pao2 IS NOT NULL THEN pao2 END) AS pao2_max_24
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND paco2 IS NOT NULL THEN paco2 END) AS paco2_max_24
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND pH IS NOT NULL THEN pH END) AS pH_max_24
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND aniongap IS NOT NULL THEN aniongap END) AS aniongap_max_24
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND basedeficit IS NOT NULL THEN basedeficit END) AS basedeficit_max_24
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND baseexcess IS NOT NULL THEN baseexcess END) AS baseexcess_max_24
, MAX(CASE WHEN chartoffset between -6*60 AND 24*60 AND peep IS NOT NULL AND fio2 IS NOT NULL THEN peep END) AS peep_max24--only using fio2 values when aligned with peep values
--  max
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND fio2 IS NOT NULL AND peep IS NOT NULL THEN fio2 END) AS fio2_max_48--only using fio2 values when aligned with peep values
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND pao2 IS NOT NULL THEN pao2 END) AS pao2_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND paco2 IS NOT NULL THEN paco2 END) AS paco2_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND pH IS NOT NULL THEN pH END) AS pH_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND aniongap IS NOT NULL THEN aniongap END) AS aniongap_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND basedeficit IS NOT NULL THEN basedeficit END) AS basedeficit_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND baseexcess IS NOT NULL THEN baseexcess END) AS baseexcess_max_48
, MAX(CASE WHEN chartoffset between -6*60 AND 48*60 AND peep IS NOT NULL AND fio2 IS NOT NULL THEN peep END) AS peep_max_48--only using fio2 values when aligned with peep values
FROM `physionet-data.eicu_crd_derived.pivoted_bg`
GROUP BY patientunitstayid 