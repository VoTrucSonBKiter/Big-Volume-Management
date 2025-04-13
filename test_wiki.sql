SELECT * FROM wiki_views.monthly_views_2023_cleaned_v2
where monthly_views > '1000';
SELECT * FROM wiki_views.monthlyview2023_1tr;
select COUNT(*) from wiki_views.monthly_views_2023_cleaned_v2;
select COUNT(*) from wiki_views.monthlyview2023_1tr;

SELECT * FROM wiki_views.monthlyview2023_1tr
where monthly_views > '1000'
limit 10;