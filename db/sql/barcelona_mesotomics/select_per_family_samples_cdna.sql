SELECT
  a.seedname,
  coalesce(Aerococcaceae.kb1sum, 0) AS Aerococcaceae_kb1,
  coalesce(Aerococcaceae.kb2sum, 0) AS Aerococcaceae_kb2,
  coalesce(Aerococcaceae.nb1sum, 0) AS Aerococcaceae_nb1,
  coalesce(Aerococcaceae.nb2sum, 0) AS Aerococcaceae_nb2,
  coalesce(Alteromonadaceae.kb1sum, 0) AS Alteromonadaceae_kb1,
  coalesce(Alteromonadaceae.kb2sum, 0) AS Alteromonadaceae_kb2,
  coalesce(Alteromonadaceae.nb1sum, 0) AS Alteromonadaceae_nb1,
  coalesce(Alteromonadaceae.nb2sum, 0) AS Alteromonadaceae_nb2,
  coalesce(Branchiostomidae.kb1sum, 0) AS Branchiostomidae_kb1,
  coalesce(Branchiostomidae.kb2sum, 0) AS Branchiostomidae_kb2,
  coalesce(Branchiostomidae.nb1sum, 0) AS Branchiostomidae_nb1,
  coalesce(Branchiostomidae.nb2sum, 0) AS Branchiostomidae_nb2,
  coalesce(Burkholderiaceae.kb1sum, 0) AS Burkholderiaceae_kb1,
  coalesce(Burkholderiaceae.kb2sum, 0) AS Burkholderiaceae_kb2,
  coalesce(Burkholderiaceae.nb1sum, 0) AS Burkholderiaceae_nb1,
  coalesce(Burkholderiaceae.nb2sum, 0) AS Burkholderiaceae_nb2,
  coalesce(Chaetomiaceae.kb1sum, 0) AS Chaetomiaceae_kb1,
  coalesce(Chaetomiaceae.kb2sum, 0) AS Chaetomiaceae_kb2,
  coalesce(Chaetomiaceae.nb1sum, 0) AS Chaetomiaceae_nb1,
  coalesce(Chaetomiaceae.nb2sum, 0) AS Chaetomiaceae_nb2,
  coalesce(Cryomorphaceae.kb1sum, 0) AS Cryomorphaceae_kb1,
  coalesce(Cryomorphaceae.kb2sum, 0) AS Cryomorphaceae_kb2,
  coalesce(Cryomorphaceae.nb1sum, 0) AS Cryomorphaceae_nb1,
  coalesce(Cryomorphaceae.nb2sum, 0) AS Cryomorphaceae_nb2,
  coalesce(Edwardsiidae.kb1sum, 0) AS Edwardsiidae_kb1,
  coalesce(Edwardsiidae.kb2sum, 0) AS Edwardsiidae_kb2,
  coalesce(Edwardsiidae.nb1sum, 0) AS Edwardsiidae_nb1,
  coalesce(Edwardsiidae.nb2sum, 0) AS Edwardsiidae_nb2,
  coalesce(Enterobacteriaceae.kb1sum, 0) AS Enterobacteriaceae_kb1,
  coalesce(Enterobacteriaceae.kb2sum, 0) AS Enterobacteriaceae_kb2,
  coalesce(Enterobacteriaceae.nb1sum, 0) AS Enterobacteriaceae_nb1,
  coalesce(Enterobacteriaceae.nb2sum, 0) AS Enterobacteriaceae_nb2,
  coalesce(Equidae.kb1sum, 0) AS Equidae_kb1,
  coalesce(Equidae.kb2sum, 0) AS Equidae_kb2,
  coalesce(Equidae.nb1sum, 0) AS Equidae_nb1,
  coalesce(Equidae.nb2sum, 0) AS Equidae_nb2,
  coalesce(Fabaceae.kb1sum, 0) AS Fabaceae_kb1,
  coalesce(Fabaceae.kb2sum, 0) AS Fabaceae_kb2,
  coalesce(Fabaceae.nb1sum, 0) AS Fabaceae_nb1,
  coalesce(Fabaceae.nb2sum, 0) AS Fabaceae_nb2,
  coalesce(Flavobacteriaceae.kb1sum, 0) AS Flavobacteriaceae_kb1,
  coalesce(Flavobacteriaceae.kb2sum, 0) AS Flavobacteriaceae_kb2,
  coalesce(Flavobacteriaceae.nb1sum, 0) AS Flavobacteriaceae_nb1,
  coalesce(Flavobacteriaceae.nb2sum, 0) AS Flavobacteriaceae_nb2,
  coalesce(Halomonadaceae.kb1sum, 0) AS Halomonadaceae_kb1,
  coalesce(Halomonadaceae.kb2sum, 0) AS Halomonadaceae_kb2,
  coalesce(Halomonadaceae.nb1sum, 0) AS Halomonadaceae_nb1,
  coalesce(Halomonadaceae.nb2sum, 0) AS Halomonadaceae_nb2,
  coalesce(Legionellaceae.kb1sum, 0) AS Legionellaceae_kb1,
  coalesce(Legionellaceae.kb2sum, 0) AS Legionellaceae_kb2,
  coalesce(Legionellaceae.nb1sum, 0) AS Legionellaceae_nb1,
  coalesce(Legionellaceae.nb2sum, 0) AS Legionellaceae_nb2,
  coalesce(Microviridae.kb1sum, 0) AS Microviridae_kb1,
  coalesce(Microviridae.kb2sum, 0) AS Microviridae_kb2,
  coalesce(Microviridae.nb1sum, 0) AS Microviridae_nb1,
  coalesce(Microviridae.nb2sum, 0) AS Microviridae_nb2,
  coalesce(Mycosphaerellaceae.kb1sum, 0) AS Mycosphaerellaceae_kb1,
  coalesce(Mycosphaerellaceae.kb2sum, 0) AS Mycosphaerellaceae_kb2,
  coalesce(Mycosphaerellaceae.nb1sum, 0) AS Mycosphaerellaceae_nb1,
  coalesce(Mycosphaerellaceae.nb2sum, 0) AS Mycosphaerellaceae_nb2,
  coalesce(Nitrosopumilaceae.kb1sum, 0) AS Nitrosopumilaceae_kb1,
  coalesce(Nitrosopumilaceae.kb2sum, 0) AS Nitrosopumilaceae_kb2,
  coalesce(Nitrosopumilaceae.nb1sum, 0) AS Nitrosopumilaceae_nb1,
  coalesce(Nitrosopumilaceae.nb2sum, 0) AS Nitrosopumilaceae_nb2,
  coalesce(Oceanospirillaceae.kb1sum, 0) AS Oceanospirillaceae_kb1,
  coalesce(Oceanospirillaceae.kb2sum, 0) AS Oceanospirillaceae_kb2,
  coalesce(Oceanospirillaceae.nb1sum, 0) AS Oceanospirillaceae_nb1,
  coalesce(Oceanospirillaceae.nb2sum, 0) AS Oceanospirillaceae_nb2,
  coalesce(Pediculidae.kb1sum, 0) AS Pediculidae_kb1,
  coalesce(Pediculidae.kb2sum, 0) AS Pediculidae_kb2,
  coalesce(Pediculidae.nb1sum, 0) AS Pediculidae_nb1,
  coalesce(Pediculidae.nb2sum, 0) AS Pediculidae_nb2,
  coalesce(Piscirickettsiaceae.kb1sum, 0) AS Piscirickettsiaceae_kb1,
  coalesce(Piscirickettsiaceae.kb2sum, 0) AS Piscirickettsiaceae_kb2,
  coalesce(Piscirickettsiaceae.nb1sum, 0) AS Piscirickettsiaceae_nb1,
  coalesce(Piscirickettsiaceae.nb2sum, 0) AS Piscirickettsiaceae_nb2,
  coalesce(Poaceae.kb1sum, 0) AS Poaceae_kb1,
  coalesce(Poaceae.kb2sum, 0) AS Poaceae_kb2,
  coalesce(Poaceae.nb1sum, 0) AS Poaceae_nb1,
  coalesce(Poaceae.nb2sum, 0) AS Poaceae_nb2,
  coalesce(Podoviridae.kb1sum, 0) AS Podoviridae_kb1,
  coalesce(Podoviridae.kb2sum, 0) AS Podoviridae_kb2,
  coalesce(Podoviridae.nb1sum, 0) AS Podoviridae_nb1,
  coalesce(Podoviridae.nb2sum, 0) AS Podoviridae_nb2,
  coalesce(Pseudoalteromonadaceae.kb1sum, 0) AS Pseudoalteromonadaceae_kb1,
  coalesce(Pseudoalteromonadaceae.kb2sum, 0) AS Pseudoalteromonadaceae_kb2,
  coalesce(Pseudoalteromonadaceae.nb1sum, 0) AS Pseudoalteromonadaceae_nb1,
  coalesce(Pseudoalteromonadaceae.nb2sum, 0) AS Pseudoalteromonadaceae_nb2,
  coalesce(Rhodobacteraceae.kb1sum, 0) AS Rhodobacteraceae_kb1,
  coalesce(Rhodobacteraceae.kb2sum, 0) AS Rhodobacteraceae_kb2,
  coalesce(Rhodobacteraceae.nb1sum, 0) AS Rhodobacteraceae_nb1,
  coalesce(Rhodobacteraceae.nb2sum, 0) AS Rhodobacteraceae_nb2,
  coalesce(Rhodospirillaceae.kb1sum, 0) AS Rhodospirillaceae_kb1,
  coalesce(Rhodospirillaceae.kb2sum, 0) AS Rhodospirillaceae_kb2,
  coalesce(Rhodospirillaceae.nb1sum, 0) AS Rhodospirillaceae_nb1,
  coalesce(Rhodospirillaceae.nb2sum, 0) AS Rhodospirillaceae_nb2,
  coalesce(Shewanellaceae.kb1sum, 0) AS Shewanellaceae_kb1,
  coalesce(Shewanellaceae.kb2sum, 0) AS Shewanellaceae_kb2,
  coalesce(Shewanellaceae.nb1sum, 0) AS Shewanellaceae_nb1,
  coalesce(Shewanellaceae.nb2sum, 0) AS Shewanellaceae_nb2,
  coalesce(Siphoviridae.kb1sum, 0) AS Siphoviridae_kb1,
  coalesce(Siphoviridae.kb2sum, 0) AS Siphoviridae_kb2,
  coalesce(Siphoviridae.nb1sum, 0) AS Siphoviridae_nb1,
  coalesce(Siphoviridae.nb2sum, 0) AS Siphoviridae_nb2,
  coalesce(Thalassiosiraceae.kb1sum, 0) AS Thalassiosiraceae_kb1,
  coalesce(Thalassiosiraceae.kb2sum, 0) AS Thalassiosiraceae_kb2,
  coalesce(Thalassiosiraceae.nb1sum, 0) AS Thalassiosiraceae_nb1,
  coalesce(Thalassiosiraceae.nb2sum, 0) AS Thalassiosiraceae_nb2,
  coalesce(Trichocomaceae.kb1sum, 0) AS Trichocomaceae_kb1,
  coalesce(Trichocomaceae.kb2sum, 0) AS Trichocomaceae_kb2,
  coalesce(Trichocomaceae.nb1sum, 0) AS Trichocomaceae_nb1,
  coalesce(Trichocomaceae.nb2sum, 0) AS Trichocomaceae_nb2,
  coalesce(Vibrionaceae.kb1sum, 0) AS Vibrionaceae_kb1,
  coalesce(Vibrionaceae.kb2sum, 0) AS Vibrionaceae_kb2,
  coalesce(Vibrionaceae.nb1sum, 0) AS Vibrionaceae_nb1,
  coalesce(Vibrionaceae.nb2sum, 0) AS Vibrionaceae_nb2,
  coalesce(Xanthobacteraceae.kb1sum, 0) AS Xanthobacteraceae_kb1,
  coalesce(Xanthobacteraceae.kb2sum, 0) AS Xanthobacteraceae_kb2,
  coalesce(Xanthobacteraceae.nb1sum, 0) AS Xanthobacteraceae_nb1,
  coalesce(Xanthobacteraceae.nb2sum, 0) AS Xanthobacteraceae_nb2
