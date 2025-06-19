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
    have h1 : x * e = (a * z) * e := by admit
    have h2 : (a * z) * e = a * (z * e) := by admit
    have h3 : a * (z * e) = a * (e * z) := by
      admit
    have h4 : a * (e * z) = (a * e) * z := by admit
    have h5 : (a * e) * z = a * z := by admit
    have h6 : a * z = x := by simpa
    admit
  
  have h_main : a = b := by
    obtain ⟨e, he⟩ := h_right_identity
    have h1 : ∃ (z : S), c * z = e := by
      have h2 : ∃ (z : S), c * z = e := by
        have h3 : ∃ (z : S), c * z = e := by
          admit
        simpa
      simpa
    obtain ⟨z, hz⟩ := h1
    have h2 : a * e = a := by
      admit
    have h3 : b * e = b := by
      admit
    have h4 : a * (c * z) = b * (c * z) := by
      admit
    have h5 : a * e = b * e := by
      admit
    have h6 : a = b := by
      admit
    simpa
  
  simpa
