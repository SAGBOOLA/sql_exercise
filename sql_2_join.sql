# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
SELECT * FROM City WHERE Name LIKE 'ping%' ORDER BY Population;
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT * FROM City WHERE Name LIKE 'ran%' ORDER BY Population DESC;
#
# 3: Count all cities
SELECT COUNT(*) FROM City;
#
# 4: Get the average population of all cities
SELECT AVG(Population) FROM City;
#
# 5: Get the biggest population found in any of the cities
SELECT MAX(Population) FROM City;
#
# 6: Get the smallest population found in any of the cities
SELECT MIN(Population) FROM City;
#
# 7: Sum the population of all cities with a population below 10000
SELECT SUM(Population) FROM City WHERE Population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
SELECT COUNT(*) FROM City WHERE Countrycode = 'MOZ' OR Countrycode = 'VNM';
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
SELECT COUNT(*) FROM City WHERE Countrycode = 'MOZ';
SELECT COUNT(*) FROM City WHERE Countrycode = 'VNM';
# 10: Get average population of cities in MOZ and VNM
SELECT AVG(Population) FROM City WHERE Countrycode = 'MOZ' OR Countrycode = 'VNM';
#
# 11: Get the countrycodes with more than 200 cities
SELECT COUNT(Id), Countrycode FROM City GROUP BY Countrycode HAVING COUNT(Id) > 200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
SELECT COUNT(Id), Countrycode FROM City GROUP BY Countrycode HAVING COUNT(Id) > 200 ORDER BY COUNT(Id);
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
SELECT Language, POPULATION FROM CountryLanguage
INNER JOIN City ON CountryLanguage.Countrycode = City.Countrycode
WHERE Population BETWEEN 400 AND 500;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT City.Name, CountryLanguage.Language FROM City
INNER JOIN CountryLanguage ON City.Countrycode = CountryLanguage.Countrycode
WHERE Population BETWEEN 500 AND 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
SELECT City.Name, City.Countrycode FROM City WHERE City.Countrycode = (SELECT Countrycode FROM City WHERE City.Population = 122199);
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT City.Name, City.Countrycode FROM City
WHERE city.Countrycode = (SELECT Countrycode FROM City WHERE Population = 122199) AND NOT City.Population = 122199;
#
# 17: What are the city names in the country where Luanda is capital?
SELECT City.Name FROM City
LEFT JOIN Country ON City.Countrycode = Country.Code
WHERE Country.Capital=(SELECT Id FROM City WHERE Name = 'Luanda');
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT City.Name AS CapitalCities
FROM City INNER JOIN Country ON City.Id = Country.Capital
WHERE Country.region = (SELECT Region FROM Country WHERE Capital = (SELECT Id FROM City WHERE Name = 'Yaren'));
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT Language FROM CountryLanguage
INNER JOIN Country ON CountryLanguage.Countrycode = Country.code
WHERE Country.region = (SELECT Region FROM Country WHERE Capital = (SELECT Id FROM City WHERE Name = 'Riga'));
#
# 20: Get the name of the most populous city
SELECT Name FROM city ORDER BY Population DESC LIMIT 1;
#