FROM
  ( SELECT DISTINCT seedname FROM barcelona_family_seed_samples_cdnas ) a LEFT JOIN
  barcelona_family_seed_samples_cdnas Aerococcaceae ON
  a.seedname = Aerococcaceae.seedname AND Aerococcaceae.family = 'Aerococcaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Alteromonadaceae ON
  a.seedname = Alteromonadaceae.seedname AND Alteromonadaceae.family = 'Alteromonadaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Branchiostomidae ON
  a.seedname = Branchiostomidae.seedname AND Branchiostomidae.family = 'Branchiostomidae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Burkholderiaceae ON
  a.seedname = Burkholderiaceae.seedname AND Burkholderiaceae.family = 'Burkholderiaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Chaetomiaceae ON
  a.seedname = Chaetomiaceae.seedname AND Chaetomiaceae.family = 'Chaetomiaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Cryomorphaceae ON
  a.seedname = Cryomorphaceae.seedname AND Cryomorphaceae.family = 'Cryomorphaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Edwardsiidae ON
  a.seedname = Edwardsiidae.seedname AND Edwardsiidae.family = 'Edwardsiidae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Enterobacteriaceae ON
  a.seedname = Enterobacteriaceae.seedname AND Enterobacteriaceae.family = 'Enterobacteriaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Equidae ON
  a.seedname = Equidae.seedname AND Equidae.family = 'Equidae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Fabaceae ON
  a.seedname = Fabaceae.seedname AND Fabaceae.family = 'Fabaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Flavobacteriaceae ON
  a.seedname = Flavobacteriaceae.seedname AND Flavobacteriaceae.family = 'Flavobacteriaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Halomonadaceae ON
  a.seedname = Halomonadaceae.seedname AND Halomonadaceae.family = 'Halomonadaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Legionellaceae ON
  a.seedname = Legionellaceae.seedname AND Legionellaceae.family = 'Legionellaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Microviridae ON
  a.seedname = Microviridae.seedname AND Microviridae.family = 'Microviridae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Mycosphaerellaceae ON
  a.seedname = Mycosphaerellaceae.seedname AND Mycosphaerellaceae.family = 'Mycosphaerellaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Nitrosopumilaceae ON
  a.seedname = Nitrosopumilaceae.seedname AND Nitrosopumilaceae.family = 'Nitrosopumilaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Oceanospirillaceae ON
  a.seedname = Oceanospirillaceae.seedname AND Oceanospirillaceae.family = 'Oceanospirillaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Pediculidae ON
  a.seedname = Pediculidae.seedname AND Pediculidae.family = 'Pediculidae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Piscirickettsiaceae ON
  a.seedname = Piscirickettsiaceae.seedname AND Piscirickettsiaceae.family = 'Piscirickettsiaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Poaceae ON
  a.seedname = Poaceae.seedname AND Poaceae.family = 'Poaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Podoviridae ON
  a.seedname = Podoviridae.seedname AND Podoviridae.family = 'Podoviridae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Pseudoalteromonadaceae ON
  a.seedname = Pseudoalteromonadaceae.seedname AND Pseudoalteromonadaceae.family = 'Pseudoalteromonadaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Rhodobacteraceae ON
  a.seedname = Rhodobacteraceae.seedname AND Rhodobacteraceae.family = 'Rhodobacteraceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Rhodospirillaceae ON
  a.seedname = Rhodospirillaceae.seedname AND Rhodospirillaceae.family = 'Rhodospirillaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Shewanellaceae ON
  a.seedname = Shewanellaceae.seedname AND Shewanellaceae.family = 'Shewanellaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Siphoviridae ON
  a.seedname = Siphoviridae.seedname AND Siphoviridae.family = 'Siphoviridae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Thalassiosiraceae ON
  a.seedname = Thalassiosiraceae.seedname AND Thalassiosiraceae.family = 'Thalassiosiraceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Trichocomaceae ON
  a.seedname = Trichocomaceae.seedname AND Trichocomaceae.family = 'Trichocomaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Vibrionaceae ON
  a.seedname = Vibrionaceae.seedname AND Vibrionaceae.family = 'Vibrionaceae' LEFT JOIN
  barcelona_family_seed_samples_cdnas Xanthobacteraceae ON
  a.seedname = Xanthobacteraceae.seedname AND Xanthobacteraceae.family = 'Xanthobacteraceae'
;
