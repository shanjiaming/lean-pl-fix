/-- f has a global minimum at (0,0) -/
lemma f_global_minimum :
  IsMinOn (fun p => f p.1 p.2) Set.univ (0, 0) :=