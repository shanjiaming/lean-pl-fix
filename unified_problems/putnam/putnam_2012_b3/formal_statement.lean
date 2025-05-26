theorem putnam_2012_b3
(nmatchupsgames nmatchupsall : (n : ℕ) → (Fin (2 * n - 1) → (Fin (2 * n) → Fin (2 * n))) → Prop)
(nmatchupswins nmatchupswinschoices: (n : ℕ) → (Fin (2 * n - 1) → (Fin (2 * n) → Fin (2 * n))) → (Fin (2 * n - 1) → (Fin (2 * n) → Bool)) → Prop)
(hnmatchupsall : ∀ n matchups, nmatchupsall n matchups ↔ ∀ t1 t2, t1 ≠ t2 → (∃ d, matchups d t1 = t2))
(hnmatchupsgames : ∀ n matchups, nmatchupsgames n matchups ↔ ∀ d, ∀ t, matchups d t ≠ t ∧ matchups d (matchups d t) = t)
(hnmatchupswins : ∀ n matchups wins, nmatchupswins n matchups wins ↔ ∀ d t, wins d t = !(wins d (matchups d t)))
(hnmatchupswinschoices : ∀ n matchups wins, nmatchupswinschoices n matchups wins ↔ ∃ choices, (∀ d, wins d (choices d)) ∧ Function.Injective choices) :
  (∀ n ≥ 1, ∀ matchups wins,
    (nmatchupsgames n matchups ∧ nmatchupsall n matchups ∧ nmatchupswins n matchups wins) →
    nmatchupswinschoices n matchups wins)
  ↔ ((True) : Prop ) := by