import Mathlib

open Nat

/--
Show that every positive integer is a sum of one or more numbers of the form $2^r 3^s$, where $r$ and $s$ are nonnegative integers and no summand divides another.
-/
theorem putnam_2005_a1
: ∀ n : ℤ, n > 0 → (∃ k : ℕ, ∃ a : Fin k → Fin 2 → ℕ, n = ∑ i : Fin k, (2^(a i 0) : ℤ) * 3^(a i 1) ∧
(∀ i j : Fin k, i ≠ j → ¬(2^(a i 0)*3^(a i 1) ∣ 2^(a j 0)*3^(a j 1)))) := by
  intro n hn
  have h_main : ∃ (k : ℕ) (a : Fin k → Fin 2 → ℕ), (n : ℤ) = ∑ i : Fin k, (2 ^ (a i 0) : ℤ) * 3 ^ (a i 1) ∧ (∀ i j : Fin k, i ≠ j → ¬(2 ^ (a i 0) * 3 ^ (a i 1) ∣ 2 ^ (a j 0) * 3 ^ (a j 1))) := by
    use 1
    use fun _ => fun j => if j = 0 then (Nat.log 2 n.natAbs).toNat else (Nat.log 3 n.natAbs).toNat
    constructor
    · -- Prove n = ∑ i : Fin 1, (2 ^ (a i 0) : ℤ) * 3 ^ (a i 1)
      simp [Fin.sum_univ_succ]
      <;>
      norm_num <;>
      (try contradiction) <;>
      (try {
        norm_num at hn ⊢
        <;>
        ring_nf at hn ⊢ <;>
        norm_cast at hn ⊢ <;>
        simp_all [Fin.forall_fin_one]
        <;>
        aesop
      }) <;>
      (try {
        norm_num at hn ⊢
        <;>
        ring_nf at hn ⊢ <;>
        norm_cast at hn ⊢ <;>
        simp_all [Fin.forall_fin_one]
        <;>
        aesop
      })
    · -- Prove ∀ (i j : Fin 1), i ≠ j → ¬2 ^ (a i 0) * 3 ^ (a i 1) ∣ 2 ^ (a j 0) * 3 ^ (a j 1)
      intro i j hij
      fin_cases i <;> fin_cases j <;> simp_all (config := {decide := true})
      <;>
      norm_num at hij ⊢ <;>
      simp_all [Fin.forall_fin_one]
      <;>
      aesop
  obtain ⟨k, a, h₁, h₂⟩ := h_main
  refine' ⟨k, a, _⟩
  simp_all [Fin.sum_univ_cast]
  <;>
  norm_num at *
  <;>
  simp_all [Fin.forall_fin_one]
  <;>
  aesop