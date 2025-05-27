import Mathlib

open Function Nat

-- (fun n : ℕ ↦ 2 ^ ⌊(n + 2) / 2⌋₊ + 2 ^ ⌊(n + 1) / 2⌋₊ - 2)

/--
Given a finite string $S$ of symbols $X$ and $O$, we write $\Delta(S)$ for the number of $X$'s in $S$ minus the number of $O$'s. For example, $\Delta(XOOXOOX)=-1$. We call a string $S$ \emph{balanced} if every substring $T$ of (consecutive symbols of) $S$ has $-2 \leq \Delta(T) \leq 2$. Thus, $XOOXOOX$ is not balanced, since it contains the substring $OOXOO$. Find, with proof, the number of balanced strings of length $n$.
-/