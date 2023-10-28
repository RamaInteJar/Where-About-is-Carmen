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
