-- Page 2

-- №1
SELECT name, duration md FROM trecks t
WHERE duration >= (SELECT MAX(duration) FROM trecks);

-- №2
SELECT name FROM trecks t 
WHERE duration < '00:03:30'
ORDER BY duration;

-- №3
SELECT name FROM collection c 
WHERE yor BETWEEN '2018-01-01' AND '2021-01-01'
ORDER BY yor;

-- №4
SELECT name FROM music_performers mp 
WHERE name NOT LIKE '% %';

-- №5
SELECT name FROM trecks t 
WHERE name LIKE '%my%';

-- Page 3

-- №1
SELECT g.name, COUNT(performer_id) per_i FROM performers_geners pg 
JOIN genres g ON pg.genre_id = g.id 
GROUP BY g."name" 
ORDER BY per_i DESC;

-- №2
SELECT a.name, COUNT(t.id) FROM trecks t
JOIN albums a ON t.album_id = a.id 
WHERE a.yor BETWEEN '2019-01-01' AND '2021-01-01'
GROUP BY a."name";

-- №3
SELECT a.name, AVG(t.duration) du FROM trecks t 
JOIN albums a ON t.album_id = a.id 
GROUP BY a."name" 
ORDER BY du DESC;

-- №4
SELECT mp.name FROM performers_albums pa 
JOIN albums a ON pa.album_id = a.id 
JOIN music_performers mp ON pa.performer_id = mp.id 
WHERE a.id  != (SELECT id FROM albums WHERE yor BETWEEN '2020-01-01' AND '2021-12-31')
GROUP BY mp."name";

-- №5
SELECT c.name FROM trecks t 
JOIN collections_trecks ct ON t.id = ct.treck_id 
JOIN collection c ON ct.collection_id = c.id 
JOIN albums a ON t.album_id = a.id 
JOIN performers_albums pa ON a.id = pa.album_id 
JOIN music_performers mp ON pa.performer_id = mp.id 
WHERE mp.name = 'Eminem';

-- Page 4

-- №1
SELECT a.name, COUNT(genre_id) count_gen FROM performers_geners pg
JOIN music_performers mp ON pg.performer_id = mp.id 
JOIN performers_albums pa ON mp.id = pa.performer_id 
JOIN albums a ON pa.album_id = a.id 
GROUP BY a."name"
HAVING COUNT(genre_id) > 1;

-- №2
SELECT DISTINCT name FROM trecks t
WHERE id NOT IN (SELECT treck_id FROM collections_trecks);

-- №3
SELECT mp.name, MIN(t.duration) k FROM trecks t 
JOIN albums a ON t.album_id = a.id 
JOIN performers_albums pa ON a.id = pa.album_id 
JOIN music_performers mp ON pa.performer_id = mp.id
WHERE t.duration = (SELECT MIN(duration) FROM trecks)
GROUP BY mp."name"; 

-- №4
SELECT a.name, COUNT(t.id) k FROM trecks t 
JOIN albums a ON t.album_id = a.id 
GROUP BY a."name"
ORDER BY k;


