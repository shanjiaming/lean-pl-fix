theorem putnam_1978_b2 : (∑' i : ℕ+, ∑' j : ℕ+, (1 : ℚ) / (i ^ 2 * j + 2 * i * j + i * j ^ 2) = ((7 / 4) : ℚ)):=
  by
  have h_main : (∑' i : ℕ+, ∑' j : ℕ+, (1 : ℚ) / (i ^ 2 * j + 2 * i * j + i * j ^ 2)) = (7 / 4 : ℚ):=
    by
    have h₁ : (∑' i : ℕ+, ∑' j : ℕ+, (1 : ℚ) / (i ^ 2 * j + 2 * i * j + i * j ^ 2)) = (7 / 4 : ℚ):=
      by
      have h₂ : (∑' i : ℕ+, ∑' j : ℕ+, (1 : ℚ) / (i ^ 2 * j + 2 * i * j + i * j ^ 2)) = (7 / 4 : ℚ):= by
        --  rw [tsum_congr
        --          (fun i ↦ by
        --            rw [tsum_congr
        --                (fun j ↦
        --                  by
        --                  have h₃ : (i : ℚ) ^ 2 * j + 2 * i * j + i * j ^ 2 = i * j * (i + j + 2) := by
        --                    ring_nf <;> simp [mul_assoc, mul_comm, mul_left_comm] <;> ring_nf <;> norm_cast <;>
        --                        simp [Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat] <;>
        --                      ring_nf
        --                  rw [h₃] <;> field_simp <;> ring_nf <;> simp [mul_assoc, mul_comm, mul_left_comm] <;> ring_nf <;>
        --                        norm_cast <;>
        --                      simp [Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat] <;>
        --                    ring_nf)])] <;>
        --      norm_num <;>
        --    rfl
        hole
      --  exact h₂
      linarith
    --  exact h₁
    linarith
  --  exact h_main
  linarith