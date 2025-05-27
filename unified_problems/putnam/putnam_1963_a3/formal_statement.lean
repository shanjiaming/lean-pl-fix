theorem putnam_1963_a3
    (P : ℕ → (ℝ → ℝ) → (ℝ → ℝ))
    (hP : P 0 = id ∧ ∀ i y, P (i + 1) y = P i (fun x ↦ x * deriv y x - i * y x))
    (n : ℕ)
    (hn : 0 < n)
    (f y : ℝ → ℝ)
    (hf : ContinuousOn f (Ici 1))
    (hy : ContDiffOn ℝ n y (Ici 1)) :
    (∀ i < n, deriv^[i] y 1 = 0) ∧ (Ici 1).EqOn (P n y) f ↔
    ∀ x ≥ 1, y x = ∫ t in (1 : ℝ)..x, ((fun (f : ℝ → ℝ) (n : ℕ) (x : ℝ) (t : ℝ) ↦ (x - t) ^ (n - 1) * (f t) / ((n - 1)! * t ^ n)) : (ℝ → ℝ) → ℕ → ℝ → ℝ → ℝ ) f n x t :=
  by