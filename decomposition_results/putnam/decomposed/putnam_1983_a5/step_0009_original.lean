theorem h_final (h_main : ∃ α > 0, ∀ n > 0, Even (⌊α ^ n⌋ - ↑n)) : (∃ α > 0, ∀ n > 0, Even (⌊α ^ n⌋ - ↑n)) ↔ True :=
  by
  constructor
  · intro h
    trivial
  · intro h
    exact h_main