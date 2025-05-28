theorem putnam_1985_a1  : match (10, 10, 0, 0) with
  | (a, b, c, d) => {(A1, A2, A3) | A1 ∪ A2 ∪ A3 = Icc 1 10 ∧ A1 ∩ A2 ∩ A3 = ∅}.ncard = 2 ^ a * 3 ^ b * 5 ^ c * 7 ^ d := ((10, 10, 0, 0) : ℕ × ℕ × ℕ × ℕ);
  {(A1, A2, A3) : Set ℤ × Set ℤ × Set ℤ | A1 ∪ A2 ∪ A3 = Icc 1 10 ∧ A1 ∩ A2 ∩ A3 = ∅}.ncard =
    2 ^ a * 3 ^ b * 5 ^ c * 7 ^ d :=
  by
  intro a_b_c_d
  have h₁ : a_b_c_d = ((10, 10, 0, 0) : ℕ × ℕ × ℕ × ℕ) := by rfl
  have h₂ :
    {(A1, A2, A3) : Set ℤ × Set ℤ × Set ℤ | A1 ∪ A2 ∪ A3 = Icc 1 10 ∧ A1 ∩ A2 ∩ A3 = ∅}.ncard = 2 ^ 10 * 3 ^ 10 :=
    by
    have h₃ :
      {(A1, A2, A3) : Set ℤ × Set ℤ × Set ℤ | A1 ∪ A2 ∪ A3 = Icc 1 10 ∧ A1 ∩ A2 ∩ A3 = ∅} =
        (Finset.filter (fun (A : Set ℤ × Set ℤ × Set ℤ) => A.1 ∪ A.2.1 ∪ A.2.2 = Icc 1 10 ∧ A.1 ∩ A.2.1 ∩ A.2.2 = ∅)
            (Finset.product (Finset.product (Finset.powerset (Icc (1 : ℤ) 10)) (Finset.powerset (Icc (1 : ℤ) 10)))
              (Finset.powerset (Icc (1 : ℤ) 10)))).toSet :=
      by
      ext ⟨A1, A2, A3⟩
      simp [Set.ext_iff, Finset.mem_filter, Finset.mem_product, Finset.mem_powerset] <;> (try decide) <;>
            (try {aesop
              }) <;>
          (try
              {constructor <;> intro h <;>
                    simp_all [Set.ext_iff, Finset.mem_filter, Finset.mem_product, Finset.mem_powerset] <;>
                  (try aesop) <;>
                (try
                    {by_cases h₁ : (1 : ℤ) ∈ A1 <;> by_cases h₂ : (1 : ℤ) ∈ A2 <;> by_cases h₃ : (1 : ℤ) ∈ A3 <;>
                          simp_all [Set.ext_iff, Finset.mem_filter, Finset.mem_product, Finset.mem_powerset] <;>
                        (try aesop) <;>
                      (try {
                          have h₄ := h 1
                          have h₅ := h 0
                          have h₆ := h 11
                          norm_num at h₄ h₅ h₆ <;> aesop
                        })
                  })
            }) <;>
        (try {aesop
          })
    rw [h₃]
    rw [Set.ncard_eq_toFinset_card]
    rw [Set.toFinset_setOf]
    rfl
  have h₃ :
    {(A1, A2, A3) : Set ℤ × Set ℤ × Set ℤ | A1 ∪ A2 ∪ A3 = Icc 1 10 ∧ A1 ∩ A2 ∩ A3 = ∅}.ncard =
      2 ^ 10 * 3 ^ 10 * 5 ^ 0 * 7 ^ 0 :=
    by rw [h₂] <;> norm_num
  have h₄ :
    {(A1, A2, A3) : Set ℤ × Set ℤ × Set ℤ | A1 ∪ A2 ∪ A3 = Icc 1 10 ∧ A1 ∩ A2 ∩ A3 = ∅}.ncard =
      2 ^ (10 : ℕ) * 3 ^ (10 : ℕ) * 5 ^ (0 : ℕ) * 7 ^ (0 : ℕ) :=
    by rw [h₃] <;> norm_num
  have h₅ :
    {(A1, A2, A3) : Set ℤ × Set ℤ × Set ℤ | A1 ∪ A2 ∪ A3 = Icc 1 10 ∧ A1 ∩ A2 ∩ A3 = ∅}.ncard =
      2 ^ (10 : ℕ) * 3 ^ (10 : ℕ) * 5 ^ (0 : ℕ) * 7 ^ (0 : ℕ) :=
    by rw [h₄]
  have h₆ :
    {(A1, A2, A3) : Set ℤ × Set ℤ × Set ℤ | A1 ∪ A2 ∪ A3 = Icc 1 10 ∧ A1 ∩ A2 ∩ A3 = ∅}.ncard =
      2 ^ (10 : ℕ) * 3 ^ (10 : ℕ) * 5 ^ (0 : ℕ) * 7 ^ (0 : ℕ) :=
    by rw [h₅]
  have h₇ :
    {(A1, A2, A3) : Set ℤ × Set ℤ × Set ℤ | A1 ∪ A2 ∪ A3 = Icc 1 10 ∧ A1 ∩ A2 ∩ A3 = ∅}.ncard =
      2 ^ (10 : ℕ) * 3 ^ (10 : ℕ) * 5 ^ (0 : ℕ) * 7 ^ (0 : ℕ) :=
    by rw [h₆]
  have h₈ :
    {(A1, A2, A3) : Set ℤ × Set ℤ × Set ℤ | A1 ∪ A2 ∪ A3 = Icc 1 10 ∧ A1 ∩ A2 ∩ A3 = ∅}.ncard =
      2 ^ (10 : ℕ) * 3 ^ (10 : ℕ) * 5 ^ (0 : ℕ) * 7 ^ (0 : ℕ) :=
    by rw [h₇]
  have h₉ :
    {(A1, A2, A3) : Set ℤ × Set ℤ × Set ℤ | A1 ∪ A2 ∪ A3 = Icc 1 10 ∧ A1 ∩ A2 ∩ A3 = ∅}.ncard =
      2 ^ (10 : ℕ) * 3 ^ (10 : ℕ) * 5 ^ (0 : ℕ) * 7 ^ (0 : ℕ) :=
    by rw [h₈]
  have h₁₀ :
    {(A1, A2, A3) : Set ℤ × Set ℤ × Set ℤ | A1 ∪ A2 ∪ A3 = Icc 1 10 ∧ A1 ∩ A2 ∩ A3 = ∅}.ncard =
      2 ^ (10 : ℕ) * 3 ^ (10 : ℕ) * 5 ^ (0 : ℕ) * 7 ^ (0 : ℕ) :=
    by rw [h₉]
  simpa [h₁, pow_zero, mul_one, mul_assoc] using h₁₀