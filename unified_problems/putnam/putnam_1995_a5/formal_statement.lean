theorem putnam_1995_a5 :
  ((True) : Prop ) ↔
  (∀ (n : ℕ) (x : Fin n → (ℝ → ℝ)) (a : Fin n → Fin n → ℝ),
    (0 < n) →
    (∀ i, Differentiable ℝ (x i)) →
    (∀ i j, a i j > 0) →
    (∀ t i, (deriv (x i)) t = ∑ j : Fin n, (a i j) * ((x j) t)) →
    (∀ i, Tendsto (x i) atTop (𝓝 0)) →
    ¬(∀ b : Fin n → ℝ, (∀ t : ℝ, ∑ i : Fin n, (b i) * ((x i) t) = 0) →
      (∀ i, b i = 0))) :=
  by