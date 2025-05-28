theorem numbertheory_4x3m7y3neq2003 (x y : ℤ) : 4 * x ^ 3 - 7 * y ^ 3 ≠ 2003:=
  by
  have h_main : (4 * x ^ 3 - 7 * y ^ 3) % 7 ≠ 2003 % 7:=
    by
    have h₁ : (4 * x ^ 3 - 7 * y ^ 3 : ℤ) % 7 = (4 * x ^ 3 : ℤ) % 7:=
      by
      have h₂ : (4 * x ^ 3 - 7 * y ^ 3 : ℤ) % 7 = (4 * x ^ 3 : ℤ) % 7 - (7 * y ^ 3 : ℤ) % 7:= by -- omega
        omega
      have h₃ : (7 * y ^ 3 : ℤ) % 7 = 0:= by
        have h₄ : (7 : ℤ) % 7 = 0:= by -- norm_num
          norm_num
        have h₅ : (7 * y ^ 3 : ℤ) % 7 = 0:= by -- simp [h₄, Int.mul_emod, Int.pow_succ, Int.pow_zero]
          norm_num
        --  exact h₅
        norm_num
      --  omega
      linarith
    have h₂ : (4 * x ^ 3 : ℤ) % 7 = (4 * (x % 7) ^ 3 : ℤ) % 7:=
      by
      have h₃ : (x : ℤ) % 7 = (x % 7 : ℤ):= by -- simp [Int.emod_emod]
        norm_num
      have h₄ : (4 * x ^ 3 : ℤ) % 7 = (4 * (x % 7) ^ 3 : ℤ) % 7:=
        by
        have h₅ : (x : ℤ) % 7 = (x % 7 : ℤ):= by -- simp [Int.emod_emod]
          norm_num
        have h₆ : (x : ℤ) ^ 3 % 7 = ((x % 7 : ℤ) ^ 3) % 7:=
          by
          have h₇ : (x : ℤ) % 7 = (x % 7 : ℤ):= by -- simp [Int.emod_emod]
            norm_num
          have h₈ : (x : ℤ) ^ 3 % 7 = ((x % 7 : ℤ) ^ 3) % 7:= by
            --  norm_num [pow_three, Int.mul_emod, Int.add_emod, Int.emod_emod] <;> (try omega) <;> (try ring_nf) <;> (try omega) <;>
                (try norm_num) <;>
              (try omega)
            hole
          --  exact h₈
          linarith
        have h₉ : (4 * x ^ 3 : ℤ) % 7 = (4 * (x % 7) ^ 3 : ℤ) % 7:= by
          --  norm_num [h₆, Int.mul_emod, Int.add_emod, Int.emod_emod] <;> (try omega) <;> (try ring_nf) <;> (try omega) <;>
              (try norm_num) <;>
            (try omega)
          hole
        --  exact h₉
        linarith
      --  exact h₄
      linarith
    have h₃ : (2003 : ℤ) % 7 = 1:= by -- norm_num
      norm_num
    have h₄ : (4 * x ^ 3 - 7 * y ^ 3 : ℤ) % 7 = (4 * (x % 7) ^ 3 : ℤ) % 7:= by -- rw [h₁, h₂]
      linarith
    have h₅ : (4 * (x % 7) ^ 3 : ℤ) % 7 ≠ 1:=
      by
      have h₆ : x % 7 = 0 ∨ x % 7 = 1 ∨ x % 7 = 2 ∨ x % 7 = 3 ∨ x % 7 = 4 ∨ x % 7 = 5 ∨ x % 7 = 6:= by -- omega
        omega
      --  rcases h₆ with (h₆ | h₆ | h₆ | h₆ | h₆ | h₆ | h₆) <;>
      --              (try {simp [h₆, pow_three, Int.mul_emod, Int.add_emod, Int.emod_emod, Int.sub_emod] <;> norm_num <;> omega
      --                }) <;>
                (try omega) <;>
              (try ring_nf) <;>
            (try omega) <;>
          (try norm_num) <;>
        (try omega)
      hole
    have h₆ : (4 * x ^ 3 - 7 * y ^ 3 : ℤ) % 7 ≠ 1:= by
      --  rw [h₄]
      --  exact h₅
      omega
    --  omega
    omega
  have h_final : 4 * x ^ 3 - 7 * y ^ 3 ≠ 2003:= by
    --  intro h
    have h₁ : (4 * x ^ 3 - 7 * y ^ 3 : ℤ) % 7 = 2003 % 7:= by -- rw [h] <;> norm_num
      omega
    have h₂ : (4 * x ^ 3 - 7 * y ^ 3) % 7 ≠ 2003 % 7 := h_main
    --  contradiction
    omega
  --  exact h_final
  omega