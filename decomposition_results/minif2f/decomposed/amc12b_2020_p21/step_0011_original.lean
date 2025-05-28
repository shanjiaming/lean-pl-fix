theorem h₁₁ (S : Finset ℕ) (h₀ : ∀ (n : ℕ), n ∈ S ↔ 0 < n ∧ (↑n + 1000) / 70 = ↑⌊√↑n⌋) (n : ℕ) (h : 0 < n ∧ (↑n + 1000) / 70 = ↑⌊√↑n⌋) (h₁ : 0 < n) (h₂ h₄ h₆ h₈ : (↑n + 1000) / 70 = ↑⌊√↑n⌋) (h₉ : ↑⌊√↑n⌋ = (↑n + 1000) / 70) (h₁₀ : ↑⌊√↑n⌋ * 70 = ↑n + 1000) : ⌊√↑n⌋ * 70 = ↑n + 1000 := by
  norm_cast at h₁₀ ⊢ <;> (try norm_num at h₁₀ ⊢) <;> (try ring_nf at h₁₀ ⊢) <;> (try field_simp at h₁₀ ⊢) <;>
            (try norm_cast at h₁₀ ⊢) <;>
          (try linarith) <;>
        (try ring_nf at h₁₀ ⊢) <;>
      (try norm_cast at h₁₀ ⊢) <;>
    (try linarith)