CREATE SCHEMA wiki_views; 
USE wiki_views;

CREATE TABLE wiki_people_views (
    id BIGINT AUTO_INCREMENT,
    article_title VARCHAR(255),
    view_timestamp DATE,
    views INT,
    PRIMARY KEY (id, view_timestamp)
) PARTITION BY RANGE (YEAR(view_timestamp)) (
    PARTITION p2015 VALUES LESS THAN (2016),
    PARTITION p2016 VALUES LESS THAN (2017),
    PARTITION p2017 VALUES LESS THAN (2018),
    PARTITION p2018 VALUES LESS THAN (2019),
    PARTITION p2019 VALUES LESS THAN (2020),
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p_future VALUES LESS THAN (MAXVALUE)
);

drop table monthlyview2023_1tr;
# SHOW VARIABLES LIKE 'secure_file_priv'; #C:\ProgramData\MySQL\MySQL Server 9.1\Uploads\

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/monthly_views_2023_cleaned_v2.csv'
INTO TABLE wiki_people_views
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(article_title, view_timestamp, views);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/monthlyview2023_1tr.csv'
INTO TABLE wiki_people_views
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(article_title, view_timestamp, views);

SHOW VARIABLES LIKE 'net_read_timeout';
SHOW VARIABLES LIKE 'net_write_timeout';
SHOW VARIABLES LIKE 'wait_timeout';

select * from wiki_views.wiki_people_views;
select count(ID) from wiki_views.wiki_people_views;

select * from wiki_views.wiki_people_views
where views > 10000;

SELECT article_title, SUM(views) AS total_views
FROM wiki_people_views
WHERE view_timestamp BETWEEN '2023-04-01' AND '2023-31-01'
GROUP BY article_title
ORDER BY total_views DESC
LIMIT 10;

SELECT article_title, SUM(views) AS total_views
FROM wiki_people_views WHERE views > 1000;