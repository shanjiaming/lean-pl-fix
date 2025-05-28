theorem putnam_2000_b5 (S : ℕ → Set ℤ) (hSfin : ∀ n, Set.Finite (S n)) (hSpos : ∀ n, ∀ s ∈ S n, s > 0)
  (hSdef : ∀ n, ∀ a, a ∈ S (n + 1) ↔ Xor' (a - 1 ∈ S n) (a ∈ S n)) :
  (∀ n, ∃ N ≥ n, S N = S 0 ∪ {M : ℤ | M - N ∈ S 0}):=
  by
  have h₁ : S 0 = ∅:= by
    --  by_contra h
    have h₂ : ∃ s, s ∈ S 0 := Set.nonempty_iff_ne_empty.mpr h
    --  obtain ⟨s, hs⟩ := h₂
    have h₃ : s > 0 := hSpos 0 s hs
    have h₄ : s ≤ 0:= by
      have h₅ : Set.Finite (S 0) := hSfin 0
      have h₆ : ∀ s ∈ S 0, s > 0:= by -- simpa using hSpos 0
        hole
      have h₇ : s ≤ 0:= by
        --  by_contra h₈
        have h₉ : s > 0:= by -- linarith
          linarith
        have h₁₀ : s ∈ S 0 := hs
        have h₁₁ : s > 0 := h₆ s h₁₀
        have h₁₂ : False:= by
          have h₁₃ := hSdef 0 s
          have h₁₄ : s ∈ S (0 + 1) ↔ Xor' (s - 1 ∈ S 0) (s ∈ S 0):= by -- simpa using h₁₃
            simpa
          have h₁₅ : s ∈ S 1 ↔ Xor' (s - 1 ∈ S 0) (s ∈ S 0):= by -- simpa using h₁₄
            simpa
          have h₁₆ : s ∈ S 0 := hs
          have h₁₇ : Xor' (s - 1 ∈ S 0) (s ∈ S 0) = Xor' (s - 1 ∈ S 0) true:= by -- simp [h₁₆]
            hole
          have h₁₈ : s ∈ S 1 ↔ Xor' (s - 1 ∈ S 0) true:= by -- simpa [h₁₇] using h₁₅
            hole
          have h₁₉ := hSpos 1 s
          have h₂₀ : s ∈ S 1 → s > 0:= by
            --  intro h₂₁
            --  exact hSpos 1 s h₂₁
            omega
          have h₂₁ : False:= by
            --  by_cases h₂₂ : s - 1 ∈ S 0
            ·
              have h₂₃ : Xor' (s - 1 ∈ S 0) true:= by -- simp [h₂₂]
                hole
              have h₂₄ : s ∈ S 1:= by -- simpa [h₁₈, h₂₃] using h₁₈.mpr h₂₃
                hole
              have h₂₅ : s > 0 := h₂₀ h₂₄
              have h₂₆ : s - 1 > 0:= by
                have h₂₇ : s > 0 := h₂₅
                have h₂₈ : s - 1 > 0:= by -- omega
                  hole
                --  exact h₂₈
                linarith
              have h₂₉ : s - 1 ∈ S 0 := h₂₂
              have h₃₀ : s - 1 > 0 := h₂₆
              have h₃₁ : False:= by
                have h₃₂ : s - 1 > 0 := h₃₀
                have h₃₃ : s - 1 ∈ S 0 := h₂₉
                have h₃₄ : ∀ s ∈ S 0, s > 0 := h₆
                have h₃₅ : s - 1 > 0 := h₃₂
                have h₃₆ : s > 0 := h₂₅
                --  omega
                hole
            --    exact h₃₁
            ·
              have h₂₃ : Xor' (s - 1 ∈ S 0) true := by sorry
              have h₂₄ : s ∈ S 1 := by sorry
              have h₂₅ : s > 0 := h₂₀ h₂₄
              have h₂₆ : s - 1 > 0 := by sorry
              have h₂₉ : s - 1 ∉ S 0 := h₂₂
              have h₃₀ : s - 1 > 0 := h₂₆
              have h₃₁ : False := by sorry
            --    exact h₃₁
            hole
          --  exact h₂₁
          simpa
        --  exact h₁₂
        norm_cast
      --  exact h₇
      linarith
    have h₈ : s > 0 := h₃
    have h₉ : s ≤ 0 := h₄
    --  linarith
    hole
  have h₂ : ∀ n, S n = ∅:= by
    --  intro n
    --  induction n with
    --  | zero => simpa [h₁] using h₁
    --  | succ n
    --    ih =>
    --    have h₃ : S (n + 1) = ∅ :=
    --      by
    --      have h₄ : ∀ a, a ∈ S (n + 1) ↔ Xor' (a - 1 ∈ S n) (a ∈ S n) := by simpa using hSdef n
    --      have h₅ : S n = ∅ := ih
    --      have h₆ : ∀ a, a ∉ S (n + 1) := by
    --        intro a
    --        have h₇ := h₄ a
    --        have h₈ : a ∈ S (n + 1) ↔ Xor' (a - 1 ∈ S n) (a ∈ S n) := h₄ a
    --        have h₉ : S n = ∅ := ih
    --        simp [h₉, Xor'] at h₈ ⊢ <;> (try tauto) <;> (try aesop) <;> (try simp_all [Set.ext_iff]) <;> (try omega)
    --      have h₇ : S (n + 1) = ∅ := by
    --        apply Set.eq_empty_of_forall_not_mem
    --        intro a ha
    --        have h₈ := h₆ a
    --        contradiction
    --      exact h₇
    --    simpa [h₃] using h₃
    hole
  --  intro n
  have h₃ : S n = ∅ := h₂ n
  have h₄ : S 0 = ∅ := h₁
  --  use n
  --  constructor
  --  · linarith
  have h₅ : S n = S 0 ∪ {M : ℤ | M - (n : ℤ) ∈ S 0}:= by
    --  --  rw [h₃, h₄] <;> simp [Set.ext_iff] <;> (try omega) <;> (try aesop) <;> (try simp_all [Set.ext_iff]) <;> (try omega)
    hole
  --  simpa [h₅] using h₅
  hole