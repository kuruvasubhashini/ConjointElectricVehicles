# 1. Conjoint Analysis for Electric Vehicles
Code creates a dashboard that showcases the power of Conjoint Analysis for the Electric Vehicle Lease Market (as at January 2020) in San Francisco.

In January 2020, the following lease offers were available on Electric Vehicles in San Francisco (source: https://electrek.co/best-electric-vehicle-leases/).
![Alt text](Figures/leases.png?raw=true "Electric Vehicle Leases on Offer")
The lease details are contained in the fields monthly_cost, upfront_cost and term. The remaining fields concern specifications of the electic vehicle (e.g. range, Sedan or SUV). The relative popularity of the vehicles can be found here: https://insideevs.com/news/343998/monthly-plug-in-ev-sales-scorecard/

The central piece of data required for the analysis is a conjoint study. This study would seek to understand individuals preferences and the relative importance of different attributes using a series of experiments. 
![Alt text](https://upload.wikimedia.org/wikipedia/commons/8/89/Ice-cream-experiment-example.png)

Given a person's responses, one can subsequently predict which product a person will buy. If the person is rational and the conjoint accurately reflects her preferences, she will choose the product that maximizes her utility. Given the utility scores for three products, U1, U2 and U3, a traditional conjoint predicts a person will choose product 1 with probability exp(U1) / [exp(U1) + exp(U2) + exp(U3)].

As there is no publicly available conjoint data on electric vehicles, user preferences were simulated for the various features in the above table. Here are the simulated preferences on monthly cost for three individuals:
![Alt text](Figures/costScore.png?raw=true "3 individuals cost prefences")
All three individuals have monotonically decreasing utility (i.e. they prefer paying less each month). Person B is the most price sensitive as she has the largest range of utility scores for monthly_cost. For all three people, the sum of the utility scores will be zero. This will be true for **any** attribute.

We examine the same user's utility for the Electric Vehicle range.
![Alt text](Figures/rangeScore.png?raw=true "3 individuals range prefences")
We see all three prefer EVs with larger ranges with Person A ascribing the most importance to vehicle range. We can also measure utilities on categorical variables. A popualar measure would look at the utility people get from various brands.
![Alt text](Figures/brandScore.png?raw=true "3 individuals brand prefences")
Persons A and B strongly prefer Tesla to other brands. Person C does not place much importance on the brand of the Electric Vehicle, but weakly prefers Nissan over Tesla.

Utility Scores are simulated for the 10 attributes above for 560 individuals. The individuals are partioned into three segments: Millenials, Gen X and Boomers. The utility scores are drawn from slightly different distrbutions for each segment.

# 2. Walkthrough of Dashboard
The dashboard has two tabs:
- the first shows the relative attractiveness of the thirteen EVs to the 560 respondents
- the second enables one to run "what-if" scenarios examining the potential financial and market share implications of adjusting the terms of the lease
## 2.1. Product Attractiveness
### 2.1.1. Predicted Market Share
We can use conjoint analysis to predict the EV model each respondent will purchase.
![Alt text](Figures/MarketShare.png?raw=true "Market Share")
We see that Tesla is the most popular brand, chosen by ~60% of the respondents. We can edit lease details using the table on the left, and all the figures in this tab will update to reflect the new lease conditions.

### 2.1.2. Strength of Attraction
The heatmap below shows the strength of attraction of each model's customers. Diagonal elements reflect how strongly the customer prefered their choice to anything else on the market. Tesla, Model X customers are particularly happy with their choice. The off-diagonal values show the relative attractiveness of other EVs to each of the various EV customers. For example, some of the VW, e-tron customers could be persuaded to switch to a Tesla, Model X if the deal was sweetened.
![Alt text](Figures/StrengthOfAttraction.png?raw=true "Attraction")
The right scatter plot shows those respondedents that purchased the EV corresponding to the row which was clicked on. The x-axis shows the probability they purchase the row EV whilst the y-axis  shows the relative utility of the EV corresponding to the column that was clicked on compared to the row EV.

### 2.1.3. Conviction in Choice
The distributions below are for the four groups of users predicted to purchase Chevrolet, Nissan, Tesla and Toyota EVs. 
![Alt text](Figures/MajorBrands.png?raw=true "Conviction")
For each group, the distribution is of the probability that they purchase the vehicle in question. We see those predicted to purchase Tesla EVs are the most likely to indeed do so with Nissan's predicted customers being the next most likely to purchase Nissan EVs.

### 2.1.4. Brand Scavengers
For each EV brand, we can focus on the respondents predicted to buy their vehicles and see how attractive they find their predicted EV-of-choice versus the other seven brands on offer.
![Alt text](Figures/BrandScavengers.png?raw=true "Brand Scavengers")
We see that the Nissan brand order of threat from other brands is Tesla and Chevrolet as these distributions are the most to the right after the Nissan distribution.
