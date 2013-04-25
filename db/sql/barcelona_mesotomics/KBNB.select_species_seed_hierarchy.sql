SELECT
  f.level1 AS seed1,
  f.level2 AS seed2,
  f.level3 AS seed3,
  f.level4 AS seed4,
  f.leaf   AS seedleaf,
  t.domain,
  t.phylum,
  t.organism_class,
  t.order,
  t.family,
  t.genus,
  t.species,
  sum(kb1sum) AS kb1sum,
  sum(kb2sum) AS kb2sum,
  sum(nb1sum) AS nb1sum,
  sum(nb2sum) AS nb2sum
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
  f.level1,
  f.level2,
  f.level3,
  f.level4,
  f.leaf,
  t.domain,
  t.phylum,
  t.organism_class,
  t.order,
  t.family,
  t.genus,
  t.species
ORDER BY
  f.level1,
  f.level2,
  f.level3,
  f.level4,
  f.leaf,
  t.domain,
  t.phylum,
  t.organism_class,
  t.order,
  t.family,
  t.genus,
  t.species
;
