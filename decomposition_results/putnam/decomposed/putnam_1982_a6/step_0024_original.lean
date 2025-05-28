theorem h₉ (h :  ∀ (b : ℕ → ℕ) (x : ℕ → ℝ),    BijOn b (Ici 1) (Ici 1) →      StrictAntiOn (fun n => |x n|) (Ici 1) →        Tendsto (fun n => ↑|↑(b n) - ↑n| * |x n|) atTop (𝓝 0) →          Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x k) atTop (𝓝 1) →            Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x (b k)) atTop (𝓝 1)) (n : ℕ) (hn h₆ : n ≥ 2) (h₈ :  (∑ k ∈ Finset.Icc 1 n, if k = 1 then 2 else if k = 2 then -1 else 0) =    ∑ k ∈ Finset.Icc 1 n, if k = 1 then 2 else if k = 2 then -1 else 0) : (∑ k ∈ Finset.Icc 1 n, if k = 1 then 2 else if k = 2 then -1 else 0) =
    ((if 1 = 1 then 2 else if 1 = 2 then -1 else 0) + if 2 = 1 then 2 else if 2 = 2 then -1 else 0) +
      ∑ k ∈ Finset.Icc 3 n, if k = 1 then 2 else if k = 2 then -1 else 0 :=
  by
  have h₁₀ :
    ∑ k in Finset.Icc 1 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) =
      (if (1 : ℕ) = 1 then (2 : ℝ) else if (1 : ℕ) = 2 then (-1 : ℝ) else 0) +
          (if (2 : ℕ) = 1 then (2 : ℝ) else if (2 : ℕ) = 2 then (-1 : ℝ) else 0) +
        ∑ k in Finset.Icc 3 n, (if k = 1 then (2 : ℝ) else if k = 2 then (-1 : ℝ) else 0) := by sorry
  exact h₁₀