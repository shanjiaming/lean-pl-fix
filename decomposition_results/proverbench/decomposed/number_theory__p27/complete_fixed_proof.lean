theorem no_division {x y k m n : PNat} (h : ∃ z : PNat, (x : ℕ) ^ (m : ℕ) + (y : ℕ) ^ (n : ℕ) = z) :
  ¬((4 * k * x * y - 1) ∣ z):= by
  --  obtain ⟨z, hz⟩ := h
  have h₁ : (4 * k * x * y : ℕ) ≥ 4:= by
    have h₂ : (k : ℕ) ≥ 1 := k.2
    have h₃ : (x : ℕ) ≥ 1 := x.2
    have h₄ : (y : ℕ) ≥ 1 := y.2
    --  calc
    --    (4 * k * x * y : ℕ) = 4 * (k : ℕ) * (x : ℕ) * (y : ℕ) := by ring
    --    _ ≥ 4 * 1 * 1 * 1 := by gcongr <;> simp_all [PNat]
    --    _ = 4 := by norm_num
    hole
  have h₂ : (4 * k * x * y - 1 : ℕ) ≥ 3:= by -- omega
    hole
  have h₃ : (z : ℕ) = (x : ℕ) ^ (m : ℕ) + (y : ℕ) ^ (n : ℕ):= by -- exact_mod_cast hz
    hole
  have h₄ : (z : ℕ) ≥ 2:= by
    --  rw [h₃]
    have h₅ : (x : ℕ) ≥ 1 := x.2
    have h₆ : (y : ℕ) ≥ 1 := y.2
    have h₇ : (m : ℕ) ≥ 1 := m.2
    have h₈ : (n : ℕ) ≥ 1 := n.2
    have h₉ : (x : ℕ) ^ (m : ℕ) ≥ 1:= by -- apply Nat.one_le_pow <;> simp_all [PNat]
      hole
    have h₁₀ : (y : ℕ) ^ (n : ℕ) ≥ 1:= by -- apply Nat.one_le_pow <;> simp_all [PNat]
      hole
    --  omega
    hole
  by_contra h₅
  have h₆ : (4 * k * x * y - 1 : ℕ) ∣ (z : ℕ):= by -- assumption_mod_cast
    hole
  have h₇ : False:= by -- sorry
    hole
  contradiction
  hole