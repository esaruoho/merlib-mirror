---
title: "Finance Questions"
source_domain: amasci.com
source_path: ~fritzsch/game/faq.finance.html
order: 3197
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T05:56:36Z
extractor: site_to_paper.py (pandoc)
---

# Finance Questions

*Source page: `~fritzsch/game/faq.finance.html`*

# Finance Questions

<span id="F1"></span>

### 1. Tax loss carry-forward

\
I don't think our tax loss carry-forward is correct.

### Answer

Thanks for your question about the tax loss carry-forward. I regret that the calculations do not show on your reports because it would be easier to see the effects.

Your parent company's tax bill is based on consolidated income, rather than only the income in the home area. Taxes paid by subsidiaries constitute a credit to the parent company tax bill. Current period income is reduced by a tax loss carry-forward, if any, from the previous quarter.\
The calculation is easy to see when there is a consolidated net loss, as you had in Year 3, Quarter 1.

     Consolidated Net Loss Before Tax        $-101
     Less Income Tax paid by subsidiaries     - 60

    Net Loss after tax                       $-161

Note that this is not the same as the loss in Area 1 (\$-206), attributed to the parent company. The subsidiaries paid \$60 tax on \$154 income (60/.39). This income, already taxed to the subsidiary, reduces the consolidated loss. Adding it back establishes the tax loss carry-forward for the parent:

     Consolidated Net Loss Before Tax        $-101
     Less Subsidiary Income already taxed     -154

     Parent tax-loss carry-forward           $-255

Then, in Year 3, Quarter 2,

     Consolidated Net Profit Before Tax      $ 188
     Less tax loss carry-forward              -255

     Consolidated Taxable Income             $ -67
     Taxes paid by subsidiaries                -85
     Less subsidiary income                   -218

     Parent tax-loss carry-forward           $-285

Note that there is a tax loss carry-forward, even though there was a profit of \$207 in Area 1, due to the loss in Sereno.\
Then, in Year 3, Quarter 3:

     Consolidated Net Loss Before Tax        $-138
     Less tax loss carry-forward              -285

     Consolidated Taxable Income             $-423
     Taxes paid by subsidiaries               -101
     Less subsidiary income                   -259

     Parent tax-loss carry-forward           $-682

In Year 3, Quarter 4 there was a consolidated profit

     Consolidated Net Profit Before Tax      $ 437
     Less tax loss carry-forward              -682

     Consolidated Taxable Income             $-245
     Taxes paid by subsidiaries               -226
     Less subsidiary income                   -579

     Parent tax loss carry-forward           $-824

During Year 4, your firm had a consolidated net profit each quarter, including untaxed profits in Sereno (not taxed because of a peso tax loss carry-forward). It may be instructive for you to "do the sums" for the first three quarters of Year 4. At the end of Quarter 3, the tax loss carry-forward was \$169 thousand.\
For Year 4, Quarter 4:

     Consolidated Net Profit Before Tax      $1456
     Less tax loss carry-forward              -169

     Consolidated Taxable Income             $1287
     Tax at 39%                                502
     Less taxes paid by subsidiaries          -370

     Net tax bill for parent company         $ 132

<span id="F2"></span>

### 2. Depreciation expense

To calculate depreciation expense per quarter for equipment: What is the depreciation (\$ or P) amount for equipment in Sereno?

### Answer

Equipment is depreciated on a straight-line basis over 7 years. So depreciation charges each quarter are calculated as 1/28th (3.5714 percent) of the original book value of all equipment in place during the quarter. This applies both to peso values in Sereno and dollar values in Merica.

Equipment depreciation is covered in more detail on pages 111-112 of the BPG Player's Manual. <span id="F3"></span>

### 3. Inflation

Is maintenance expense subject to inflation?

### Answer

Maintenance costs, along with virtually all other costs and expenses in the simulation are subject to the effect of inflation. <span id="F4"></span>

### 4. ROI calculation

On page F1 of the Quarterly Industry Report, we are curious as to how "Investor ROI" is calculated. How might we estimate future ROIs? Can you please enlighten us?

### Answer

The formula for calculating Investor's ROI is on page 55 of the BPG Player's Manual. The ROI is, essentially, an IRR calculated with a quarterly compounding period, adjusted to an annual rate. The investment is the amount put up for a share of stock in Year 2, Quarter 4. The "cash inflows" are the dividend payments each quarter plus the ending stock price. Your finance VP is on his own to estimate stock price. It is determined by the types of things investors use in the market, plus changes in the market itself. <span id="F5"></span>

### 5. Affiliate purchase costs

When a company has a plant in Merica and Sereno, what is the best way to determine the purchase costs that the affiliates have to pay? Should we take the average production cost of the units available after local sales office orders have been fulfilled by the factories?

### Answer

The average production cost (shown in Report D) plus 20 percent is the transfer price of goods sold to affiliates. <span id="F6"></span>

### 6. Stock price calculation

Can you give us any insight into how the "Stock Price" is arrived at? With a large swing in Net Income, from -649 to +336, and a positive Earnings, we thought that our stock price would have improved. Can you tell us what factors go into figuring Stock Price?

### Answer

Stock price is from a simulated market where investors are using earnings, dividends, market factors, and other investment measures to determine the amount they would be willing to pay (or receive) to buy (or sell) a company's shares. <span id="F7"></span>

