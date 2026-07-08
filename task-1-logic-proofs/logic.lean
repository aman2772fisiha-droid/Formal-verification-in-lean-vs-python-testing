variable (A B C D I L M P Q R : Prop)


theorem T51 (h1 : P) (h2 : P → Q) : P ∧ Q := by

-- to prove P ∧ Q , we need to prove P and Q separately by using the constructor tactic which separates the goal into two goals, prooving P, and then proving Q
 constructor
-- we already have proof that P is true( h1), so we use it by the exact tactic.
 exact h1
-- to proove Q we'll use h2 which says : P → Q by using the apply tactic. (this means lean sees that h2 can produice Q if it has prrof of P, so it changes the goal from prooving Q to prooving P)
 apply h2
-- but we already have proof of P, so we use that,hence prooving P
 exact h1



theorem T52 (h1 : P ∧ Q → R) (h2 : Q → P) (h3 : Q) : R := by
  -- If we can proove P ∧ R, then we can proove R(h1), so lets change the goal from R to P ∧ Q by the apply tactic
  apply h1
  -- we have to proove P and Q one at a time, we use constructor to do that,
  constructor
  --to proove P we'll use h2 which says Q → P, so if we can proove Q, we can prove P.
  apply h2
  -- we already have Q true, so we'll use that, thus proving P
  exact h3
  -- then to prove Q we can use exactly h3 again
  exact h3
  -- Proof is now complete.


theorem T53 (h1 : P → Q) (h2 : Q → R) : P → (Q ∧ R) := by
-- Our Goal is to prove Q ∧ R assuming P
  -- Lets Assume P is true. we'll use the intro tactic to do that and give our assumption the name h3, our goal becomes prooving Q ∧ R
  intro h3
  -- To proove Q ∧ R we have to proove Q and R one at a time
  constructor
  -- we know if we proove P, we proove Q (h1), cahnging the goal from Q to P by the apply tactic
  apply h1
  -- and we assumed P is true so we'll use exactly that, Thus prooving Q
  exact h3
  -- Next we proove R, We know R is prooved if Q is prooved(h2), so we use the apply tactic to cange the goal from R to Q
  apply h2
  -- and we know Q is prooved if P is prooved(h1) so lets change the goal from Q to P.
  apply h1
  -- Our Assumption was P is proven. so we use exactly that to proove R is true. Our proof is now complete.
  exact h3

theorem T54 (h1 : P) : Q → P := by
-- Goal is to assume Q, and Proove P
  intro h2
  exact h1
-- goal accomplished

theorem T55 (h1 : P → Q) (h2 : ¬Q) : ¬P := by
-- Lets assume P first, and our goal becomes false
  intro h3
-- now lets find Q from h2
  apply h2
-- the value of Q is now false.
-- now lets find the truth value of P → Q
  apply h1
-- we assumed P is true initially, and we know Q is false. true → false is false. so we use exactly that to prove that P is false.
  exact h3
  -- goal completed


theorem T56 (h1 : P → (Q → R)) : Q → (P → R) := by
-- Goal is assume Q, then Proove P → R
  intro h2
-- assume P, then proove R
  intro h3
-- We know if P is true, then Q is true, R is true. so lets apply that.
  apply h1
-- we assumed p is true, prooving (Q → R) is true exactly.
  exact h3
--we assumed Q is true, exactly prooving (P → R) is true
  exact h2


theorem T57 (h1 : P ∨ (Q ∧ R)) : P ∨ Q := by
 -- lets split the or with cases
  cases h1 with
-- lets represent the left hypthesis P as hp, goal becomes P ∨ Q
  | inl hp =>
-- the left tactic tells lean we are prooving the left side of the goal, which is P
    left
-- our hypothesis hp is P and our goal on the left is also P, exactly. so it is proven.
    exact hp

-- lets represent the Right side of the hypothesis (Q ∧ R) as hqr, Goal becomes P ∨ Q
  | inr hqr =>
-- the right tatic tells lean we are prooving the right side of the goal which is Q
    right
-- our hypothesis was Q ∧ R which were both true, and our goal was Q, exactly,so it is Proven.
    exact hqr.1

theorem T58 (h1 : (L ∧ M) → ¬P) (h2 : I → P) (h3 : M) (h4 : I) : ¬L := by
-- assume L
  intro hl
-- from I we get P
  have hp : P := h2 h4
-- from L and M we get ¬ P
  have hnp : ¬P := h1 ⟨hl, h3⟩
-- so we have both P and ¬ P, a contradiction
  exact hnp hp
-- Therefore, L is impossible → ¬L

theorem T59 : P → P := by
-- Assume P is true
  intro h
-- Then P is already true
  exact h
-- so the statement is proven

theorem T510 : ¬ (P ∧ ¬P) := by
  -- Lets assume both P and ¬ P are true
  intro h
  -- Lets extract the proof of P
  have hp: P := h.1
  -- Lets extract the proof of ¬P
  have hnp: ¬ P := h.2
  -- ¬P says that P leads to a contradiction but since P is true, we get a contradiction
  exact hnp hp
  -- therefore P ∧ ¬P is impossible
