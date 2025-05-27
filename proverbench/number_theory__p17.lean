theorem binomial_theorem_condition (n : ℕ) :
  (∃ (k : ℕ), k > 0 ∧ k < n ∧
    ∃ (x_i y_i : ℕ), x_i % 2 = 1 ∧ y_i % 2 = 1 ∧
      x_i + y_i * Real.sqrt 2 = (1 + Real.sqrt 2)^(2 * n + 1) ∧
      n = (x_i - 3) / 2) ↔
  ∃ (k : ℕ), k > 0 ∧ k < n ∧
    Nat.choose n (k - 1) = 2 * Nat.choose n k + Nat.choose n (k + 1) := by
  <;>
  (try
    norm_num [Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt])
  <;>
  (try
    norm_num [Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt] at *)
  <;>
  (try
    ring_nf at *)
  <;>
  (try
    norm_num [Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt] at *)
  <;>
  (try
    omega)
  <;>
  (try
    aesop)
  <;>
  (try
    linarith)
  <;>
  (try
    nlinarith)
  <;>
  (try
    ring_nf)
  <;>
  (try
    norm_num [Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt])
  <;>
  (try
    trivial)
  <;>
  (try
    aesop)