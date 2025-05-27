theorem putnam_1991_b1
  (m S : ℤ → ℤ)
  (A : ℤ)
  (a : ℕ → ℤ)
  (hm : ∀ n, 0 ≤ n → (m n) ^ 2 ≤ n ∧ (∀ m' : ℤ, m' ^ 2 ≤ n → m' ≤ m n))
  (hS : ∀ n, 0 ≤ n → S n = n - (m n) ^ 2)
  (ha : a 0 = A ∧ (∀ k, a (k + 1) = a k + S (a k)))
  (hA : A > 0) :
  (∃ (K : ℕ) (c : ℕ), ∀ k ≥ K, a k = c) ↔ A ∈ (({A : ℤ | ∃ x > 0, A = x ^ 2}) : Set ℤ ) := by