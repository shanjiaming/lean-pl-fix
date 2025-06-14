import Mathlib

open Nat

/--
Prove that for $m = 5 \pmod 6$,
\[
\binom{m}{2} - \binom{m}{5} + \binom{m}{8} - \binom{m}{11} + ... - \binom{m}{m-6} + \binom{m}{m-3} \neq 0.
\]
-/