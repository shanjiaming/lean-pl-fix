theorem integralDomainCharZeroInfinite (hchar : sorry) : Infinite sorry :=
  by
  have h_charZero : CharZero R := by sorry
  have h_injective : Function.Injective (Int.cast : ℤ → R) := by sorry
  have h_infinite : Infinite R := by sorry
  --  exact h_infinite
  hole