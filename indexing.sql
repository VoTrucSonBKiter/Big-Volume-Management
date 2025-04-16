DROP DATABASE wiki_views;
CREATE SCHEMA wiki_views; 
USE wiki_views;

CREATE TABLE wiki_people_views_indexing (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    article_title VARCHAR(255),
    view_timestamp DATE,
    views INT
);

-- Index on view_timestamp to speed up date-based queries
CREATE INDEX idx_view_timestamp ON wiki_people_views_indexing(view_timestamp);

CREATE INDEX idx_article_title ON wiki_people_views_indexing(article_title);

CREATE INDEX idx_views ON wiki_people_views_indexing(views);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/monthly_views_2023_cleaned_v2.csv'
INTO TABLE wiki_people_views
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(article_title, view_timestamp, views);

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
