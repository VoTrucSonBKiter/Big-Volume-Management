SELECT article_title, SUM(views) AS total_views
FROM wiki_people_views_new
WHERE SUBSTRING(view_timestamp, 6, 2) = '01' AND YEAR(view_timestamp) = 2023
GROUP BY article_title
ORDER BY total_views DESC
LIMIT 10;

EXPLAIN SELECT article_title, SUM(views) AS total_views
FROM wiki_people_views_new
WHERE SUBSTRING(view_timestamp, 6, 2) = '01' AND YEAR(view_timestamp) = 2023
GROUP BY article_title
ORDER BY total_views DESC
LIMIT 10;

SELECT article_title, SUM(views) AS total_views
FROM wiki_people_views
WHERE SUBSTRING(view_timestamp, 6, 2) = '01' AND YEAR(view_timestamp) = 2023
GROUP BY article_title
ORDER BY total_views DESC
LIMIT 10;

INSERT INTO wiki_people_views_new (article_title, view_timestamp, views)
VALUES ('New_Article', '2023-01-05', 50);
SELECT * FROM wiki_people_views_new
WHERE article_title = 'New_Article';
DELETE FROM wiki_people_views_new
WHERE id = 46780020 AND view_timestamp = '2023-01-05';


INSERT INTO wiki_people_views (article_title, view_timestamp, views)
VALUES ('New_Article', '2023-01-05', 50);
SELECT * FROM wiki_people_views
WHERE article_title = 'New_Article';
DELETE FROM wiki_people_views
WHERE id = 138359056 AND view_timestamp = '2023-01-05';

SHOW INDEX FROM wiki_people_views_new;