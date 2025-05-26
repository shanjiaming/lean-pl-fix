theorem h4 (S : Type u_1) (inst✝ : Mul S) (hself : ∀ (x : S), x * x = x) (h2✝ : ∀ (x y z : S), x * y * z = y * z * x) (x y : S) (h1 : x * y * (y * x) = y * (y * x) * x) (h2 : y * (y * x) * x = y * x) (h3 : x * y * (y * x) = y * x) : x * y * (y * x) = x * y :=
  by
  have h4₁ := h2 (x * y) (y * x) (x * y)
  have h4₂ := h2 (y * x) (x * y) (y * x)
  have h4₃ := h2 x y (y * x)
  have h4₄ := h2 y x (x * y)
  have h4₅ := h2 (x * y) y x
  have h4₆ := h2 y (x * y) x
  simp [hself, mul_assoc] at h4₁ h4₂ h4₃ h4₄ h4₅ h4₆ ⊢ <;> (try simp_all [mul_assoc]) <;>
                (try ring_nf at * <;> simp_all [mul_assoc]) <;>
              (try nlinarith) <;>
            (try omega) <;>
          (try linarith) <;>
        (try nlinarith) <;>
      simp_all [mul_assoc] <;>
    nlinarith
  hole