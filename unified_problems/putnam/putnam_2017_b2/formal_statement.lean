theorem putnam_2017_b2
  (S : ℤ → ℕ → ℤ)
  (p : ℤ → ℕ → Prop)
  (q : ℤ → Prop)
  (hS : S = fun (a : ℤ) k ↦ ∑ i in Finset.range k, (a + i))
  (hp : ∀ N k, p N k ↔ ∃ a > 0, S a k = N)
  (hq : ∀ N, q N ↔ p N 2017 ∧ ∀ k : ℕ, k > 1 → k ≠ 2017 → ¬p N k) :
  IsLeast {a : ℤ | q (S a 2017)} ((16) : ℕ ) := by