theorem cos_pi_rational_values (p q : ℤ) (h : ∃ r : ℚ, cos (p * π / q) = r) :
  ∃ r : ℚ, r ∈ ({0, 1, -1, 1 / 2, -1 / 2} : Set ℚ) ∧ cos (p * π / q) = r:=
  by
  by_cases hq : q = 0
  ·
    have h₁ : cos (p * π / q) = (1 : ℝ):=
      by
      have h₂ : (q : ℝ) = 0:= by -- exact_mod_cast hq
        linarith
      have h₃ : (p * π / q : ℝ) = 0:= by
        --  rw [div_eq_mul_inv]
        --  simp [h₂, mul_zero] <;> ring_nf <;> field_simp [h₂] <;> ring_nf
        hole
      --  rw [h₃]
      --  norm_num [Real.cos_zero] <;> simp_all [Real.cos_zero]
      hole
    have h₂ : ∃ r : ℚ, r ∈ ({0, 1, -1, 1 / 2, -1 / 2} : Set ℚ) ∧ cos (p * π / q) = r:=
      by
      refine' ⟨1, _⟩
      constructor
      · norm_num [Set.mem_insert, Set.mem_singleton_iff]
      · simpa [h₁] using h₁
      hole
    exact h₂
  ·
    have h₃ : ∃ (r : ℚ), r ∈ ({0, 1, -1, 1 / 2, -1 / 2} : Set ℚ) ∧ cos (p * π / q) = r:=
      by
      obtain ⟨r, hr⟩ := h
      refine' ⟨r, _⟩
      constructor
      ·
        have h₄ : (r : ℝ) = Real.cos (p * Real.pi / q):= by -- rw [hr] <;> norm_cast
          linarith
        have h₅ : r = 0 ∨ r = 1 ∨ r = -1 ∨ r = 1 / 2 ∨ r = -1 / 2:= by -- sorry
          hole
        have h₆ : r ∈ ({0, 1, -1, 1 / 2, -1 / 2} : Set ℚ):= by
          rcases h₅ with (rfl | rfl | rfl | rfl | rfl) <;> norm_num [Set.mem_insert, Set.mem_singleton_iff] <;>
                      (try norm_num) <;>
                    (try aesop) <;>
                  (try ring_nf) <;>
                (try field_simp) <;>
              (try norm_num) <;>
            (try aesop)
          hole
        exact h₆
      · exact hr
      hole
    exact h₃
  hole