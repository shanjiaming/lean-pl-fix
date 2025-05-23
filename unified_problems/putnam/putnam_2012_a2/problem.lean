theorem putnam_2012_a2
(S : Type*) [CommSemigroup S]
(a b c : S)
(hS : ∀ x y : S, ∃ z : S, x * z = y)
(habc : a * c = b * c)
: a = b := by
  have h_right_identity : ∃ (e : S), ∀ (x : S), x * e = x := by
    obtain ⟨e, he⟩ := hS a a
    refine' ⟨e, _⟩
    intro x
    obtain ⟨z, hz⟩ := hS a x
    have h1 : x * e = (a * z) * e := by rw [hz]
    have h2 : (a * z) * e = a * (z * e) := by rw [mul_assoc]
    have h3 : a * (z * e) = a * (e * z) := by
      rw [mul_comm z e]
    have h4 : a * (e * z) = (a * e) * z := by rw [mul_assoc]
    have h5 : (a * e) * z = a * z := by rw [he]
    have h6 : a * z = x := by rw [hz]
    calc
      x * e = (a * z) * e := by rw [h1]
      _ = a * (z * e) := by rw [h2]
      _ = a * (e * z) := by rw [h3]
      _ = (a * e) * z := by rw [h4]
      _ = a * z := by rw [h5]
      _ = x := by rw [h6]
  
  have h_main : a = b := by
    obtain ⟨e, he⟩ := h_right_identity
    have h1 : ∃ (z : S), c * z = e := by
      have h2 : ∃ (z : S), c * z = e := by
        have h3 : ∃ (z : S), c * z = e := by
          exact hS c e
        exact h3
      exact h2
    obtain ⟨z, hz⟩ := h1
    have h2 : a * e = a := by
      apply he
    have h3 : b * e = b := by
      apply he
    have h4 : a * (c * z) = b * (c * z) := by
      calc
        a * (c * z) = (a * c) * z := by rw [mul_assoc]
        _ = (b * c) * z := by rw [habc]
        _ = b * (c * z) := by rw [mul_assoc]
    have h5 : a * e = b * e := by
      calc
        a * e = a * (c * z) := by
          calc
            a * e = a * (c * z) := by rw [hz]
            _ = a * (c * z) := by rfl
        _ = b * (c * z) := by rw [h4]
        _ = b * e := by
          calc
            b * (c * z) = b * (c * z) := by rfl
            _ = b * e := by rw [hz]
    have h6 : a = b := by
      calc
        a = a * e := by rw [h2]
        _ = b * e := by rw [h5]
        _ = b := by rw [h3]
    exact h6
  
  exact h_main