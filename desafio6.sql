SELECT
  CONVERT(ROUND(MIN(sub.subscription_price), 2), CHAR) AS 'faturamento_minimo',
  CONVERT(ROUND(MAX(sub.subscription_price), 2), CHAR) AS 'faturamento_maximo',
  CONVERT(ROUND(AVG(sub.subscription_price), 2), CHAR) AS 'faturamento_medio',
  CONVERT(ROUND(SUM(sub.subscription_price), 2), CHAR) AS 'faturamento_total'
FROM SpotifyClone.users u
INNER JOIN SpotifyClone.subscriptions sub ON u.subscription_id = sub.subscription_id;