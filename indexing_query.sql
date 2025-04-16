SELECT * FROM wiki_views.wiki_people_views_indexing;
-- normal sẽ mất 9.6s
SELECT * FROM wiki_views.wiki_people_views_indexing
where article_title = 'Duncan_Dawkins';
-- normal sẽ mất 10s
SELECT *
FROM wiki_people_views_indexing
WHERE view_timestamp = '2023-06-01' and article_title = 'Feisal_Tanjung';
-- normal sẽ mất 9.76s
SELECT *
FROM wiki_people_views_indexing
WHERE article_title = 'Feisal_Tanjung';
SELECT *
FROM wiki_people_views_indexing
WHERE id = '23051366';


SELECT *
FROM wiki_people_views_indexing
WHERE views > 1000;

-- 9.79s
SELECT article_title, views
FROM wiki_people_views_indexing
ORDER BY views DESC
LIMIT 10;
-- normal can't
SELECT article_title, SUM(views) AS total_views
FROM wiki_people_views_indexing
GROUP BY article_title
ORDER BY total_views DESC
LIMIT 10;

-- normal insert 8.797s, delete 8.969s
INSERT INTO wiki_people_views_indexing (article_title, view_timestamp, views)
VALUES ('New_Article', '2023-05-01', 50);
SELECT * FROM wiki_people_views_indexing
WHERE article_title = 'New_Article';
DELETE FROM wiki_people_views_indexing
WHERE id = 23068323 AND view_timestamp = '2023-05-01';

-- Index on view_timestamp to speed up date-based queries
CREATE INDEX idx_view_timestamp ON wiki_people_views_indexing(view_timestamp);

CREATE INDEX idx_article_title ON wiki_people_views_indexing(article_title);

CREATE INDEX idx_views ON wiki_people_views_indexing(views);

SELECT * FROM wiki_people_views_indexing;

SELECT * FROM wiki_people_views_indexing WHERE view_timestamp = '2023-04-01';

SELECT * FROM wiki_people_views_indexing WHERE article_title = 'Ayanna_Howard';

select * from wiki_people_views_indexing WHERE views > 10000;

SELECT article_title, SUM(views) AS total_views
FROM wiki_people_views_indexing
WHERE view_timestamp BETWEEN '2023-04-01' AND '2023-05-02'
GROUP BY article_title
ORDER BY total_views DESC
LIMIT 10;

SELECT article_title, SUM(views) AS total_views
FROM wiki_people_views_indexing
WHERE views > 1000
GROUP BY article_title;