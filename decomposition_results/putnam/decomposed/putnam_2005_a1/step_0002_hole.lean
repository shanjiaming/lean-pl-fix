theorem h_main (n : ℤ) (hn : n > 0) : ∃ k a, n = ∑ i, 2 ^ a i 0 * 3 ^ a i 1 ∧ ∀ (i j : Fin k), i ≠ j → ¬2 ^ a i 0 * 3 ^ a i 1 ∣ 2 ^ a j 0 * 3 ^ a j 1 :=
  by
  --  use 1
  --  use fun _ => fun j => if j = 0 then (Nat.log 2 n.natAbs).toNat else (Nat.log 3 n.natAbs).toNat
  constructor
  ·
    simp [Fin.sum_univ_succ] <;> norm_num <;> (try contradiction) <;>
        (try {norm_num at hn ⊢ <;> ring_nf at hn ⊢ <;> norm_cast at hn ⊢ <;> simp_all [Fin.forall_fin_one] <;> aesop
          }) <;>
      (try {norm_num at hn ⊢ <;> ring_nf at hn ⊢ <;> norm_cast at hn ⊢ <;> simp_all [Fin.forall_fin_one] <;> aesop
        })
  · intro i j hij
    fin_cases i <;> fin_cases j <;> simp_all (config := { decide := true }) <;> norm_num at hij ⊢ <;>
        simp_all [Fin.forall_fin_one] <;>
      aesop
  hole