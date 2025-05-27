/-- The quotient ring Z_3[x]/(x^3 + x^2 + c) is a field if and only if c = 2. -/
theorem field_iff_c2 (c : ZMod 3) :
IsField (Polynomial (ZMod 3) ⧸ (span {X^3 + X^2 + C c})) ↔ c = 2 :=