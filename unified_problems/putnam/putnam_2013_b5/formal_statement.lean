theorem putnam_2013_b5
  (n : ℕ) (hn : n ≥ 1)
  (k : Set.Icc 1 n)
  (fiter : (Set.Icc 1 n → Set.Icc 1 n) → Prop)
  (hfiter : ∀ f, fiter f ↔ ∀ x : Set.Icc 1 n, ∃ j : ℕ, f^[j] x ≤ k) :
  {f | fiter f}.encard = k * n ^ (n - 1) := by