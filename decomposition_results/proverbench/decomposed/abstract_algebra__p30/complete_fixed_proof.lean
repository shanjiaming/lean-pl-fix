theorem scalar_multiplication (n : ℕ) (a b : ZMod 3) : n • (a, b) = (n • a, n • b) := by
  admit

lemma multiple_of_3 (n : ℕ) (a : ZMod 3) : (a ≠ 0 → (n • a = 0 ↔ n % 3 = 0)) := by
  intro h_a_ne_zero
  have h₁ : a ≠ 0 := h_a_ne_zero
  have h₂ : (n • a = 0 ↔ n % 3 = 0) := by
    have h₃ : a = 1 ∨ a = 2 := by
      admit
    admit
  exact h₂

theorem characteristic_Z3xZ3 : evalChar = 3 := by
  have h_main : ringChar (ZMod 3 × ZMod 3) = 3 := by
    admit
  
  have h_final : evalChar = 3 := by
    admit
  
  exact h_final