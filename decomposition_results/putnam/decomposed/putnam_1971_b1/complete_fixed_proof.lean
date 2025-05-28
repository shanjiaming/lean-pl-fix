theorem putnam_1971_b1 (S : Type*) [Mul S] (hself : ∀ x : S, x * x = x) (h2 : ∀ x y z : S, (x * y) * z = (y * z) * x) :
  (∀ x y z : S, (x * y) * z = x * (y * z)) ∧ (∀ x y : S, x * y = y * x):=
  by
  have h_comm : ∀ x y : S, x * y = y * x:= by
    intro x y
    have h1 : (x * y) * (y * x) = (y * (y * x)) * x:=
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
    have h2 : (y * (y * x)) * x = (y * x):= by
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
    have h3 : (x * y) * (y * x) = (y * x):= by
      calc
        (x * y) * (y * x) = (y * (y * x)) * x := by rw [h1]
        _ = (y * x) := by rw [h2]
      hole
    have h4 : (x * y) * (y * x) = (x * y):=
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
    have h5 : x * y = y * x:= by
      calc
        x * y = (x * y) * (y * x) := by rw [h4]
        _ = y * x := by rw [h3]
      hole
    exact h5
    hole
  have h_assoc : ∀ x y z : S, (x * y) * z = x * (y * z):=
    by
    intro x y z
    have h3 : (x * y) * z = (y * z) * x := h2 x y z
    have h4 : (y * z) * x = x * (y * z):= by rw [h_comm (y * z) x]
      hole
    calc
      (x * y) * z = (y * z) * x := h3
      _ = x * (y * z) := h4
    hole
  have h_main : (∀ x y z : S, (x * y) * z = x * (y * z)) ∧ (∀ x y : S, x * y = y * x):= by exact ⟨h_assoc, h_comm⟩
    hole
  exact h_main
  hole