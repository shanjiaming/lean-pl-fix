import Mathlib
/-
Let $R$ be a commutative ring with unity. Then:
  1. Every field is an integral domain.
  2. Not every integral domain is a field.
-/
open CommRing
variable (F : Type) [Field F]
variable (D : Type) [CommRing D] [NoZeroDivisors D]