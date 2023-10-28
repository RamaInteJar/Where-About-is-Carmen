--TEST COMMAND AND SAMPLE OUTPUT
-- Record your query (or queries, and some clues require more than one) below the clue, then comment out the output below it
-- use two `-` to comment at the start of a line, or highlight the text and press `⌘/` to toggle comments
-- EXAMPLE: SELECT ALL FROM THE TABLE COUNTRY AND LIMIT IT TO ONE ENTRY
SELECT * FROM country LIMIT 1;
--  -[ RECORD 1 ]--+--------------------------
-- code           | AFG
-- name           | Afghanistan
-- continent      | Asia
-- region         | Southern and Central Asia
-- surfacearea    | 652090
-- indepyear      | 1919
-- population     | 22720000
-- lifeexpectancy | 45.9
-- gnp            | 5976.00
-- gnpold         |
-- localname      | Afganistan/Afqanestan
-- governmentform | Islamic Emirate
-- headofstate    | Mohammad Omar
-- capital        | 1
-- code2          | AF

--Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed, so find the least populated country in Southern Europe, and we'll start looking for her there.
-- ANSWER:
neondb=> SELECT *FROM country WHERE region = 'Southern Europe' ORDER BY population ASC LIMIT 1;
-- ANSWER:
 code |             name              | continent |     region      | surfacearea | indepyear | population | lifeexpectancy | gnp  | gnpold |            localname            |      governmentform      |     headofstate     | capital | code2 
------+-------------------------------+-----------+-----------------+-------------+-----------+------------+----------------+------+--------+---------------------------------+--------------------------+---------------------+---------+-------
 VAT  | Holy See (Vatican City State) | Europe    | Southern Europe |         0.4 |      1929 |       1000 |                | 9.00 |        | Santa Sede/Cittï¿½ del Vaticano | Independent Church State | Johannes Paavali II |    3538 | VA
(1 row)

--clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in this country's officially recognized language. Check our databases and find out what language is spoken in this country, so we can call in a translator to work with you.
-- ANSWER:
neondb=> SELECT *FROM countrylanguage WHERE countrycode = 'VAT';
-- ANSWER:
countrycode | language | isofficial | percentage 
-------------+----------+------------+------------
 VAT         | Italian  | t          |          0
(1 row)

--clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on to a different country, a country where people speak only the language she was learning. Find out which country it is, and get yourself there pronto.
-- ANSWER:
neondb=> SELECT *FROM countrylanguage WHERE language = 'Italian' AND percentage = 100;
 countrycode | language | isofficial | percentage 
-------------+----------+------------+------------
 SMR         | Italian  | t          |        100
(1 row)

--clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time. There are only two cities she could be flying to in the country. One is named the same as the country – that would be too obvious. We're following our gut on this one; find out what other city in that country she might be flying to.
neondb=> SELECT * FROM city WHERE countrycode='SMR';
-- ANSWER:
  id  |    name    | countrycode |     district      | population 
------+------------+-------------+-------------------+------------
 3170 | Serravalle | SMR         | Serravalle/Dogano |       4802
 3171 | San Marino | SMR         | San Marino        |       2294
(2 rows)

--clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!
-- ANSWER:
neondb=> SELECT * FROM city WHERE name LIKE 'Serra%';
SELECT * FROM country WHERE code='BRA';
  id  |    name    | countrycode |     district      | population 
------+------------+-------------+-------------------+------------
  265 | Serra      | BRA         | Espï¿½rito Santo  |     302666
 3170 | Serravalle | SMR         | Serravalle/Dogano |       4802
(2 rows)

 code |  name  |   continent   |    region     | surfacearea  | indepyear | population | lifeexpectancy |    gnp    |  gnpold   | localname |  governmentform  |        headofstate        | capital | code2 
------+--------+---------------+---------------+--------------+-----------+------------+----------------+-----------+-----------+-----------+------------------+---------------------------+---------+-------
 BRA  | Brazil | South America | South America | 8.547403e+06 |      1822 |  170115000 |           62.9 | 776739.00 | 804108.00 | Brasil    | Federal Republic | Fernando Henrique Cardoso |     211 | BR
(1 row)

--clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll follow right behind you!


