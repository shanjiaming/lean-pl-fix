theorem putnam_1995_b3
(n : ℕ)
(hn : n > 0)
(digits_set : Set (ℕ → ℕ))
(hdigits_set : digits_set = {f | f 0 ≠ 0 ∧ (∀ i : Fin (n ^ 2), f i ≤ 9) ∧ (∀ i ≥ n ^ 2, f i = 0)})
(digits_to_matrix : (ℕ → ℕ) → Matrix (Fin n) (Fin n) ℤ)
(hdigits_to_matrix : digits_to_matrix = fun f => (fun i j => f (i.1 * n + j.1)))
: ∑' f : digits_set, (digits_to_matrix f).det = ((fun n => if n = 1 then 45 else if n = 2 then 10 * 45^2 else 0) : ℕ → ℤ ) n := by