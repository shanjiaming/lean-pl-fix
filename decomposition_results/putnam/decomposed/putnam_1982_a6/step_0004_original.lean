theorem h₃ (h :  ∀ (b : ℕ → ℕ) (x : ℕ → ℝ),    BijOn b (Ici 1) (Ici 1) →      StrictAntiOn (fun n => |x n|) (Ici 1) →        Tendsto (fun n => ↑|↑(b n) - ↑n| * |x n|) atTop (𝓝 0) →          Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x k) atTop (𝓝 1) →            Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x (b k)) atTop (𝓝 1)) : Tendsto (fun n => ↑|↑n + 1 - ↑n| * |if n = 1 then 2 else if n = 2 then -1 else 0|) atTop (𝓝 0) :=
  by
  have h₄ :
    ∀ n : ℕ,
      (n : ℤ) ≥ 1 →
        |(n + 1 : ℤ) - (n : ℤ)| * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| =
          (1 : ℝ) * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| := by sorry
  have h₅ :
    ∀ n : ℕ,
      (n : ℤ) ≥ 1 →
        (1 : ℝ) * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| =
          |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| := by sorry
  have h₆ :
    ∀ n : ℕ,
      (n : ℤ) ≥ 1 →
        |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| =
          if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (1 : ℝ) else (0 : ℝ) := by sorry
  have h₇ :
    Tendsto
      (fun n : ℕ => |(n + 1 : ℤ) - (n : ℤ)| * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)|)
      atTop (𝓝 0) := by sorry
  exact h₇