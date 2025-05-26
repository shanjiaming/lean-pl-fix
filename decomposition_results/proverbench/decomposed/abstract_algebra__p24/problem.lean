theorem integralDomainCharZeroInfinite (hchar : CharP R 0) : Infinite R := by
  have h_charZero : CharZero R := by
    -- Use the lemma `CharP.charP_to_charZero` to deduce `CharZero R` from `CharP R 0`.
    exact CharP.charP_to_charZero R
    <;> assumption
  
  have h_injective : Function.Injective (Int.cast : ℤ → R) := by
    -- Use the fact that `R` is `CharZero` to get injectivity of the integer cast.
    exact Int.cast_injective
  
  have h_infinite : Infinite R := by
    -- Use the fact that `ℤ` is infinite and the injective map to deduce `R` is infinite.
    exact Infinite.of_injective _ h_injective
  
  exact h_infinite