theorem putnam_1998_b6
: ∀ a b c : ℤ, ∃ n : ℤ, n > 0 ∧ ¬(∃ k : ℤ, k = Real.sqrt (n^3 + a * n^2 + b * n + c)) := by
  intro a b c
  have h_main : ∃ (n : ℤ), n > 0 ∧ ¬(∃ (k : ℤ), (k : ℝ) = Real.sqrt (n^3 + a * n^2 + b * n + c)) := by
    use 4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ)
    constructor
    · 
      norm_num [abs_nonneg, le_max_left, le_max_right, le_refl, le_trans]
      <;>
      positivity
    · 
      intro h
      rcases h with ⟨k, hk⟩
      have h₁ : (k : ℝ) = Real.sqrt ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 + a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 + b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) + c) := by
        admit
      have h₂ : (k : ℝ) ^ 2 = ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) : ℝ) ^ 3 + a * ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) : ℝ) ^ 2 + b * ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) : ℝ) + c := by
        rw [h₁]
        have h₃ : 0 ≤ Real.sqrt ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 + a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 + b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) + c) := by
          admit
        admit
      have h₃ : (k : ℤ) ^ 2 = (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 + a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 + b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) + c := by
        admit
      have h₄ : False := by
        have h₅ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ≥ 4 := by
          have h₆ : (max (max (abs a) (abs b)) (abs c) : ℤ) ≥ 0 := by
            admit
          have h₇ : (2 : ℤ) * (max (max (abs a) (abs b)) (abs c) : ℤ) ≥ 0 := by
            admit
          admit
        have h₆ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 ≥ 16 := by
          admit
        have h₇ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 3 ≥ 64 := by
          admit
        have h₈ : (a : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 := by
          have h₉ : (a : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) := by
            have h₁₀ : (a : ℤ) ≥ -((abs a : ℤ)) := by
              admit
            have h₁₁ : (abs a : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by
              admit
            admit
          admit
        have h₉ : (b : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) := by
          have h₁₀ : (b : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) := by
            have h₁₁ : (b : ℤ) ≥ -((abs b : ℤ)) := by
              admit
            have h₁₂ : (abs b : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by
              admit
            admit
          admit
        have h₁₀ : (c : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) := by
          have h₁₁ : (c : ℤ) ≥ -((abs c : ℤ)) := by
            admit
          have h₁₂ : (abs c : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by
            admit
          admit
        have h₁₁ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 3 + a * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 + b * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + c > (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 := by
          have h₁₂ : (max (max (abs a) (abs b)) (abs c) : ℤ) ≤ (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) / 2 := by
            admit
          admit
        have h₁₂ : (k : ℤ) ^ 2 > (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 := by
          admit
        have h₁₃ : (k : ℤ) ≤ (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1 := by
          admit
        have h₁₄ : (k : ℤ) ≥ -((4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1) := by
          admit
        have h₁₅ : (k : ℤ) ≤ (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1 := by
          admit
        have h₁₆ : (k : ℤ) ≥ -((4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1) := by
          admit
        have h₁₇ : False := by
          admit
        admit
      admit
  rcases h_main with ⟨n, hn, hn'⟩
  refine' ⟨n, hn, _⟩
  intro h
  rcases h with ⟨k, hk⟩
  have h₁ : (k : ℝ) = Real.sqrt (n ^ 3 + a * n ^ 2 + b * n + c) := by
    admit
  have h₂ : ¬(∃ (k : ℤ), (k : ℝ) = Real.sqrt (n ^ 3 + a * n ^ 2 + b * n + c)) := by
    admit
  admit