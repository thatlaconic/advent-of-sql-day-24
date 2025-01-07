
SELECT song_title, COUNT(*) AS total_plays,
		SUM(CASE WHEN duration = song_duration THEN 0 ELSE 1 END) AS total_skips
FROM user_plays up
JOIN songs s ON up.song_id = s.song_id
GROUP BY song_title
ORDER BY 2 DESC, 3 ASC
;