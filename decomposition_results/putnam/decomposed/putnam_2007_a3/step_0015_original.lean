theorem h_goodperms_ncard (k : ℕ) (kpos : k > 0) (perms goodperms : Set (Fin (3 * k + 1) → ℤ)) (hgoodperms : goodperms = {f | f ∈ perms ∧ ¬∃ j, 3 ∣ ∑ i, if i ≤ j then f i else 0}) (hperms : perms = {f | ∀ y ∈ Icc 1 (3 * k + 1), ∃! x, f x = ↑y}) (h_perms_infinite : perms.Infinite) (h_perms_ncard : perms.ncard = 0) : goodperms.ncard = 0 :=
  by
  have h₁ : goodperms ⊆ perms := by sorry
  have h₂ : perms.Infinite := h_perms_infinite
  have h₃ : goodperms.Infinite ∨ goodperms.Finite := by sorry
  cases h₃ with
  | inl h₃ =>
    have h₄ : goodperms.ncard = 0 := by apply Set.Infinite.ncard_eq_zero h₃
    exact h₄
  | inr
    h₃ =>
    have h₄ : goodperms.ncard = 0 := by
      have h₅ : goodperms ⊆ perms := h₁
      have h₆ : perms.Infinite := h₂
      have h₇ : goodperms.Finite := h₃
      have h₈ : goodperms = ∅ := by
        by_contra h₈
        have h₉ : goodperms.Nonempty := Set.nonempty_iff_ne_empty.mpr h₈
        have h₁₀ : perms.Infinite := h₂
        have h₁₁ : goodperms ⊆ perms := h₁
        have h₁₂ : goodperms.Infinite := by
          apply
            Set.infinite_of_injective_forall_mem (fun n m hnm => by simp_all [Set.ext_iff])
              (fun n => by simp_all [Set.ext_iff] <;> aesop)
        contradiction
      rw [h₈]
      simp
    exact h₄