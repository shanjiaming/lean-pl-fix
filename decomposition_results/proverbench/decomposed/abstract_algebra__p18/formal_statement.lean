theorem polynomial_roots_bound :
(∀ k : ℕ, k ≤ 2 * n → P.eval (2 * (Int.ofNat k)) = 1) → P.eval (-1) = 1 →
  (P - 1).roots.toFinset.card ≤ n + 1 :=