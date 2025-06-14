theorem putnam_2000_a5
  (r : ℝ)
  (z : EuclideanSpace ℝ (Fin 2))
  (p : Fin 3 → (EuclideanSpace ℝ (Fin 2)))
  (rpos : r > 0)
  (pdiff : ∀ n m, (n ≠ m) → (p n ≠ p m))
  (pint : ∀ n i, p n i = round (p n i))
  (pcirc : ∀ n, p n ∈ Metric.sphere z r) :
  ∃ n m, (n ≠ m) ∧ (dist (p n) (p m) ≥ r ^ ((1 : ℝ) / 3)) := by
  have h_main : ∃ (n m : Fin 3), n ≠ m ∧ dist (p n) (p m) ≥ r ^ ((1 : ℝ) / 3) := by
    by_cases h_r_le_one : r ≤ 1
    · 
      
      have h₁ : dist (p 0) (p 1) ≥ 1 := by
        admit
      have h₂ : (r : ℝ) ^ ((1 : ℝ) / 3) ≤ 1 := by
        admit
      have h₃ : dist (p 0) (p 1) ≥ r ^ ((1 : ℝ) / 3) := by
        admit
      refine' ⟨0, 1, by decide, _⟩
      exact h₃
    · 
      have h_r_gt_one : r > 1 := by admit
      
      have h₁ : ∃ (n m : Fin 3), n ≠ m ∧ dist (p n) (p m) ≥ r ^ ((1 : ℝ) / 3) := by
        admit
      
      admit
  
  admit