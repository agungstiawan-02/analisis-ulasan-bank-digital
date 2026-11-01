-- Ringkasan per aplikasi
SELECT app,
       COUNT(*) AS total_reviews,
       ROUND(AVG(score), 2) AS avg_score,
       ROUND(100.0 * SUM(CASE WHEN score = 1 THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct_1star,
       ROUND(100.0 * SUM(has_reply) / COUNT(*), 1) AS pct_replied
FROM reviews
GROUP BY app
ORDER BY avg_score DESC;

-- Rata-rata rating dan jumlah ulasan per bulan
SELECT substr("at", 1, 7) AS month,
       app,
       COUNT(*) AS total_reviews,
       ROUND(AVG(score), 2) AS avg_score
FROM reviews
GROUP BY month, app
ORDER BY month, app;
