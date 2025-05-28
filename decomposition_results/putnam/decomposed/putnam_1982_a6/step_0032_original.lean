theorem h₅ (h :  ∀ (b : ℕ → ℕ) (x : ℕ → ℝ),    BijOn b (Ici 1) (Ici 1) →      StrictAntiOn (fun n => |x n|) (Ici 1) →        Tendsto (fun n => ↑|↑(b n) - ↑n| * |x n|) atTop (𝓝 0) →          Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x k) atTop (𝓝 1) →            Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x (b k)) atTop (𝓝 1)) (h₄ : Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, if k = 1 then 2 else if k = 2 then -1 else 0) atTop (𝓝 1)) : Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, if k = 1 then 2 else if k = 2 then -1 else 0) atTop (𝓝 1) :=
  by
  have h₆ :
    ∀ n : ℕ, n ≥ 2 → ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) = (1 : ℝ) := by sorry
  have h₉ :
    Tendsto (fun n : ℕ => ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0)) atTop
      (𝓝 1) := by sorry
  exact h₉