import Mathlib

open Polynomial Real Complex Matrix Filter Topology

/--
In three-dimensional Euclidean space, define a \emph{slab} to be the open set of points lying between two parallel planes. The distance between the planes is called the \emph{thickness} of the slab. Given an infinite sequence $S_1, S_2, \dots$ of slabs of thicknesses $d_1, d_2, \dots,$ respectively, such that $\Sigma_{i=1}^{\infty} d_i$ converges, prove that there is some point in the space which is not contained in any of the slabs.
-/