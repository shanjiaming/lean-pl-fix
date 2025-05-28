theorem putnam_2017_a4 (N : ℕ) (score : Fin (2 * N) → Fin 11) (hsurj : ∀ k : Fin 11, ∃ i : Fin (2 * N), score i = k)
  (havg : (∑ i : Fin (2 * N), (score i : ℝ)) / (2 * N) = 7.4) :
  (∃ s : Finset (Fin (2 * N)),
    s.card = N ∧ (∑ i in s, (score i : ℝ)) / N = 7.4 ∧ (∑ i in sᶜ, (score i : ℝ)) / N = 7.4):=
  by
  have hN_pos : N > 0:= by
    --  by_contra h
    --  push_neg at h
    have h₁ : N = 0:= by -- omega
      hole
    have h₂ : 2 * N = 0:= by -- simp [h₁]
      hole
    have h₃ : Fin (2 * N) ≃ Fin 0:= by -- rw [h₂] <;> simp [Fin.ext_iff]
      hole
    have h₄ := hsurj (⟨0, by decide⟩ : Fin 11)
    obtain ⟨i, hi⟩ := h₄
    have h₅ : i.1 < 2 * N := i.2
    have h₆ : i.1 < 0:= by -- simpa [h₂] using h₅
      hole
    omega
    hole
  have hN_dvd : 5 ∣ N:=
    by
    have h₁ : (∑ i : Fin (2 * N), (score i : ℝ)) = (2 * N : ℝ) * 7.4:=
      by
      have h₂ : (∑ i : Fin (2 * N), (score i : ℝ)) / (2 * N : ℝ) = 7.4:= by -- simpa using havg
        hole
      have h₃ : (2 * N : ℝ) ≠ 0:= by -- -- norm_cast <;> omega
        hole
      --  --  --  field_simp at h₂ ⊢ <;> ring_nf at h₂ ⊢ <;> nlinarith
      hole
    have h₂ : (∑ i : Fin (2 * N), (score i : ℤ)) = (2 * N : ℤ) * 74 / 10:=
      by
      have h₃ : (∑ i : Fin (2 * N), (score i : ℤ)) = (∑ i : Fin (2 * N), (score i : ℝ)):= by
        --  --  simp [Finset.sum_congr] <;> norm_cast
        hole
      --  rw [h₃]
      rw [h₁] <;> norm_num <;> ring_nf at * <;> field_simp at * <;> ring_nf at * <;> norm_cast at * <;>
                    simp_all [Finset.sum_congr] <;>
                  norm_num <;>
                ring_nf at * <;>
              field_simp at * <;>
            ring_nf at * <;>
          norm_cast at * <;>
        omega
      hole
    have h₃ : (2 * N : ℤ) * 74 % 10 = 0:=
      by
      have h₄ : (∑ i : Fin (2 * N), (score i : ℤ)) = (2 * N : ℤ) * 74 / 10:= by -- exact h₂
        hole
      have h₅ : (2 * N : ℤ) * 74 / 10 * 10 = (2 * N : ℤ) * 74:=
        by
        have h₆ : (2 * N : ℤ) * 74 % 10 = 0:=
          by
          have h₇ : ∀ i : Fin (2 * N), (score i : ℤ) % 10 = (score i : ℤ) % 10:= by -- simp
            hole
          have h₈ : (∑ i : Fin (2 * N), (score i : ℤ)) % 10 = (∑ i : Fin (2 * N), (score i : ℤ) % 10) % 10:= by
            --  simp [Int.emod_eq_emod_iff_emod_sub_eq_zero, Finset.sum_int_mod]
            hole
          have h₉ : (∑ i : Fin (2 * N), (score i : ℤ) % 10) % 10 = (∑ i : Fin (2 * N), (score i : ℤ) % 10) % 10:= by -- simp
            hole
          have h₁₀ : (∑ i : Fin (2 * N), (score i : ℤ)) % 10 = ((2 * N : ℤ) * 74 / 10 * 10) % 10:= by -- omega
            hole
          have h₁₁ : ((2 * N : ℤ) * 74 / 10 * 10) % 10 = 0:= by -- omega
            hole
          --  omega
          hole
        --  omega
        hole
      --  omega
      hole
    have h₄ : (2 * N : ℤ) * 74 % 10 = 0:= by -- exact h₃
      hole
    have h₅ : (N : ℤ) % 5 = 0:= by -- omega
      hole
    have h₆ : 5 ∣ N:= by -- omega
      hole
    --  exact h₆
    hole
  have h_main :
    ∃ (s : Finset (Fin (2 * N))),
      s.card = N ∧ ((∑ i in s, (score i : ℝ)) / N = 7.4) ∧ ((∑ i in sᶜ, (score i : ℝ)) / N = 7.4) := by sorry
  --  exact h_main
  hole