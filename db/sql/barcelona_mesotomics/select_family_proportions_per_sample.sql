SELECT
  t.family,
  c.sample_code,
  sum(c.sum_n_specific) AS count,
  sum(c.sum_n_specific)/total.total AS freq
FROM
  taxons t join
  sample_taxon_function_cdna_observations c on
  t.id = c.taxon_id JOIN
  (
    SELECT
      sample_code,
      sum(sum_n_specific) AS total
    FROM
      sample_taxon_function_cdna_observations
    GROUP BY
      1
  ) total ON
  c.sample_code = total.sample_code
WHERE
  c.sample_code != 'NA1' AND
  t.family IN (
    'Aerococcaceae',
    'Alteromonadaceae',
    'Branchiostomidae',
    'Burkholderiaceae',
    'Chaetomiaceae',
    'Cryomorphaceae',
    'Edwardsiidae',
    'Enterobacteriaceae',
    'Equidae',
    'Fabaceae',
    'Flavobacteriaceae',
    'Halomonadaceae',
    'Legionellaceae',
    'Microviridae',
    'Mycosphaerellaceae',
    'Nitrosopumilaceae',
    'Oceanospirillaceae',
    'Pediculidae',
    'Piscirickettsiaceae',
    'Poaceae',
    'Podoviridae',
    'Pseudoalteromonadaceae',
    'Rhodobacteraceae',
    'Rhodospirillaceae',
    'Shewanellaceae',
    'Siphoviridae',
    'Thalassiosiraceae',
    'Trichocomaceae',
    'Vibrionaceae',
    'Xanthobacteraceae'
  )
GROUP BY
  t.family,
  c.sample_code,
  total.total
;
