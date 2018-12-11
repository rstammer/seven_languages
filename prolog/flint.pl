links_von(flintstones, superman).
links_von(superman, programmier_sprachen).
links_von(programmier_sprachen, pascal).
links_von(wickie, anhalter).
links_von(anhalter, faust).
links_von(snoopy, kleine_freie_maenner).

steht_neben(Buch1, Buch2) :- links_von(Buch1, Buch2).
steht_neben(Buch1, Buch2) :- links_von(Buch1, Buch3),
steht_neben(Buch3, Buch2).
