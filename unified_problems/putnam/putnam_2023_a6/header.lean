import Mathlib

open Finset

-- {n : ℕ | 0 < n}
/--
Alice and Bob play a game in which they take turns choosing integers from $1$ to $n$. Before any integers are chosen, Bob selects a goal of 'odd' or 'even'. On the first turn, Alice chooses one of the $n$ integers. On the second turn, Bob chooses one of the remaining integers. They continue alternately choosing one of the integers that has not yet been chosen, until the $n$th turn, which is forced and ends the game. Bob wins if the parity of $\{k : \mbox{the number $k$ was chosen on the $k$th turn}\}$ matches his goal. For which values of $n$ does Bob have a winning strategy?
-/