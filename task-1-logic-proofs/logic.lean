variable (A B C D I L M P Q R : Prop)


theorem T51 (h1 : P) (h2 : P → Q) : P ∧ Q := by

-- to prove P ∧ Q , we need to prove P and Q separately by using the constructor tactic which separates the goal into two goals, prooving P, and then proving Q
 constructor
-- we already have proof that P is true( h1), so we use it by the exact tactic.
 exact h1
-- to proove Q we'll use h2 which says : P → Q by using the apply tactic. (this means lean sees that h2 can produice Q if it has proof of P, so it changes the goal from prooving Q to prooving P)
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
  -- we already have h3 : Q true, so we'll use that, thus proving P
  exact h3
  -- then to prove Q we can use exactly h3 again
  exact h3
  -- Proof is now complete.


theorem T53 (h1 : P → Q) (h2 : Q → R) : P → (Q ∧ R) := by
-- Our Goal is to prove Q ∧ R assuming P
  -- Lets Assume P is true. we'll use the intro tactic to do that and give our assumption the name hp, our goal becomes prooving Q ∧ R
  intro hp
  -- To proove Q ∧ R we have to proove Q and R one at a time
  constructor
  -- we know if we proove P, we proove Q (h1), cahnging the goal from Q to P by the apply tactic
  apply h1
  -- and we assumed P is true so we'll use exactly that, Thus prooving Q
  exact hp
  -- Next we proove R, We know R is prooved if Q is prooved(h2), so we use the apply tactic to cange the goal from R to Q
  apply h2
  -- and we know Q is prooved if P is prooved(h1) so lets change the goal from Q to P.
  apply h1
  -- Our Assumption was P is proven. so we use exactly that to proove R is true. Our proof is now complete.
  exact hp

theorem T54 (h1 : P) : Q → P := by
-- Goal is to assume Q, and Proove P
  intro hq
  exact h1
-- goal accomplished

theorem T55 (h1 : P → Q) (h2 : ¬Q) : ¬P := by
-- Lets assume P first.
  intro h3
  -- Our goal is False, since ¬P means P → False.
  -- We can get False by applying h2 if we prove Q.
  apply h2
  -- Prove Q using the implication P → Q.
  apply h1
 -- We already assumed P.
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
-- our hypothesis was Q ∧ R which were both true, and our goal was Q which can be expressed as hqr.1, exactly,so it is Proven.
    exact hqr.1

theorem T58 (h1 : (L ∧ M) → ¬P) (h2 : I → P) (h3 : M) (h4 : I) : ¬L := by
  -- Assume L.
  intro h5
  -- Use h1. We must prove L ∧ M.
  apply h1
  -- Split the conjunction into two goals.
  constructor
  -- Prove L using our assumption.
  exact h5
  -- Prove M using h3.
  exact h3
  -- Now prove P.
  apply h2
  -- We already know I.
  exact h4

theorem T59 : P → P := by
-- Assume P is true
  intro h
-- goal matches assumption exactly
  exact h
-- so the statement is proven

theorem T510 : ¬ (P ∧ ¬P) := by
  -- Assume P ∧ ¬P.
  intro h
-- Extract the proof of P.
  have hp : P := h.1
-- Extract the proof of ¬P.
  have hnp : ¬ P := h.2
-- Apply ¬P to P to obtain a contradiction.
  exact hnp hp
  -- Therefore, P ∧ ¬P cannot be true.
