theorem h₈ (h :  ∀ (b : ℕ → ℕ) (x : ℕ → ℝ),    BijOn b (Ici 1) (Ici 1) →      StrictAntiOn (fun n => |x n|) (Ici 1) →        Tendsto (fun n => ↑|↑(b n) - ↑n| * |x n|) atTop (𝓝 0) →          Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x k) atTop (𝓝 1) →            Tendsto (fun n => ∑ k ∈ Finset.Icc 1 n, x (b k)) atTop (𝓝 1)) (h₄ :  ∀ (n : ℕ),    ↑n ≥ 1 →      ↑|↑n + 1 - ↑n| * |if n = 1 then 2 else if n = 2 then -1 else 0| =        1 * |if n = 1 then 2 else if n = 2 then -1 else 0|) (h₅ :  ∀ (n : ℕ),    ↑n ≥ 1 → 1 * |if n = 1 then 2 else if n = 2 then -1 else 0| = |if n = 1 then 2 else if n = 2 then -1 else 0|) (h₆ : ∀ (n : ℕ), ↑n ≥ 1 → |if n = 1 then 2 else if n = 2 then -1 else 0| = if n = 1 then 2 else if n = 2 then 1 else 0) : ∀ n ≥ 3, ↑|↑n + 1 - ↑n| * |if n = 1 then 2 else if n = 2 then -1 else 0| = 0 :=
  by
  intro n hn
  have h₉ : (n : ℕ) ≥ 3 := hn
  have h₁₀ : (n : ℤ) ≥ 1 := by sorry
  have h₁₁ :
    |(n + 1 : ℤ) - (n : ℤ)| * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| =
      (1 : ℝ) * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| := by sorry
  have h₁₂ :
    (1 : ℝ) * |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| =
      |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| := by sorry
  have h₁₃ :
    |(if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (-1 : ℝ) else 0)| =
      if (n : ℕ) = 1 then (2 : ℝ) else if (n : ℕ) = 2 then (1 : ℝ) else (0 : ℝ) := by sorry
  have h₁₄ : (n : ℕ) ≠ 1 := by sorry
  have h₁₅ : (n : ℕ) ≠ 2 := by sorry
  simp [h₁₁, h₁₂, h₁₃, h₁₄, h₁₅] <;> norm_num <;> simp_all [abs_of_nonneg, abs_of_nonpos, sub_eq_add_neg]