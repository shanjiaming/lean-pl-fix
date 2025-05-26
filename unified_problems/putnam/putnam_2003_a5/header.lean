import Mathlib

open MvPolynomial Set

/--
A Dyck $n$-path is a lattice path of $n$ upsteps $(1,1)$ and $n$ downsteps $(1,-1)$ that starts at the origin $O$ and never dips below the $x$-axis. A return is a maximal sequence of contiguous downsteps that terminates on the $x$-axis. Show that there is a one-to-one correspondence between the Dyck $n$-paths with no return of even length and the Dyck $(n-1)$-paths.
-/