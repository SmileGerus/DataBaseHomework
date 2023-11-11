-- Page 2

SELECT name, duration FROM trecks t
ORDER BY duration DESC
LIMIT 1;

SELECT name FROM trecks t 
WHERE duration < '00:03:30'
ORDER BY duration;

SELECT name FROM collection c 
WHERE yor BETWEEN '2018-01-01' AND '2021-01-01'
ORDER BY yor;

SELECT name FROM music_performers mp 
WHERE name NOT LIKE '% %';

SELECT name FROM trecks t 
WHERE name LIKE '%my%';

-- Page 3

SELECT g.name, COUNT(performer_id) per_i FROM performers_geners pg 
JOIN genres g ON pg.genre_id = g.id 
GROUP BY g."name" 
ORDER BY per_i DESC;

SELECT a.name, COUNT(t.id) FROM trecks t
JOIN albums a ON t.album_id = a.id 
WHERE a.yor BETWEEN '2019-01-01' AND '2021-01-01'
GROUP BY a."name";

SELECT a.name, AVG(t.duration) du FROM trecks t 
JOIN albums a ON t.album_id = a.id 
GROUP BY a."name" 
ORDER BY du DESC;

SELECT mp.name FROM performers_albums pa 
JOIN albums a ON pa.album_id = a.id 
JOIN music_performers mp ON pa.performer_id = mp.id 
WHERE a.yor NOT BETWEEN '2020-01-01' AND '2021-12-31'
GROUP BY mp."name";

-- Page 4

SELECT a.name, COUNT(genre_id) count_gen FROM performers_geners pg
JOIN music_performers mp ON pg.performer_id = mp.id 
JOIN performers_albums pa ON mp.id = pa.performer_id 
JOIN albums a ON pa.album_id = a.id 
GROUP BY a."name"
HAVING COUNT(genre_id) > 1;

SELECT DISTINCT name FROM trecks t
WHERE id NOT IN (SELECT treck_id FROM collections_trecks);

SELECT mp.name, MIN(t.duration) k FROM trecks t 
JOIN albums a ON t.album_id = a.id 
JOIN performers_albums pa ON a.id = pa.album_id 
JOIN music_performers mp ON pa.performer_id = mp.id
WHERE t.duration = (SELECT MIN(duration) FROM trecks)
GROUP BY mp."name"; 

SELECT a.name, COUNT(t.id) k FROM trecks t 
JOIN albums a ON t.album_id = a.id 
GROUP BY a."name"
ORDER BY k;


