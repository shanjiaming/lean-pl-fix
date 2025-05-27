theorem putnam_2016_a6
  (p : ℝ → Prop)
  (hp : ∀ c, p c ↔
          ∀ P : Polynomial ℝ, P.degree = 3 →
          (∃ x ∈ Icc 0 1, P.eval x = 0) →
          ∫ x in (0)..1, |P.eval x| ≤ c * (sSup {y | ∃ x ∈ Icc 0 1, y = |P.eval x|})) :
  IsLeast p ((5 / 6) : ℝ ) := by