theorem h_imp (h_main : ¬∃ G x x_1, ∏ g, orderOf g = 2 ^ 2009) : (∃ G x x_1, ∏ g, orderOf g = 2 ^ 2009) → False :=
  by
  intro h
  exact h_main h