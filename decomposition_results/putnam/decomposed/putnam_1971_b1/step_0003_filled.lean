theorem h1 (S : Type u_1) (inst✝ : Mul S) (hself : ∀ (x : S), x * x = x) (h2 : ∀ (x y z : S), x * y * z = y * z * x) (x y : S) : x * y * (y * x) = y * (y * x) * x :=
  by
  have h1₁ := h2 (x * y) y x
  have h1₂ := h2 x y (y * x)
  have h1₃ := h2 y x x
  have h1₄ := h2 y (y * x) x
  have h1₅ := h2 (y * x) x y
  have h1₆ := h2 x (y * x) y
  simp [hself, mul_assoc] at h1₁ h1₂ h1₃ h1₄ h1₅ h1₆ ⊢ <;> (try simp_all [mul_assoc]) <;>
                (try ring_nf at * <;> simp_all [mul_assoc]) <;>
              (try nlinarith) <;>
            (try omega) <;>
          (try linarith) <;>
        (try nlinarith) <;>
      simp_all [mul_assoc] <;>
    nlinarith
  hole