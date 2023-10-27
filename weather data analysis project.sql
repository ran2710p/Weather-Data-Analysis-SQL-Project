SELECT * FROM weatherdata.weather;

-- Task 1 : Find all the wind speed values ?
SELECT DISTINCT(`WindSpeed_km/h`) FROM weather ;

-- Task 2 : Find the number of times the weather is exactly clear ?
SELECT * FROM weather WHERE weather ="clear" ;
SELECT COUNT(*) FROM weather WHERE Weather = "clear";

-- Task 3 : Find the number of times when the wind speed is exactly 4km/h ?
SELECT * FROM weather  WHERE `WindSpeed_km/h` =4;
SELECT COUNT(*) FROM weather WHERE Weather = "clear";

-- Task 4 : Find out all the null values in the data ?
SELECT COUNT(`Date/Time`) AS Date_Time , COUNT(Temp_C) AS Temp_C , 
COUNT(`DewPointTemp_C`) AS Dew_Point, COUNT(`Rel Hum_%`) AS Rel_Hum,
COUNT(`WindSpeed_km/h`) AS WindSpeed_kmh , COUNT(Visibility_km) AS Visibility_km,
COUNT(Press_kPa) AS Press_kPa, COUNT(Weather) AS Weather FROM weather
WHERE `Date/Time` IS NULL OR Temp_C IS NULL OR `DewPointTemp_C` IS NULL OR `Rel Hum_%` IS NULL OR `WindSpeed_km/h`
IS NULL OR Visibility_km IS NULL OR Press_kPa IS NULL OR Weather IS NULL ;

-- Task 5 : Rename the column name weather to weather condition ?
ALTER TABLE weather 
RENAME COLUMN weather TO Weahter_Condition ;

SELECT * FROM weather LIMIT 10;

-- Task 6 : What is the mean Visibility ?
SELECT ROUND(AVG(Visibility_km),2) AS Mean_Visibility FROM weather ;

-- Task 7 : What is the standard deviation of pressure ?
SELECT ROUND(STD(Press_kPa),2) AS Pressure_STD FROM weather ;

-- Task 8 : What is the variance of "Relative Humidity" in the data ?
SELECT ROUND(VARIANCE(`Rel Hum_%`),2) AS VAR_REL_HUM FROM weather ;

-- Task 9 : Find all the the instances where weather condition is snow ?
SELECT * FROM weather 
WHERE Weather_Condition REGEXP "Snow" ;

-- Task 10 : Find all the instances when the wind speed is above 24 and visibility is 25 ?
SELECT * FROM weather 
WHERE `WindSpeed_km/h` >24 AND Visibility_km = 25 ;

-- Task 11 : What is the mean value of each column against each weather condition ?
SELECT Weather_Condition,AVG(Temp_C) AS AVG_Temp, AVG(DewPointTemp_C) AS AVG_DewPointTemp, 
       AVG(`Rel Hum_%`) AS AVG_Rel_Hum, AVG(`WindSpeed_km/h`) AS AVG_WindSpeed,
       AVG(Visibility_km) AS AVG_Visibility, AVG(Press_kPa) AS AVG_Pressure 
FROM weather 
GROUP BY Weather_Condition ;

-- Task 12 : What is the maximum of column against each weather condition ?
SELECT Weather_Condition,MAX(Temp_C) AS MAX_Temp, MAX(DewPointTemp_C) AS MAX_DewPointTemp, 
       MAX(`Rel Hum_%`) AS MAX_Rel_Hum, MAX(`WindSpeed_km/h`) AS MAX_WindSpeed,
       MAX(Visibility_km) AS MAX_Visibility, MAX(Press_kPa) AS MAX_Pressure 
FROM weather 
GROUP BY Weather_Condition ;

-- Task 13 : What is the minimum of column against each weather condition ?
SELECT Weather_Condition,MIN(Temp_C) AS MIN_Temp, MIN(DewPointTemp_C) AS MIN_DewPointTemp, 
       MIN(`Rel Hum_%`) AS MIN_Rel_Hum, MIN(`WindSpeed_km/h`) AS MIN_WindSpeed,
       MIN(Visibility_km) AS MIN_Visibility, MIN(Press_kPa) AS MIN_Pressure 
FROM weather 
GROUP BY Weather_Condition ;

-- Task 14 : Show all the records where weather condition is fog ?
SELECT * FROM weather where Weather_Condition REGEXP "fog" ;

-- Task 15 : Find all the instances where weather is clear or visibility is above 40 ?
SELECT * FROM weather WHERE Weather_Condition REGEXP "Clear" OR Visibility_km > 40 ;

-- Task 14 : Find all the instances where weather is clear AND relative humidity is greater than 50 or visibility is above 40 ?
SELECT * FROM weather WHERE Weather_Condition REGEXP "Clear" OR Visibility_km > 40 AND `Rel Hum_%` > 50 ;
