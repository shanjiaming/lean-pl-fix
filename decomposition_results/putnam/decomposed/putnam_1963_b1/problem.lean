theorem putnam_1963_b1
: ∀ a : ℤ, (X^2 - X + (C a)) ∣ (X ^ 13 + X + (C 90)) ↔ a = ((2) : ℤ ) := by
  intro a
  have h_main : (X^2 - X + (C a)) ∣ (X ^ 13 + X + (C 90)) ↔ a = 2 := by
    constructor
    · -- Prove the forward direction: if (X^2 - X + C a) divides (X^13 + X + C 90), then a = 2
      intro h
      have h₁ : a = 2 := by
        -- Use the fact that if (X^2 - X + C a) divides (X^13 + X + C 90), then the remainder when (X^13 + X + C 90) is divided by (X^2 - X + C a) is zero
        have h₂ := h
        rw [dvd_iff_exists_eq_mul_left] at h₂
        obtain ⟨q, hq⟩ := h₂
        have h₃ := congr_arg (fun p => eval 0 p) hq
        have h₄ := congr_arg (fun p => eval 1 p) hq
        have h₅ := congr_arg (fun p => eval 2 p) hq
        have h₆ := congr_arg (fun p => eval (-1) p) hq
        have h₇ := congr_arg (fun p => eval (-2) p) hq
        norm_num at h₃ h₄ h₅ h₆ h₇
        <;>
        (try ring_nf at h₃ h₄ h₅ h₆ h₇) <;>
        (try norm_num at h₃ h₄ h₅ h₆ h₇) <;>
        (try nlinarith) <;>
        (try ring_nf at hq ⊢) <;>
        (try norm_num at hq ⊢) <;>
        (try nlinarith)
        <;>
        (try omega)
        <;>
        (try
          {
            have h₈ := congr_arg (fun p => eval 3 p) hq
            have h₉ := congr_arg (fun p => eval (-3) p) hq
            norm_num at h₈ h₉
            <;>
            ring_nf at h₈ h₉
            <;>
            norm_num at h₈ h₉
            <;>
            nlinarith
          })
        <;>
        (try
          {
            have h₈ := congr_arg (fun p => eval 4 p) hq
            have h₉ := congr_arg (fun p => eval (-4) p) hq
            norm_num at h₈ h₉
            <;>
            ring_nf at h₈ h₉
            <;>
            norm_num at h₈ h₉
            <;>
            nlinarith
          })
        <;>
        (try
          {
            have h₈ := congr_arg (fun p => eval 5 p) hq
            have h₉ := congr_arg (fun p => eval (-5) p) hq
            norm_num at h₈ h₉
            <;>
            ring_nf at h₈ h₉
            <;>
            norm_num at h₈ h₉
            <;>
            nlinarith
          })
        <;>
        (try
          {
            have h₈ := congr_arg (fun p => eval 6 p) hq
            have h₉ := congr_arg (fun p => eval (-6) p) hq
            norm_num at h₈ h₉
            <;>
            ring_nf at h₈ h₉
            <;>
            norm_num at h₈ h₉
            <;>
            nlinarith
          })
        <;>
        (try
          {
            have h₈ := congr_arg (fun p => eval 7 p) hq
            have h₉ := congr_arg (fun p => eval (-7) p) hq
            norm_num at h₈ h₉
            <;>
            ring_nf at h₈ h₉
            <;>
            norm_num at h₈ h₉
            <;>
            nlinarith
          })
        <;>
        (try
          {
            have h₈ := congr_arg (fun p => eval 8 p) hq
            have h₉ := congr_arg (fun p => eval (-8) p) hq
            norm_num at h₈ h₉
            <;>
            ring_nf at h₈ h₉
            <;>
            norm_num at h₈ h₉
            <;>
            nlinarith
          })
        <;>
        (try
          {
            have h₈ := congr_arg (fun p => eval 9 p) hq
            have h₉ := congr_arg (fun p => eval (-9) p) hq
            norm_num at h₈ h₉
            <;>
            ring_nf at h₈ h₉
            <;>
            norm_num at h₈ h₉
            <;>
            nlinarith
          })
        <;>
        (try
          {
            have h₈ := congr_arg (fun p => eval 10 p) hq
            have h₉ := congr_arg (fun p => eval (-10) p) hq
            norm_num at h₈ h₉
            <;>
            ring_nf at h₈ h₉
            <;>
            norm_num at h₈ h₉
            <;>
            nlinarith
          })
      exact h₁
    · -- Prove the reverse direction: if a = 2, then (X^2 - X + C a) divides (X^13 + X + C 90)
      intro h
      rw [h]
      -- Use the fact that (X^2 - X + C 2) divides (X^13 + X + C 90) when a = 2
      have h₁ : (X ^ 2 - X + C (2 : ℤ)) ∣ (X ^ 13 + X + C 90) := by
        -- Use the fact that (X^2 - X + C 2) divides (X^13 + X + C 90) when a = 2
        use (X ^ 11 + X ^ 10 - X ^ 8 - X ^ 7 + 3 * X ^ 6 + X ^ 5 - 5 * X ^ 4 - 17 * X ^ 3 + 23 * X ^ 2 + 45 * X - 89)
        ring_nf
        <;>
        norm_num
        <;>
        ring_nf
        <;>
        norm_num
        <;>
        ring_nf
        <;>
        norm_num
      exact h₁
  exact h_main