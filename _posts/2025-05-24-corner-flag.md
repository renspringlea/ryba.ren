---  
layout: post  
title: "* The economics of taking the ball to the corner flag in soccer"  
tags: soccer research my-favorites  
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
- If Team A actually had a two-goal lead, this would all be a non-issue. Assume, for the sake of argument, that Team B would not be able to come back from a two-goal lead. So, if Team A is ahead by one goal and scores an extra goal, the match is as good as won.  
- All of this means that if either team manages to score a goal in these "final" minutes, this is a catastrophically bad outcome for the other team.  

Now, corner flagging has the following effects:  
- Corner flagging reduces the possession that Team B has for the remainder of the match. This means that the probability of Team B scoring decreases.  
- Corner flagging *also reduces the probability of Team A scoring*. Team A has possession, but they aren't attacking Team B's goal. They are simply keeping the ball still, holding up play to reduce the effective time remaining in the match.  

# Some fancy equations  

In the academic economics literature, there are plenty of studies that analyse sport. There are numerous papers on the economics of various soccer tactics, including decisions when taking penalty kicks and the frequency of unlawful forms of time-wasting. But I haven't seen any papers on the economics of corner flagging.  

Let us define $$p_A$$ as the probability that A scores a goal in  a particular second of time remaining in the match. Likewise, $$p_B$$ is the probability per second of B scoring a goal in the remaining time of the match.  

Consider the case where team A chooses *not* to corner flag. The number of goals $$G_1$$ that each team can be expected to score in a particular period of time is, therefore, the probability per second for that team $$p$$ multiplied by the amount of time remaining, $$t_1$$. Here, the subscript $$1$$ denotes the scenario where team A is choosing not to corner flag.  

$$G_A = p_A\times t_1$$  

$$G_B = p_B\times t_1$$  

In this "no corner flagging" scenario, we can obtain the expected difference in goals during the time period remaining. Let's call this goal difference $$D$$, and we calculate it by simply subtracting $$G_B$$ from $$G_A$$.  

$$D_1 = G_{A1} - G_{B1}$$  

$$D_1 = p_A\times t_1 - p_B\times t_1$$  

$$D_1 = t_1(p_A - p_B)$$  

What about the situation where team A chooses to corner flag? Here, team A is effectively choosing to reduce the time available in this game. This means we have to swap out $$t_1$$ for a smaller time period, which we can call $$t_2$$.  

$$t_1 > t_2$$  

This smaller time period means that we have to define a second goal difference, $$D_2$$. This is the conceptually the same as $$D_1$$. The difference is that $$D_1$$ is the expected difference in goals scored during the remaining time in the match if team A chooses *not* to corner flag, while $$D_2$$ is the expected difference in goals scored during the remaining time in the match if team A chooses to *indeed* corner flag. The only difference is that $$D_2$$ results from a smaller time period.  

$$D_2 = G_{A2} - G_{B2}$$  

$$D_2 = p_A\times t_2 - p_B\times t_2$$  

$$D_2 = t_2(p_A - p_B)$$  

Now, recall that Team A's decision is whether or not they would like to corner flag. Team A has to make a judgment: will corner flagging make them more likely or less likely to win the match?  

For Team A, it is optimal to corner flag if the expected goal difference from corner flagging $$D_2$$ is greater than the expected goal difference from *not* corner flagging $$D_1$$.  

$$D_2 > D_1$$  

We can see when this condition is met by substituting in the expressions for $$D_1$$ and $$D_2$$:  

$$D_2 > D_1$$  

$$p_A\times t_2 - p_B\times t_2 > p_A\times t_1 - p_B\times t_1$$  

Then, we can simply rearrange and simplify:  

$$p_A\times t_2 - p_A\times t_1 > p_B\times t_2 - p_B\times t_1$$  

$$p_A\times (t_2 - t_1) > p_B\times (t_2 - t_1)$$  

$$p_A < p_B$$  

Pay careful attention to that final line. The direction of the inequality has changed; this is because we divided both sides by $$(t_2 - t_1)$$. $$(t_2 - t_1)$$ is always a negative number, as $$t_2$$ is always smaller than $$t_1$$. Dividing both sides by a negative number reverses the inequality, under the rules of algebra.  

## What does this all mean?  
Now, the maths above gave us a very interesting result! We learned that it is optimal for team A to corner flag if, and only if, the probability of team B scoring a goal per unit time is greater than the probability of team A scoring a goal per unit time. The actual amount of time remaining doesn't affect the decision.  

So, if a team is ahead by 1 goal, that team should only corner flag if they think they're more likely to concede a goal in a given period of time than they are to score a goal. In this case, it is better to effectively reduce the amount of time remaining in the match, and this is achieved by corner flagging.  

This is an unexpected result! There are two reasons why I find this result unexpected.  

The first reason is that if you watch professional soccer, corner flagging is actually very common in reality. When a team is ahead by one goal, they very frequently choose to corner flag in the final minutes. Do all of those teams actually think that they are more likely to concede a goal than score a goal in the final minutes? Maybe, or maybe not.  

The second reason why I find this result surprising is that teams rarely corner flag when there is a very long period of time remaining. Corner flagging tends to occur when there are just a few minutes left on the clock. When there are 20 or 40 or 60 minutes remaining, we very rarely see corner flagging. However, as we saw in the maths above, the actual amount of time remaining doesn't affect the decision to corner flag or not.  

There are a few possibilities that could explain the discrepancy between our model and the reality that we actually observe:  
- These teams might indeed consistently think that they are more likely to concede a goal than score a goal in the final minutes. If this is the case, then our model accurately represents reality and players are aware of this arithmetic (whether consciously or subconsciously).  
- There might be other factors that are not included in our model. For example, corner flagging involves placing the ball in a pretty advantageous spot on the pitch (the corner closest to the goal that you are attacking), and it tends to draw a couple of opponents to this position which reduces the number of players available to the other time in other spots on the pitch. It could be that these on-pitch movements actually change $$p_A$$ and $$p_B$$. Our model doesn't allow for these probabilities to vary.  
- It could be that our model accurately represents reality and that professional soccer players are often making a mistake when choosing to corner flag. Given the high level of skill involved among the players and the coaching staff, I find this pretty unlikely. However, there have been times in the history of sport when professional athletes have adopted a particular strategy despite that strategy being demonstrably suboptimal, so it is not unimaginable that professional soccer players are actually making a mistake here.  
