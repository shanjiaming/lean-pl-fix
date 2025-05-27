theorem h₆ (b✝ b : ℕ → ℝ) (h_pos : ∀ (n : ℕ), b n > 0) (h_lim h₂ h₄ : Tendsto b atTop (𝓝 (1 / 2))) (h₅ : 1 / 2 - 1 / 4 < 1 / 2 + 1 / 4) : b ⁻¹' Set.Ioo (1 / 2 - 1 / 4) (1 / 2 + 1 / 4) ∈ atTop :=
  by
  apply h₄ (IsOpen.mem_nhds isOpen_Ioo)
  norm_num [Set.mem_Ioo]
  hole