theorem h₁ (p : ℕ) (hp : Nat.Prime p) (h : ∃ x y, x ^ 2 - (↑p : ℤ) * y ^ 2 = -1) : p = 2 ∨ p % 4 = 1 := by
  by_contra h₂
  have h₃ : p ≠ 2 := by sorry
  have h₄ : p % 4 ≠ 1 := by sorry
  have h₅ : p % 4 = 3 := by sorry
  rcases h with ⟨x, y, h₁⟩
  have h₂ := congr_arg (fun x => x % 4) h₁
  simp at h₂
  have h₃ : x % 4 = 0 ∨ x % 4 = 1 ∨ x % 4 = 2 ∨ x % 4 = 3 := by sorry
  have h₄ : y % 4 = 0 ∨ y % 4 = 1 ∨ y % 4 = 2 ∨ y % 4 = 3 := by sorry
  rcases h₃ with (h₃ | h₃ | h₃ | h₃) <;> rcases h₄ with (h₄ | h₄ | h₄ | h₄) <;>
      simp [h₃, h₄, pow_two, Int.mul_emod, Int.sub_emod, Int.add_emod, Int.emod_emod, h₅] at h₂ ⊢ <;>
    omega