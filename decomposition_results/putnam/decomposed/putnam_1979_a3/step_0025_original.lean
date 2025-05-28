theorem h_main (x : ℕ → ℝ) (hx : ∀ (n : ℕ), x n ≠ 0 ∧ (n ≥ 3 → x n = x (n - 2) * x (n - 1) / (2 * x (n - 2) - x (n - 1)))) (h_imp :  (fun x =>        match x with        | (a, b) => ∃ m, a = ↑m ∧ b = ↑m)      (x 1, x 2) →    ∀ (m : ℕ), ∃ n > m, ∃ a, ↑a = x n) (h_conv :  (∀ (m : ℕ), ∃ n > m, ∃ a, ↑a = x n) →    (fun x =>        match x with        | (a, b) => ∃ m, a = ↑m ∧ b = ↑m)      (x 1, x 2)) : (∀ (m : ℕ), ∃ n > m, ∃ a, ↑a = x n) ↔
    (fun x =>
        match x with
        | (a, b) => ∃ m, a = ↑m ∧ b = ↑m)
      (x 1, x 2) :=
  by refine' ⟨h_conv, h_imp⟩