SELECT
  t.family || '¤' || f.leaf AS cls,
  coalesce(sum(kb1sum), 0) AS kb1sum,
  coalesce(sum(kb2sum), 0) AS kb2sum,
  coalesce(sum(nb1sum), 0) AS nb1sum,
  coalesce(sum(nb2sum), 0) AS nb2sum
FROM
  ( 
    SELECT 
      tf.taxon_id AS taxon_id, 
      tf.function_id AS function_id, 
      kb1.sum_n_specific AS kb1sum,
      kb2.sum_n_specific AS kb2sum,
      nb1.sum_n_specific AS nb1sum,
      nb2.sum_n_specific AS nb2sum
    FROM 
      ( SELECT DISTINCT taxon_id, function_id FROM sample_taxon_function_cdna_observations WHERE sample_code in ('KB1', 'KB2', 'NB1', 'NB2') ) tf FULL JOIN
      sample_taxon_function_cdna_observations kb1 ON
      tf.taxon_id = kb1.taxon_id AND tf.function_id = kb1.function_id AND kb1.sample_code = 'KB1' FULL JOIN
      sample_taxon_function_cdna_observations kb2 ON
      tf.taxon_id = kb2.taxon_id AND tf.function_id = kb2.function_id AND kb2.sample_code = 'KB2' FULL JOIN
      sample_taxon_function_cdna_observations nb1 ON
      tf.taxon_id = nb1.taxon_id AND tf.function_id = nb1.function_id AND nb1.sample_code = 'NB1' FULL JOIN
      sample_taxon_function_cdna_observations nb2 ON
      tf.taxon_id = nb2.taxon_id AND tf.function_id = nb2.function_id AND nb2.sample_code = 'NB2'
  ) cdna JOIN
  taxons t ON cdna.taxon_id = t.id JOIN
  functions f ON cdna.function_id = f.id
GROUP BY
  1
ORDER BY
  1
;
