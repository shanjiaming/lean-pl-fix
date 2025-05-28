theorem h₂ (r : ℕ → ℝ) (S : Set ℝ) (rpos : ∀ (n : ℕ), r n > 0) (rlim : Tendsto r atTop (𝓝 0)) (hS : S = {x | ∃ i, (∀ (j k : Fin 1994), j < k → i j < i k) ∧ x = ∑ j, r (i j)}) (a b : ℝ) (hab : a < b) : ∃ c d, a ≤ c ∧ c < d ∧ d ≤ b ∧ Set.Ioo c d ∩ S = ∅ := by
  --  --  --  --  use a, a <;> simp_all [hS, Set.ext_iff, Set.Ioo, Set.mem_inter_iff] <;> (try norm_num) <;> (try linarith) <;>
  --        (try {aesop
  --          }) <;>
  --      (try {norm_num at * <;> aesop
  --        }) <;>
  --    (try {norm_num at * <;> linarith
  --      })
  hole