### 7. Executive compensation

We would like to have clarification of the executive compensation policy. we have been charged with inflation adjusted compensation for a plant that is under construction. It would seem that a plant under construction. would not have executives working it? Shouldn't executive compensation be charged only during quarters that the plant is operational.

### Answer

Top executives for a plant need to be aboard starting with the time the construction contract is let. They are charged with supervision of construction, organizing things for future operations, hiring and training employees, etc. So executive compensation is part of the cost of opening a new plant. <span id="F8"></span>

### 8. Credit rating determination

We are curious about how the Credit Rating is arrived at in the simulation. We have shown positives in every category for at least the last two quarters but yet we have a credit rating of 3. Can you please shed some light on this for us?

### Answer

An emergency loan from the bank will qualify a company for a number 3 credit rating. Otherwise, ratings are evaluated by credit analysts at the end of each year. Generally, a company with an emergency loan during the past year or two will not be upgraded. The factors affecting credit ratings are shown on page 57, but only three or four quarter's performance on most of them will not have much impact. <span id="F9"></span>

### 9. Credit rating

Is there a way to tell if a competitor took out a short term loan when it shows a negative cash balance on the industry report? The real reason I am asking is to find out why credit ratings haven't changed for some people in our world yet? Is the credit rating only updated yearly?

### Answer

Credit ratings are calculated by credit analysts in the 4th quarter of each year based upon a firm's performance over an extended period of time. However emergency borrowing will normally trigger a reduction in a firm's credit rating in the quarter the emergency borrowing occurred. See pages 56 and 57 of the Player's Manual for more information. <span id="F10"></span>

### 10. Cash management

Last year teams had significant troubles with cash management in the later stages of the game. The industry appeared to still be in significant growth stages at the end of the competition. Our understanding of cash management and dividend policy is that rapid growth industries typically do not issue frequent dividends - the cash should be reinvested to strengthen the position of the firm. However, last year the teams with exorbitant amounts of cash at the end were issuing large dividends each quarter.

This seemed to help their stock price immensely, though as a policy it doesn't seem to match what we have learned. Is this a symptom of the simulation? Or is there some better way to manage our cash, should we be in the same situation this year?

### Answer

Dividends to shareholders is a decision variable that your team will have to decide. BPG shareholders like dividends, and a regular dividend policy that allows payment of 30% to 60% of earnings may enhance your stock price. But not if the result is insufficient cash and inability to invest in profitable projects. It is best to develop your strategy and policy, and stick with it. <span id="F11"></span>

### 11. Dividends

Our accountants are having trouble understanding the dividends paid to parent and dividends paid to subsidiaries. We have all read the book, and we are still vague as to how we calculate the exact dividends. As you know, accountants need exact numbers and they are confused.

### Answer

Dividends are not paid to subsidiaries, as they do not invest in the stock of other companies. Dividends paid by the parent company to stockholders result from your decisions. Your team is in complete control of the amount of the payment, as entered on your decision form.

Dividends paid by subsidiaries to the parent are described in the Player's Manual on page 130. Until the retained earnings have been built up to at least 50% of the value of common stock, only 80% of earnings are paid to the parent company. After that, all profits are paid to the parent as dividends.

Dividend payments to the parent are subject, of course, to the availability of cash in the subsidiary's bank account--after payment, there must still be one million pesos in the Sereno subsidiary, or \$100,000 in Merican subsidiaries.

The parent company's account "Dividends from Subsidiaries" reflects how much is received by the parent and the sum of subsidiary dividends paid to the parent should equal the amount of "Dividends from Subsidiaries." As Internal transfers, these amounts net out and do not show on the consolidated statements. <span id="F12"></span>

### 12. Credit rating

During quarter 4, year 3, our credit rating fell to level 3, along with the rest of our world. We would like to question the reasoning behind this. We had a credit rating of 2 prior to fourth quarter, when we had the high sales in the industry at 5.1 million dollars, and we ended with the highest cash balance of 983,000 dollars with no loans. We are hoping this was a fluke and can be appealed. We have worked very hard to manage our finances as we have made long term improvements to our plant and product. What has happened to our credit rating? We were hoping for, and honestly expecting, our credit rating to move to 1 very soon.

### Answer

The factors that are considered by credit analysts in their year-end review are outlined on page 57, and are considered for an extended period rather than just for a single quarter. As this is the first year of the competition, the period is for the entire Year 4. Credit analysts do not usually divulge the specific values of different variables that they consider, but to have an average credit rating generally expect your company to at least meet industry standards and excel in relation to other companies in the industry.

Your company certainly met repayment obligations and had no emergency borrowing, and from the Annual Industry Report showed an increase in market share of about 1.6 percentage points. You might wish to check out the other factors noted on page 57 in relation to general industry standards and other companies in your industry. For example, no one in your industry paid any dividends during the year. Your debt ratio (bonds/equity) exceeded the maximum permitted by your bond indenture. Partly as a result of the high amount of long-term debt, your interest coverage ratio is a little low by most industry standards. Please consider each of the factors listed.

And remember that credit rating is not the only measure to judge business success. It does affect your borrowing costs and ability to raise funds with new stock offerings.

------------------------------------------------------------------------

This page is maintained by David Fritzsche ([Home page](../mainFrame.html)). Send comments to <fritzsch@eskimo.com>.

This page last updated 1 November 2001.
