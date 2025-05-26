theorem putnam_2002_a1
(k : ℕ)
(P : ℕ → Polynomial ℝ)
(kpos : k > 0)
(Pderiv : ∀ n x, iteratedDeriv n (fun x' : ℝ => 1 / (x' ^ k - 1)) x = ((P n).eval x) / ((x ^ k - 1) ^ (n + 1)))
: ∀ n, (P n).eval 1 = ((fun k n : ℕ => (-k) ^ n * (n)!) : ℕ → ℕ → ℝ ) k n := by
  have h₁ : False := by
    sorry
  have h₂ : ∀ n, (P n).eval 1 = ((fun k n : ℕ => (-k) ^ n * (n)! : ℕ → ℕ → ℝ) k n) := by
    sorry
  sorry