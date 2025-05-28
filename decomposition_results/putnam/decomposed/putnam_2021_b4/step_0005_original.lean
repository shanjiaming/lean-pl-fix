theorem h₄ (F : ℕ → ℕ) (hF : ∀ (n : ℕ), F (n + 2) = F (n + 1) + F n) (F01 : F 0 = 0 ∧ F 1 = 1) (h₁ : F 2 = 1) (h₂ : ∀ n ≥ 1, F n ≥ 1) (m : ℕ) (hm : m > 2) : ∀ n ≥ 3, F n ≥ 2 := by
  intro n hn
  induction' hn with n hn IH
  · norm_num [hF, F01, h₁]
  ·
    cases n with
    | zero => contradiction
    | succ n =>
      cases n with
      | zero => contradiction
      | succ n =>
        cases n with
        | zero => contradiction
        | succ n => simp_all [hF, Nat.succ_eq_add_one, Nat.add_assoc] <;> (try omega) <;> (try nlinarith)