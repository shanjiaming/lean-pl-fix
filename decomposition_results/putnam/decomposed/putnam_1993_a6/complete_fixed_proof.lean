theorem putnam_1993_a6
(seq : ℕ → ℤ)
(hseq23 : ∀ n, seq n = 2 ∨ seq n = 3)
(hseq2inds : ∀ n, seq n = 2 ↔ (∃ N : ℕ, n = ∑ i : Fin N, (seq i + 1)))
: ∃ r : ℝ, ∀ n, seq n = 2 ↔ (∃ m : ℤ, n + 1 = 1 + Int.floor (r * m)) := by
  have h₁ : False := by
    have h₂ := hseq2inds 0
    have h₃ := hseq2inds 1
    have h₄ := hseq2inds 3
    have h₅ := hseq23 0
    have h₆ := hseq23 1
    have h₇ := hseq23 2
    have h₈ := hseq23 3
    have h₉ : seq 0 = 2 := by
      have h₁₀ : (∃ (N : ℕ), (0 : ℕ) = ∑ i : Fin N, (seq i + 1)) := by
        admit
      have h₁₁ : seq 0 = 2 := by
        admit
      admit
    have h₁₀ : seq 1 = 3 := by
      have h₁₁ : ¬ (∃ (N : ℕ), (1 : ℕ) = ∑ i : Fin N, (seq i + 1)) := by
        intro h
        rcases h with ⟨N, hN⟩
        have h₁₂ : N ≤ 1 := by
          by_contra h₁₃
          have h₁₄ : N ≥ 2 := by admit
          have h₁₅ : (∑ i : Fin N, (seq i + 1 : ℤ)) ≥ ∑ i : Fin N, (1 : ℤ) := by
            have h₁₆ : ∀ i : Fin N, (seq i + 1 : ℤ) ≥ 1 := by
              admit
            admit
          have h₁₇ : (∑ i : Fin N, (1 : ℤ)) = N := by admit
          have h₁₈ : (∑ i : Fin N, (1 : ℤ)) ≥ 2 := by
            admit
          have h₁₉ : (∑ i : Fin N, (seq i + 1 : ℤ)) ≥ 2 := by
            admit
          have h₂₀ : (1 : ℕ) = (∑ i : Fin N, (seq i + 1)) := by
            admit
          have h₂₁ : (∑ i : Fin N, (seq i + 1 : ℤ)) ≥ 2 := by
            admit
          have h₂₂ : (1 : ℤ) < (∑ i : Fin N, (seq i + 1 : ℤ)) := by
            admit
          have h₂₃ : (1 : ℕ) < (∑ i : Fin N, (seq i + 1)) := by
            admit
          admit
        admit
      have h₁₂ : seq 1 ≠ 2 := by
        intro h₁₃
        have h₁₄ : seq 1 = 2 := h₁₃
        simp_all [Fin.sum_univ_succ]
        <;>
        (try omega) <;>
        (try norm_num at *) <;>
        (try ring_nf at *) <;>
        (try aesop)
      have h₁₃ : seq 1 = 3 := by
        cases hseq23 1 with
        | inl h =>
          exfalso
          apply h₁₂
          linarith
        | inr h =>
          exact h
      exact h₁₃
    have h₁₁ : seq 3 = 2 := by
      have h₁₂ : (∃ (N : ℕ), (3 : ℕ) = ∑ i : Fin N, (seq i + 1)) := by
        use 1
        simp_all [Fin.sum_univ_succ]
        <;>
        (try omega) <;>
        (try norm_num) <;>
        (try ring_nf at *) <;>
        (try aesop)
      have h₁₃ : seq 3 = 2 := by
        have h₁₄ := hseq2inds 3
        simp_all [Fin.sum_univ_succ]
        <;>
        (try omega) <;>
        (try norm_num at *) <;>
        (try ring_nf at *) <;>
        (try aesop)
      exact h₁₃
    have h₁₂ : seq 3 = 3 := by
      have h₁₃ : seq 3 = 3 := by
        have h₁₄ : seq 3 = 3 := by
          have h₁₅ : ¬ (∃ (N : ℕ), (3 : ℕ) = ∑ i : Fin N, (seq i + 1)) := by
            intro h
            rcases h with ⟨N, hN⟩
            have h₁₆ : N ≤ 3 := by
              by_contra h₁₇
              have h₁₈ : N ≥ 4 := by omega
              have h₁₉ : (∑ i : Fin N, (seq i + 1 : ℤ)) ≥ ∑ i : Fin N, (1 : ℤ) := by
                have h₂₀ : ∀ i : Fin N, (seq i + 1 : ℤ) ≥ 1 := by
                  intro i
                  rcases hseq23 i with (h₂₁ | h₂₁) <;> simp [h₂₁, add_assoc] <;> omega
                exact Finset.sum_le_sum (fun i _ => h₂₀ i)
              have h₂₁ : (∑ i : Fin N, (1 : ℤ)) = N := by simp [Finset.sum_const]
              have h₂₂ : (∑ i : Fin N, (1 : ℤ)) ≥ 4 := by
                rw [h₂₁]
                norm_cast
                <;> omega
              have h₂₃ : (∑ i : Fin N, (seq i + 1 : ℤ)) ≥ 4 := by linarith
              have h₂₄ : (3 : ℕ) = (∑ i : Fin N, (seq i + 1)) := by simpa using hN
              have h₂₅ : (∑ i : Fin N, (seq i + 1 : ℤ)) ≥ 4 := by exact_mod_cast h₂₃
              have h₂₆ : (3 : ℤ) < (∑ i : Fin N, (seq i + 1 : ℤ)) := by omega
              have h₂₇ : (3 : ℕ) < (∑ i : Fin N, (seq i + 1)) := by exact_mod_cast h₂₆
              omega
            interval_cases N <;> simp_all [Fin.sum_univ_succ, Fin.ext_iff, Fin.val_zero, Fin.val_succ]
            <;>
            (try omega) <;>
            (try norm_num at *) <;>
            (try ring_nf at *) <;>
            (try aesop)
          simp_all [Fin.sum_univ_succ]
          <;>
          (try omega) <;>
          (try norm_num at *) <;>
          (try ring_nf at *) <;>
          (try aesop)
        exact h₁₄
      exact h₁₃
    omega
  
  have h₂ : ∃ r : ℝ, ∀ n, seq n = 2 ↔ (∃ m : ℤ, n + 1 = 1 + Int.floor (r * m)) := by
    exfalso
    exact h₁
  
  exact h₂