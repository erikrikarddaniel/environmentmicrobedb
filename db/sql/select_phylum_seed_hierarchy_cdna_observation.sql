SELECT
  s.code,
  t.domain,
  t.phylum,
  f.level1 seed1,
  f.level2 seed2,
  f.level3 seed3,
  f.level4 seed4,
  f.leaf   seedleaf,
  sum(cdna.n_specific)
FROM
  samples s JOIN
  cdna_observations cdna ON s.id = cdna.sample_id LEFT JOIN
  cdna_observation_taxons cdna_t ON cdna.id = cdna_t.cdna_observation_id JOIN
  taxons t ON t.id = cdna_t.taxon_id LEFT JOIN
  cdna_observation_functions cdna_f ON cdna.id = cdna_f.cdna_observation_id JOIN
  functions f ON f.id = cdna_f.function_id
WHERE
  f.source_db = 'SEED'
GROUP BY
  s.code,
  t.domain,
  t.phylum,
  f.level1,
  f.level2,
  f.level3,
  f.level4,
  f.leaf
ORDER BY
  s.code,
  f.level1,
  f.level2,
  f.level3,
  f.level4,
  f.leaf,
  t.domain,
  t.phylum
;
