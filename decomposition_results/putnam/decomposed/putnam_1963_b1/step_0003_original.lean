theorem h₁ (a : ℤ) (h : X ^ 2 - X + C a ∣ X ^ 13 + X + C 90) : a = 2 := by
  have h₂ := h
  rw [dvd_iff_exists_eq_mul_left] at h₂
  obtain ⟨q, hq⟩ := h₂
  have h₃ := congr_arg (fun p => eval 0 p) hq
  have h₄ := congr_arg (fun p => eval 1 p) hq
  have h₅ := congr_arg (fun p => eval 2 p) hq
  have h₆ := congr_arg (fun p => eval (-1) p) hq
  have h₇ := congr_arg (fun p => eval (-2) p) hq
  norm_num at h₃ h₄ h₅ h₆ h₇ <;> (try ring_nf at h₃ h₄ h₅ h₆ h₇) <;> (try norm_num at h₃ h₄ h₅ h₆ h₇) <;>
                            (try nlinarith) <;>
                          (try ring_nf at hq ⊢) <;>
                        (try norm_num at hq ⊢) <;>
                      (try nlinarith) <;>
                    (try omega) <;>
                  (try {
                      have h₈ := congr_arg (fun p => eval 3 p) hq
                      have h₉ := congr_arg (fun p => eval (-3) p) hq
                      norm_num at h₈ h₉ <;> ring_nf at h₈ h₉ <;> norm_num at h₈ h₉ <;> nlinarith
                    }) <;>
                (try {
                    have h₈ := congr_arg (fun p => eval 4 p) hq
                    have h₉ := congr_arg (fun p => eval (-4) p) hq
                    norm_num at h₈ h₉ <;> ring_nf at h₈ h₉ <;> norm_num at h₈ h₉ <;> nlinarith
                  }) <;>
              (try {
                  have h₈ := congr_arg (fun p => eval 5 p) hq
                  have h₉ := congr_arg (fun p => eval (-5) p) hq
                  norm_num at h₈ h₉ <;> ring_nf at h₈ h₉ <;> norm_num at h₈ h₉ <;> nlinarith
                }) <;>
            (try {
                have h₈ := congr_arg (fun p => eval 6 p) hq
                have h₉ := congr_arg (fun p => eval (-6) p) hq
                norm_num at h₈ h₉ <;> ring_nf at h₈ h₉ <;> norm_num at h₈ h₉ <;> nlinarith
              }) <;>
          (try {
              have h₈ := congr_arg (fun p => eval 7 p) hq
              have h₉ := congr_arg (fun p => eval (-7) p) hq
              norm_num at h₈ h₉ <;> ring_nf at h₈ h₉ <;> norm_num at h₈ h₉ <;> nlinarith
            }) <;>
        (try {
            have h₈ := congr_arg (fun p => eval 8 p) hq
            have h₉ := congr_arg (fun p => eval (-8) p) hq
            norm_num at h₈ h₉ <;> ring_nf at h₈ h₉ <;> norm_num at h₈ h₉ <;> nlinarith
          }) <;>
      (try {
          have h₈ := congr_arg (fun p => eval 9 p) hq
          have h₉ := congr_arg (fun p => eval (-9) p) hq
          norm_num at h₈ h₉ <;> ring_nf at h₈ h₉ <;> norm_num at h₈ h₉ <;> nlinarith
        }) <;>
    (try {
        have h₈ := congr_arg (fun p => eval 10 p) hq
        have h₉ := congr_arg (fun p => eval (-10) p) hq
        norm_num at h₈ h₉ <;> ring_nf at h₈ h₉ <;> norm_num at h₈ h₉ <;> nlinarith
      })