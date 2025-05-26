theorem integralDomainCharZeroInfinite (hchar : CharP R 0) : Infinite R:=
  by
  have h_charZero : CharZero R:= by -- exact CharP.charP_to_charZero R <;> assumption
    hole
  have h_injective : Function.Injective (Int.cast : ℤ → R):= by -- exact Int.cast_injective
    hole
  have h_infinite : Infinite R:= by -- exact Infinite.of_injective _ h_injective
    hole
  --  exact h_infinite
  hole