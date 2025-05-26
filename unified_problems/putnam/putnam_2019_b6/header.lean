import Mathlib

open Topology Filter Set Matrix

-- Set.Ici 1
/--
Let \( \mathbb{Z}^n \) be the integer lattice in \( \mathbb{R}^n \). Two points in \( \mathbb{Z}^n \) are called neighbors if they differ by exactly 1 in one coordinate and are equal in all other coordinates. For which integers \( n \geq 1 \) does there exist a set of points \( S \subset \mathbb{Z}^n \) satisfying the following two conditions? \begin{enumerate} \item If \( p \) is in \( S \), then none of the neighbors of \( p \) is in \( S \). \item If \( p \in \mathbb{Z}^n \) is not in \( S \), then exactly one of the neighbors of \( p \) is in \( S \). \end{enumerate}
-/