theorem power_and_factorial_range : ∀ (n : ℕ), n > 0 → (5^n > n.factorial ↔ n ≤ 11) := by
  have h_main : ∀ (n : ℕ), n ≥ 12 → 5^n ≤ n.factorial := by
    intro n hn
    induction' hn with n hn IH
    · -- Base case: n = 12
      norm_num [Nat.factorial_succ, Nat.pow_succ]
    -- Inductive step: assume the statement holds for n, prove for n + 1
    · cases n with
      | zero => contradiction -- n cannot be zero since hn : n ≥ 12
      | succ n =>
        cases n with
        | zero => contradiction -- n cannot be one since hn : n ≥ 12
        | succ n =>
          cases n with
          | zero => contradiction -- n cannot be two since hn : n ≥ 12
          | succ n =>
            cases n with
            | zero => contradiction -- n cannot be three since hn : n ≥ 12
            | succ n =>
              cases n with
              | zero => contradiction -- n cannot be four since hn : n ≥ 12
              | succ n =>
                cases n with
                | zero => contradiction -- n cannot be five since hn : n ≥ 12
                | succ n =>
                  cases n with
                  | zero => contradiction -- n cannot be six since hn : n ≥ 12
                  | succ n =>
                    cases n with
                    | zero => contradiction -- n cannot be seven since hn : n ≥ 12
                    | succ n =>
                      cases n with
                      | zero => contradiction -- n cannot be eight since hn : n ≥ 12
                      | succ n =>
                        cases n with
                        | zero => contradiction -- n cannot be nine since hn : n ≥ 12
                        | succ n =>
                          cases n with
                          | zero => contradiction -- n cannot be ten since hn : n ≥ 12
                          | succ n =>
                            cases n with
                            | zero => contradiction -- n cannot be eleven since hn : n ≥ 12
                            | succ n =>
                              simp_all [Nat.factorial_succ, Nat.pow_succ, Nat.mul_assoc]
                              <;> nlinarith
  
  have h_forward : ∀ (n : ℕ), n > 0 → 5^n > n.factorial → n ≤ 11 := by
    intro n hn h
    by_contra! h₁
    have h₂ : n ≥ 12 := by omega
    have h₃ : 5^n ≤ n.factorial := h_main n h₂
    omega
  
  have h_backward : ∀ (n : ℕ), n > 0 → n ≤ 11 → 5^n > n.factorial := by
    intro n hn h_le_11
    have h₁ : n ≤ 11 := h_le_11
    have h₂ : n > 0 := hn
    interval_cases n <;> norm_num [Nat.factorial_succ, Nat.pow_succ]
    <;>
    (try decide) <;>
    (try norm_num) <;>
    (try ring_nf at *) <;>
    (try omega) <;>
    (try nlinarith)
  
  intro n hn
  constructor
  · -- Prove the forward direction: if `5^n > n.factorial`, then `n ≤ 11`.
    intro h
    have h₁ : n ≤ 11 := h_forward n hn h
    exact h₁
  · -- Prove the backward direction: if `n ≤ 11`, then `5^n > n.factorial`.
    intro h
    have h₁ : n ≤ 11 := h
    have h₂ : 5^n > n.factorial := h_backward n hn h₁
    exact h₂