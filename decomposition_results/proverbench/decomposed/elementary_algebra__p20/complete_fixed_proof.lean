theorem unique_rational_function_condition :
  (f 1 = 2) ∧ (∀ x y : ℚ, f (x * y) = f x * f y - f (x + y) + 1) ↔ (∀ x : ℚ, f x = x + 1):=
  by
  have h_forward : (f 1 = 2) ∧ (∀ x y : ℚ, f (x * y) = f x * f y - f (x + y) + 1) → (∀ x : ℚ, f x = x + 1):=
    by
    --  intro h
    have h₁ : f 1 = 2 := h.1
    have h₂ : ∀ x y : ℚ, f (x * y) = f x * f y - f (x + y) + 1 := h.2
    have h₃ : f 0 = 1:= by
      have h₄ := h₂ 0 0
      have h₅ := h₂ 1 0
      have h₆ := h₂ 0 1
      have h₇ := h₂ 1 1
      have h₈ := h₂ (-1) 1
      have h₉ := h₂ 1 (-1)
      have h₁₀ := h₂ 2 0
      have h₁₁ := h₂ 0 2
      --  --  --  --  norm_num [h₁] at h₄ h₅ h₆ h₇ h₈ h₉ h₁₀ h₁₁ ⊢ <;> (try norm_num at *) <;> (try linarith) <;> (try nlinarith) <;>
      --    (try ring_nf at * <;> nlinarith)
      hole
    have h₄ : ∀ (x : ℚ), f (x + 1) = f x + 1:= by
      --  intro x
      have h₅ := h₂ x 1
      have h₆ := h₂ 1 x
      have h₇ := h₂ x 0
      have h₈ := h₂ 0 x
      have h₉ := h₂ (x + 1) 0
      have h₁₀ := h₂ 0 (x + 1)
      have h₁₁ := h₂ (x + 1) 1
      have h₁₂ := h₂ 1 (x + 1)
      --  --  --  norm_num [h₁, h₃] at h₅ h₆ h₇ h₈ h₉ h₁₀ h₁₁ h₁₂ ⊢ <;> (try ring_nf at * <;> nlinarith) <;> (try linarith) <;>
      --    (try nlinarith)
      hole
    have h₅ : ∀ (n : ℤ) (x : ℚ), f (x + n) = f x + n:= by
      --  intro n x
      --  induction n with
      --  | ofNat n =>
      --    induction n with
      --    | zero => norm_num [h₃, h₄] <;> linarith
      --    | succ n ih =>
      --      have h₆ := h₄ (x + n)
      --      have h₇ := h₄ (x + ↑n + 1)
      --      simp [add_assoc, add_comm, add_left_comm] at * <;> simp_all [Int.ofNat_add, Int.ofNat_one, add_assoc] <;> linarith
      --  | negSucc n =>
      --    induction n with
      --    | zero =>
      --      have h₆ := h₄ (x - 1)
      --      have h₇ := h₄ x
      --      simp [add_assoc, add_comm, add_left_comm] at * <;> simp_all [Int.ofNat_add, Int.ofNat_one, add_assoc] <;> linarith
      --    | succ n ih =>
      --      have h₆ := h₄ (x + (-↑n - 1))
      --      have h₇ := h₄ (x + (-↑n - 1 + 1))
      --      have h₈ := h₄ (x + (-↑n - 1 - 1))
      --      simp [add_assoc, add_comm, add_left_comm] at * <;> simp_all [Int.ofNat_add, Int.ofNat_one, add_assoc] <;> linarith
      hole
    have h₆ : ∀ (x : ℚ), f x = x + 1:= by
      --  intro x
      have h₇ : f x = x + 1:= by
        have h₈ := h₂ x 0
        have h₉ := h₂ 0 x
        have h₁₀ := h₂ x 1
        have h₁₁ := h₂ 1 x
        have h₁₂ := h₂ x (-1)
        have h₁₃ := h₂ (-1) x
        have h₁₄ := h₂ (x + 1) 0
        have h₁₅ := h₂ 0 (x + 1)
        have h₁₆ := h₂ (x - 1) 0
        have h₁₇ := h₂ 0 (x - 1)
        have h₁₈ := h₄ x
        have h₁₉ := h₄ (-1)
        have h₂₀ := h₅ 1 x
        have h₂₁ := h₅ (-1) x
        have h₂₂ := h₅ 0 x
        have h₂₃ := h₅ 1 0
        have h₂₄ := h₅ (-1) 0
        have h₂₅ := h₅ 0 (-1)
        have h₂₆ := h₅ 1 1
        have h₂₇ := h₅ (-1) (-1)
        have h₂₈ := h₅ 2 0
        have h₂₉ := h₅ 0 2
        have h₃₀ := h₅ 2 1
        have h₃₁ := h₅ 1 2
        have h₃₂ := h₅ 2 (-1)
        have h₃₃ := h₅ (-1) 2
        have h₃₄ := h₅ 3 0
        have h₃₅ := h₅ 0 3
        have h₃₆ := h₅ 3 1
        have h₃₇ := h₅ 1 3
        have h₃₈ := h₅ 3 (-1)
        have h₃₉ := h₅ (-1) 3
        --  --  norm_num [h₁, h₃] at * <;> (try ring_nf at * <;> nlinarith) <;> (try linarith) <;> (try nlinarith)
        linarith
      --  exact h₇
      hole
    --  exact h₆
    hole
  have h_backward : (∀ x : ℚ, f x = x + 1) → (f 1 = 2) ∧ (∀ x y : ℚ, f (x * y) = f x * f y - f (x + y) + 1):=
    by
    --  intro hf
    have h1 : f 1 = 2:= by
      have h₂ := hf 1
      --  --  norm_num at h₂ ⊢ <;> linarith
      hole
    have h2 : ∀ x y : ℚ, f (x * y) = f x * f y - f (x + y) + 1:=
      by
      --  intro x y
      have h₃ := hf (x * y)
      have h₄ := hf x
      have h₅ := hf y
      have h₆ := hf (x + y)
      have h₇ := hf 0
      --  --  ring_nf at h₃ h₄ h₅ h₆ h₇ ⊢ <;> nlinarith
      hole
    --  exact ⟨h1, h2⟩
    hole
  have h_main : (f 1 = 2) ∧ (∀ x y : ℚ, f (x * y) = f x * f y - f (x + y) + 1) ↔ (∀ x : ℚ, f x = x + 1):=
    by
    --  constructor
    --  · intro h
    --    exact h_forward h
    --  · intro h
    --    exact h_backward h
    hole
  --  exact h_main
  hole