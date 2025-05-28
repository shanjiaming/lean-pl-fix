theorem induction_nfactltnexpnm1ngt3 (n : ℕ) (h₀ : 3 ≤ n) : n ! < n ^ (n - 1):=
  by
  have h_base : 3! < 3 ^ (3 - 1):= by -- norm_num [Nat.factorial] <;> decide
    norm_num
  have h_inductive : ∀ (k : ℕ), 3 ≤ k → k ! < k ^ (k - 1) → (k + 1)! < (k + 1) ^ k:=
    by
    --  intro k hk hk_rec
    have h₁ : (k + 1)! = (k + 1) * k !:= by -- simp [Nat.factorial] <;> ring <;> simp_all [Nat.factorial] <;> ring
      norm_cast
    --  rw [h₁]
    have h₂ : (k + 1) * k ! < (k + 1) * k ^ (k - 1):=
      by
      have h₃ : 0 < k + 1:= by -- linarith
        norm_num
      have h₄ : k ! < k ^ (k - 1) := hk_rec
      have h₅ : (k + 1) * k ! < (k + 1) * k ^ (k - 1):= by -- nlinarith
        nlinarith
      --  exact h₅
      linarith
    have h₃ : (k + 1) * k ^ (k - 1) ≤ (k + 1) ^ k:=
      by
      have h₄ : k ≥ 3:= by -- linarith
        linarith
      have h₅ : k - 1 ≥ 2:= by -- omega
        omega
      have h₆ : (k + 1) * k ^ (k - 1) ≤ (k + 1) ^ k:= by
        --  calc
        --    (k + 1) * k ^ (k - 1) = (k + 1) * k ^ (k - 1) := rfl
        --    _ ≤ (k + 1) * (k + 1) ^ (k - 1) :=
        --      by
        --      have h₇ : k ^ (k - 1) ≤ (k + 1) ^ (k - 1) := by exact Nat.pow_le_pow_of_le_left (by linarith) _
        --      exact Nat.mul_le_mul_left _ h₇
        --    _ = (k + 1) ^ (k - 1 + 1) := by rw [Nat.mul_comm] <;> simp [Nat.pow_succ, Nat.mul_comm] <;> ring_nf
        --    _ ≤ (k + 1) ^ k :=
        --      by
        --      have h₈ : k - 1 + 1 ≤ k := by
        --        have h₉ : k - 1 + 1 ≤ k := by omega
        --        exact h₉
        --      exact Nat.pow_le_pow_of_le_right (by linarith) h₈
        hole
      --  exact h₆
      linarith
    have h₄ : (k + 1) * k ! < (k + 1) ^ k:= by
      --  calc
      --    (k + 1) * k ! < (k + 1) * k ^ (k - 1) := h₂
      --    _ ≤ (k + 1) ^ k := h₃
      linarith
    --  exact h₄
    hole
  have h_main : n ! < n ^ (n - 1):=
    by
    have h₁ : ∀ (k : ℕ), 3 ≤ k → k ! < k ^ (k - 1):= by
      --  intro k hk
      --  induction' hk with k hk IH
      --  · norm_num [Nat.factorial]
      --  · simpa using h_inductive k hk IH
      hole
    have h₂ : n ! < n ^ (n - 1) := h₁ n h₀
    --  exact h₂
    linarith
  --  exact h_main
  linarith