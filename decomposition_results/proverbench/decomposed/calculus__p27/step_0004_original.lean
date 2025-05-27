theorem h₃ (h1 : partial_t 2 π = deriv (fun τ => g 2 τ) π) : (fun τ => g 2 τ) = fun τ => 2 ^ 2 * cos τ ^ 2 + 2 ^ 3 * τ ^ 3 + 2 ^ 8 :=
  by
  funext τ
  simp [g, f, x, y, z, pow_three, pow_two, mul_assoc, mul_comm, mul_left_comm] <;> ring_nf <;> norm_num <;>
        simp [cos_sq, sin_sq] <;>
      ring_nf <;>
    norm_num