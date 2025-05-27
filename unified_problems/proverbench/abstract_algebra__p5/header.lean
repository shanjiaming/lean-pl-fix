import Mathlib

/-
For a polynomial \(P(x)=ax^4+bx^3+cx^2+dx+e\) of degree four with integer coefficients,
if two roots \(x_1\) and \(x_2\) satisfy that \[x_1+x_2\in\mathbb Q\setminus\left\{\frac{-b}{2a}\right\}\],
then it is true that \(x_1x_2\in\mathbb Q\).
-/

open Polynomial

variable {P : Polynomial ℤ} (hP : P.degree = 4)