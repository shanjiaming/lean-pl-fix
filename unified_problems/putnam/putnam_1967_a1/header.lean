import Mathlib

open Nat Topology Filter

/--
Let $f(x)=a_1\sin x+a_2\sin 2x+\dots+a_n\sin nx$, where $a_1,a_2,\dots,a_n$ are real numbers and where $n$ is a positive integer. Given that $|f(x)| \leq |\sin x|$ for all real $x$, prove that $|a_1|+|2a_2|+\dots+|na_n| \leq 1$.
-/