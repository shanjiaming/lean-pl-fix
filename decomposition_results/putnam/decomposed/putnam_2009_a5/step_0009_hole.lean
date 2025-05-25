theorem h_rev (h_main : ¬∃ G x x_1, ∏ g, orderOf g = 2 ^ 2009) (h_imp : (∃ G x x_1, ∏ g, orderOf g = 2 ^ 2009) → False) : False → ∃ G x x_1, ∏ g, orderOf g = 2 ^ 2009 :=
  by
  intro h
  exfalso
  exact h
  hole