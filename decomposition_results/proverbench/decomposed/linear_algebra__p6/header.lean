import Mathlib

/-
Let $A$ be the coefficient matrix of the systems $Ax = b_1$ and $Ax = b_2$, where
$$A = \begin{pmatrix}
1 & 2 & -1 \\
2 & 3 & 1 \\
1 & -1 & 2
\end{pmatrix},
b_1 = \begin{pmatrix}
0 \\
3 \\
3
\end{pmatrix},
b_2 = \begin{pmatrix}
1 \\
7 \\
4
\end{pmatrix}.$$
If $\text{rank}(A) = 3$, then both systems have unique solutions given by $x_1 = (1, 0, 1)$ and $x_2 = (1, 1, 2)$ respectively.
-/

variable {R : Type _} [CommRing R]

def A : Matrix (Fin 3) (Fin 3) ℚ :=
![![1, 2, -1], ![2, 3, 1], ![1, -1, 2]]

def b1 : Fin 3 → ℚ :=
![0, 3, 3]

def b2 : Fin 3 → ℚ :=
![1, 7, 4]

variable (hrank_A : Matrix.rank A = 3)