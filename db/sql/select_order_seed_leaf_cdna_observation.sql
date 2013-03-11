SELECT
  s.code,
  t.domain,
  t.phylum,
  t.organism_class,
  t.order,
  f.name,
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
  t.organism_class,
  t.order,
  f.name
ORDER BY
  s.code,
  f.name,
  t.domain,
  t.phylum,
  t.organism_class,
  t.order
;
