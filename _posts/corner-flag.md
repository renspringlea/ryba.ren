---
layout: post
title: "The economics of taking the ball to the corner flag"
tags: soccer research
---

In soccer, it is common to see the following tactic. Team A has a one-goal lead against Team B. There are just one or two minutes of the match left. So, Team A kicks the ball into their offensive corner of the pitch (i.e. on the same side of the pitch as their opponents' goal, but to the corner of that side of the pitch). Team A then stops the ball dead and fiercely guards the ball to keep the opponents from gaining possession of the ball.

If Team B kicks the ball, it might go out of play, and Team A promptly takes the throw-in or corner kick and puts the ball right back into the corner. If Team B gets annoyed and commits a foul, Team A promptly takes the free kick and puts the ball right back into the corner. It's actually quite a difficult skill for Team B to re-take possession of the ball in this situation, which is why this is an effective time-wasting tactic. This is a way for Team A to wind down the last couple of minutes of the match and maintain their narrow lead until the final whistle.

Let's call this tactic "corner flagging". Corner flagging is legal under the rules of soccer, and it is very common in high-level matches. I don't have any issues with corner flagging—many commentators think that this move is unsporting or unexciting to watch. That might be true, and I'll leave it up to soccer's governing bodies to decide on the rules of the match. However, given the rules and conventions of the sport that we actually have, players in competitive soccer have an obligation to their teams and to their opponents to play to win. Corner flagging is a part of playing to win, and I have no issue with it. (I'm not talking here about unlawful forms of time-wasting. Corner flagging is an unusual form of time-wasting a) because it is legal, and b) because the ball is in play rather than out of play.)

![corner_flag.jpg](/assets/images/corner_flag.jpg){: width='400' }

# Corner flagging contains a trade-off

Corner flagging confuses me. There seems to be an economic trade-off. In short, corner flagging allows Team A to reduce the probability of Team B scoring a goal, but corner flagging also means that Team A are willingly sacrificing their opportunity to score an additional goal.

To illustrate, let's assume that we are in the following typical situation:
- Team A has a one-goal lead over Team B.
- From Team A's perspective, the optimal outcome is a victory. For Team A, it is very important that Team B does not score a goal.
- From Team B's perspective, the optimal outcome is a victory or a draw. For Team B, it is very important to score a goal. (A draw is certainly better than a loss. In fact, in many high-stakes tournaments, a draw will actually result in extra time, which would give Team B the opportunity to score an additional goal and win the match.)
- If Team A actually had a two-goal lead, this would all be a non-issue. Assume, for the sake of argument, that Team B would not be able to come back from a two-goal lead. So, if Team A scores an extra goal, the match is as good as won.
- All of this means that if either team manages to score a goal in these "final" minutes, this is a catastrophically bad outcome for the other team.

Now, corner flagging has the following effects:
- Corner flagging reduces the possession that Team B has for the remainder of the match. This means that the probability of Team B scoring decreases.
- Corner flagging *also reduces the probability of Team A scoring*. Team A has possession, but they aren't attacking Team B's goal. They are simply keeping the ball still.

# Some fancy equations

In the academic economics literature, there are plenty of studies that analyse sport. There are numerous papers on the economics of various soccer tactics, including the unlawful forms of time-wasting. But I haven't seen any papers on the economics of corner flagging.

![corner_flag_graph.png](/assets/images/corner_flag_graph.png){: width='600' }  

This graph reveals that, at least under our simple model, the decision to corner flag is a very simple one. It is optimal for Team A to corner flag if, and only if, *the probability of Team B scoring a goal per unit time is greater than that of Team A*.

Let's define some quantities:
- During each second of "active" play (i.e. play in which the ball is not at the corner), Team A can score (with a probability of $$p_A$$). Or, Team B can score ($$p_B$$). It should be clear that $$p_A + p_B + p_0 = 1$$.
- Let's imagine two durations of time (measured in seconds). The amount of time remaining in the game if Team A decides not to corner flag is $$t_1$$. However, if Team A indeed decides to corner flag, there is effectively less "active" game time remaining. Let's call this shorter duration $$t_2$$. Of course, $$t_1 > t_2$$.

What happens if Team A decides not to corner flag, i.e. they play the match as usual, trying to score an additional goal in the final minutes? In this scenario, Team A might score a goal, or Team B might score a goal. In expectation, Team A can calculate its probability of winning using the following expression:

$$(p_A + p_0)\times t_1 - (p_B\times t_1) $$


This means one of three things is true:
1. My simple model is wrong.
2. My simple model is correct, and players are incorrectly corner flagging too frequently in reality.
3. My simple model is correct, players are correctly corner flagging the right amount in reality.
