theorem h2 (S : Type u_1) (inst✝ : Mul S) (hself : ∀ (x : S), x * x = x) (h2 : ∀ (x y z : S), x * y * z = y * z * x) (x y : S) (h1 : x * y * (y * x) = y * (y * x) * x) : y * (y * x) * x = y * x := by
  have h2₁ := h2 y (y * x) x
  have h2₂ := h2 y x x
  have h2₃ := h2 x y y
  have h2₄ := h2 (y * x) x y
  have h2₅ := h2 x (y * x) y
  have h2₆ := h2 y y x
  simp [hself, mul_assoc] at h2₁ h2₂ h2₃ h2₄ h2₅ h2₆ ⊢ <;> (try simp_all [mul_assoc]) <;>
                (try ring_nf at * <;> simp_all [mul_assoc]) <;>
              (try nlinarith) <;>
            (try omega) <;>
          (try linarith) <;>
        (try nlinarith) <;>
      simp_all [mul_assoc] <;>
    nlinarith
  hole