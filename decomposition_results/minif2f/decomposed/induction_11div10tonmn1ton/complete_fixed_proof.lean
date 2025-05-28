theorem induction_11div10tonmn1ton (n : ℕ) : 11 ∣ 10 ^ n - (-1 : ℤ) ^ n:=
  by
  have h_main : (11 : ℤ) ∣ (10 : ℤ) ^ n - (-1 : ℤ) ^ n:=
    by
    have h₁ : (10 : ℤ) ≡ (-1 : ℤ) [ZMOD 11]:= by -- norm_num [Int.ModEq]
      norm_cast
    have h₂ : (10 : ℤ) ^ n ≡ (-1 : ℤ) ^ n [ZMOD 11]:= by
      --  calc
      --    (10 : ℤ) ^ n ≡ (-1 : ℤ) ^ n [ZMOD 11] := by simpa using h₁.pow n
      --    _ ≡ (-1 : ℤ) ^ n [ZMOD 11] := by rfl
      hole
    have h₃ : (11 : ℤ) ∣ (10 : ℤ) ^ n - (-1 : ℤ) ^ n:=
      by
      --  rw [Int.ModEq] at h₂
      --  simpa [Int.emod_eq_emod_iff_emod_sub_eq_zero] using h₂
      hole
    --  exact h₃
    omega
  have h_final : 11 ∣ 10 ^ n - (-1 : ℤ) ^ n:= by -- simpa [Int.emod_eq_emod_iff_emod_sub_eq_zero] using h_main
    omega
  --  exact h_final
  omega