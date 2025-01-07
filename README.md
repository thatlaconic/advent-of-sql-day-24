# [Santas banging tunes 🎶](https://adventofsql.com/challenges/24)

## Description
Santa was trying to pick the perfect song to play at the big after-Christmas party in the Alps. This was gonna be huge - he was DJing for the first time ever at this awesome party where elves, reindeer, and snowboarders would all hang out together. One of his smart elves helped him out by making a computer program that looked at what songs the elves had been listening to lately. It showed which songs people actually listened to all the way through and played over and over. Santa was super excited to DJ, knowing he'd find just the right banger to get everyone dancing and make the party totally epic!

## Challenge
[Download Challenge data](https://github.com/thatlaconic/advent-of-sql-day-24/blob/main/advent_of_sql_day_24.sql)

+  Find the most popular song with the most plays and least skips, in that order.
+ A skip is when the song hasn't been played the whole way through.
+ Submit the song name.

## Dataset
This dataset contains 2 tables. 
### Using PostgreSQL
**input**

```sql
SELECT *
FROM songs ;
```
**output**

![](https://github.com/thatlaconic/advent-of-sql-day-24/blob/main/songs2.PNG)

**input**

```sql
SELECT *
FROM user_plays ;
```
**output**

![](https://github.com/thatlaconic/advent-of-sql-day-24/blob/main/songs.PNG)


### Solution
[Download Solution Code](https://github.com/thatlaconic/advent-of-sql-day-24/blob/main/advent_answer_day24.sql)

**input**
```sql
SELECT song_title, COUNT(*) AS total_plays,
		SUM(CASE WHEN duration = song_duration THEN 0 ELSE 1 END) AS total_skips
FROM user_plays up
JOIN songs s ON up.song_id = s.song_id
GROUP BY song_title
ORDER BY 2 DESC, 3 ASC;

```
**output**

![](https://github.com/thatlaconic/advent-of-sql-day-24/blob/main/d24.PNG)

