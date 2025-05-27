theorem putnam_2006_a5
(n : ℕ)
(theta : ℝ)
(a : Set.Icc 1 n → ℝ)
(nodd : Odd n)
(thetairr : Irrational (theta / Real.pi))
(ha : ∀ k : Set.Icc 1 n, a k = Real.tan (theta + (k * Real.pi) / n))
: (∑ k : Set.Icc 1 n, a k) / (∏ k : Set.Icc 1 n, a k) = ((fun n : ℕ => if (n ≡ 1 [MOD 4]) then n else -n) : ℕ → ℤ ) n := by