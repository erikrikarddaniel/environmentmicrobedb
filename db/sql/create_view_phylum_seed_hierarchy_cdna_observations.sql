CREATE OR REPLACE VIEW sample_taxon_function_cdna_observations AS
  SELECT
    s.id AS sample_id,
    s.code AS sample_code,
    t.id AS taxon_id,
    f.id AS function_id,
    sum(cdna.n_specific) AS sum_n_specific
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
    s.id,
    t.id,
    f.id
;
