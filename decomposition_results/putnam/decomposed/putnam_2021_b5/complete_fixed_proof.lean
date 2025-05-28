theorem putnam_2021_b5 (n : ℕ) (npos : n ≥ 1) (veryodd : Matrix (Fin n) (Fin n) ℤ → Prop)
  (hveryodd :
    ∀ A,
      veryodd A ↔
        ∀ m ∈ Set.Icc 1 n, ∀ reind : Fin m → Fin n, Function.Injective reind → Odd (A.submatrix reind reind).det) :
  ∀ A, veryodd A → (∀ k ≥ 1, veryodd (A ^ k)):= by
  --  intro A hA k hk
  have h_main : veryodd (A ^ k):= by
    --  rw [hveryodd]
    --  intro m hm reind hreind
    have h₁ : (A ^ k).submatrix reind reind = ((A.submatrix reind reind) ^ k):=
      by
      --  rw [show (A ^ k) = A ^ k by rfl]
      --  induction' hk with k hk IH
      --  · ext i j
      --    simp [Matrix.one_apply, Matrix.submatrix_apply, Fin.ext_iff, pow_one] <;> aesop
      --  · rw [pow_succ', pow_succ]
      --  --    simp_all [Matrix.mul_submatrix_one, Matrix.submatrix_mul, Matrix.one_mul, Matrix.mul_one] <;> try rfl <;> aesop
      hole
    --  rw [h₁]
    have h₂ : Odd (A.submatrix reind reind).det:=
      by
      have h₃ : ∀ m ∈ Set.Icc 1 n, ∀ reind : Fin m → Fin n, Function.Injective reind → Odd (A.submatrix reind reind).det:=
        by
        --  intro m hm reind hreind
        --  exact (hveryodd A).mp hA m hm reind hreind
        hole
      have h₄ : m ∈ Set.Icc 1 n := hm
      have h₅ : Function.Injective reind := hreind
      --  exact h₃ m h₄ reind h₅
      hole
    have h₃ : Odd ((A.submatrix reind reind) ^ k).det:=
      by
      have h₄ : ((A.submatrix reind reind) ^ k).det = (A.submatrix reind reind).det ^ k:= by -- simp [Matrix.det_pow]
        norm_num
      --  rw [h₄]
      have h₅ : Odd (A.submatrix reind reind).det := h₂
      have h₆ : Odd ((A.submatrix reind reind).det ^ k):=
        by
        have h₇ : Odd (A.submatrix reind reind).det := h₂
        have h₈ : Odd ((A.submatrix reind reind).det ^ k):=
          by
          have h₉ : (A.submatrix reind reind).det % 2 = 1:=
            by
            --  cases' h₇ with t ht
            have h₁₀ : (A.submatrix reind reind).det = 2 * t + 1:= by -- omega
              linarith
            --  omega
            hole
          have h₁₀ : ((A.submatrix reind reind).det ^ k) % 2 = 1:=
            by
            have h₁₁ : (A.submatrix reind reind).det % 2 = 1 := h₉
            have h₁₂ : ((A.submatrix reind reind).det ^ k) % 2 = 1:= by
              --  calc
              --    ((A.submatrix reind reind).det ^ k) % 2 = (((A.submatrix reind reind).det) % 2) ^ k % 2 := by
              --      simp [pow_mod, Nat.pow_mod]
              --    _ = 1 ^ k % 2 := by rw [h₁₁]
              --    _ = 1 % 2 := by simp
              --    _ = 1 := by norm_num
              hole
            --  exact h₁₂
            linarith
          --  cases' Int.emod_two_eq_zero_or_one ((A.submatrix reind reind).det ^ k) with h h <;>
          --      simp_all [Int.odd_iff_not_even, Int.even_iff] <;>
          --    omega
          hole
        --  exact h₈
        simpa
      --  exact h₆
      simpa
    --  exact h₃
    hole
  --  exact h_main
  hole