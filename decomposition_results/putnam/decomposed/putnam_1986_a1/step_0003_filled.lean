theorem h₂ (S : Set ℝ) (f : ℝ → ℝ) (hS : S = {x | x ^ 4 + 36 ≤ 13 * x ^ 2}) (hf : f = fun x => x ^ 3 - 3 * x) : 3 ∈ {x | x ^ 4 + 36 ≤ 13 * x ^ 2} := by -- norm_num [Set.mem_setOf_eq]
  norm_num