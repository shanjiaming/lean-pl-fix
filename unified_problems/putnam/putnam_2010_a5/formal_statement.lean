theorem putnam_2010_a5
    (G : Type*) [Group G]
    (i : G ↪ (Fin 3 → ℝ))
    (h : ∀ a b, (i a) ×₃ (i b) = i (a * b) ∨ (i a) ×₃ (i b) = 0)
    (a b : G) :
    (i a) ×₃ (i b) = 0 :=
  by