theorem sum_of_coefficients :
(add_vec (smul α v2) (smul β v3) = v1) → (α + β = 18) := by
  intro h
  have h₁ : -2 * α + 6 * β = 52 := by
    have h₂ := congr_arg (fun x => x[0])h
    -- Simplify the expression to extract the first component of the array equation
    simp [add_vec, smul, v1, v2, v3, Array.get, Array.map, Array.zip, Fin.val_zero] at h₂ ⊢
    <;> ring_nf at h₂ ⊢ <;> linarith
  
  have h₂ : 4 * α + (-7) * β = -49 := by
    have h₃ := congr_arg (fun x => x[1]) h
    -- Simplify the expression to extract the second component of the array equation
    simp [add_vec, smul, v1, v2, v3, Array.get, Array.map, Array.zip] at h₃ ⊢
    <;> ring_nf at h₃ ⊢ <;> linarith
  
  have h₃ : 5 * β = 55 := by
    have h₄ : -4 * α + 12 * β = 104 := by
      -- Multiply the first equation by 2 to eliminate α
      have h₄₁ : -2 * α + 6 * β = 52 := h₁
      have h₄₂ : -4 * α + 12 * β = 104 := by linarith
      exact h₄₂
    -- Add the new equation to the second equation to eliminate α
    have h₅ : 5 * β = 55 := by linarith
    exact h₅
  
  have h₄ : β = 11 := by
    have h₄₁ : 5 * β = 55 := h₃
    have h₄₂ : β = 11 := by linarith
    exact h₄₂
  
  have h₅ : α = 7 := by
    have h₅₁ : -2 * α + 6 * β = 52 := h₁
    have h₅₂ : β = 11 := h₄
    rw [h₅₂] at h₅₁
    linarith
  
  have h₆ : α + β = 18 := by
    have h₆₁ : α = 7 := h₅
    have h₆₂ : β = 11 := h₄
    rw [h₆₁, h₆₂]
    <;> norm_num
  
  exact h₆