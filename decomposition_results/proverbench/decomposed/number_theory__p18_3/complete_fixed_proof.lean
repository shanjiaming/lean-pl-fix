theorem characterize_B : ∀ b : Int, b ∈ B ↔ ∃ k : Int, b = -44 + 5 * k:=
  by
  --  intro b
  have h_forward : b ∈ B → ∃ k : Int, b = -44 + 5 * k:= by
    --  intro h
    --  rcases h with ⟨m, n, hm, rfl⟩
    have h₁ : 7 * m + 12 * n = 22:= by
      --  simp [A, Set.mem_setOf_eq] at hm
      --  exact hm
      simpa
    have h₂ : ∃ k : Int, m + n = -44 + 5 * k:= by
      --  use (m + 110) / 12
      have h₃ : m % 12 = 10:= by
        have h₄ := congr_arg (fun x => x % 12) h₁
        --  norm_num at h₄ ⊢
        --  omega
        omega
      have h₄ : (m + 110) % 12 = 0:= by -- omega
        omega
      have h₅ : (m + 110) / 12 * 12 = m + 110:=
        by
        have h₅₁ : (m + 110) % 12 = 0:= by -- omega
          linarith
        have h₅₂ : (m + 110) / 12 * 12 = m + 110:= by -- omega
          omega
        --  exact h₅₂
        linarith
      have h₆ : n = 66 - 7 * ((m + 110) / 12):=
        by
        have h₆₁ : 7 * m + 12 * n = 22 := h₁
        have h₆₂ : m = -110 + 12 * ((m + 110) / 12):= by -- omega
          linarith
        --  rw [h₆₂] at h₆₁
        --  ring_nf at h₆₁ ⊢
        --  omega
        linarith
      have h₇ : m + n = -44 + 5 * ((m + 110) / 12):= by
        --  rw [h₆]
        --  --  ring_nf at h₅ ⊢ <;> omega
        linarith
      --  exact h₇
      hole
    --  rcases h₂ with ⟨k, hk⟩
    --  refine' ⟨k, _⟩
    --  linarith
    hole
  have h_backward : (∃ k : Int, b = -44 + 5 * k) → b ∈ B:=
    by
    --  intro h
    --  rcases h with ⟨k, rfl⟩
    have h₁ : ∃ (m n : Int), m = -110 + 12 * k ∧ n = 66 - 7 * k ∧ 7 * m + 12 * n = 22:= by
      --  apply general_solution <;> simp_all
      hole
    --  rcases h₁ with ⟨m, n, hm, hn, h_eq⟩
    have h₂ : (m, n) ∈ A:= by
      --  simp only [A, Set.mem_setOf_eq, Prod.mk.injEq]
      --  exact h_eq
      simpa
    have h₃ : (-44 + 5 * k : Int) = m + n:= by
      have h₄ : m = -110 + 12 * k := hm
      have h₅ : n = 66 - 7 * k := hn
      --  --  rw [h₄, h₅] <;> ring_nf <;> omega
      linarith
    --  refine' ⟨m, n, h₂, _⟩
    --  linarith
    hole
  have h_main : b ∈ B ↔ ∃ k : Int, b = -44 + 5 * k:= by
    --  constructor
    --  · intro h
    --    exact h_forward h
    --  · intro h
    --    exact h_backward h
    hole
  --  exact h_main
  hole