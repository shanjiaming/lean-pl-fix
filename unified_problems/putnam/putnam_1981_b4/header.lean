import Mathlib

open Topology Filter Set Polynomial Function

-- False
/--
Let $V$ be a set of $5$ by $7$ matrices, with real entries and with the property that $rA+sB \in V$ whenever $A,B \in V$ and $r$ and $s$ are scalars (i.e., real numbers). \emph{Prove or disprove} the following assertion: If $V$ contains matrices of ranks $0$, $1$, $2$, $4$, and $5$, then it also contains a matrix of rank $3$. [The rank of a nonzero matrix $M$ is the largest $k$ such that the entries of some $k$ rows and some $k$ columns form a $k$ by $k$ matrix with a nonzero determinant.]
-/