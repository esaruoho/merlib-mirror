---
title: "Uncle Chuck's Retirement Resources Calculator (RR_Cal) README Document"
source_domain: amasci.com
source_path: ~cdickens/applets/RR_Cal/RR_CalREADME.html
order: 1911
reachable_from_entry: false
images: 0
internal_links: 1
extracted: 2026-08-07T17:08:22Z
extractor: site_to_paper.py (pandoc)
---

# Uncle Chuck's Retirement Resources Calculator (RR_Cal) README Document

*Source page: `~cdickens/applets/RR_Cal/RR_CalREADME.html`*

------------------------------------------------------------------------

# Uncle Chuck's Retirement Resources Calculator (RR_Cal)

Calculates Retirement Income, Outgo & Assets Depletion.

Uncle Chuck is pleased to share with you his personal retirement planning calculator (a Java applet, 50 Kbytes) that computes retirement income, outgo, and assets depletion for each year of retirement. For more details, read the README document, below.

**Instant Self-Service (FREE of course)**

- [CLICK HERE for Retirement Resources Calculator](RR_Cal.html)

------------------------------------------------------------------------

# README

Updated: February 9, 2001

## <span id="TOC">Table of Contents</span>

- [Introduction - Managing Your Retirement Nest Egg](#INTRODUCTION)
- [Assumptions](#ASSUMPTIONS)
- [Frequently Asked Questions (FAQ)](#FAQ)
- [Data Entry Instructions](#DATA%20ENTRY)
- [Summary Report Via The Java Console](#PRINTOUT)
- [Life Expectancy Tables](#LIFE%20EXPECTANCY)
- [For More Information](#MORE%20INFO)
- [Disclaimer](#DISCLAIMER)

------------------------------------------------------------------------

## <span id="INTRODUCTION">Introduction - Managing Your Retirement Nest Egg</span>

You have probably asked:

- "Will I have enough income during my retirement?"

This can be a worrisome question. For an answer, you must start by asking three basic questions:

- "How much do I plan to spend during each year of my retirement?"

  "How much income will I receive from my savings and investments, from my company pension, and from Social Security during each year of my retirement?"

  "Do I need to deplete my principal to supplement my retirement income?"

By definition, your retirement is adequately funded if you never run out of money!

Each person's goals for having a specific retirement expense level are a personal matter. Consider the two extreme views held by two fictitious retirees: Mr. Buck Saver and Mr. Max Spender. Let's look at how each of them intends to spend his retirement nest egg.

Buck Saver, married, is quite satisfied with his current standard of living. He figures he needs, in today's dollars, to spend approximately \$38,000 (after-tax dollars) per year to continue the standard of living that he now enjoys. Buck's two financial goals during his retirement are:

- \(1\) Have enough retirement assets to fund, for the rest of his life and his spouse's life, their "standard annual need" of \$38,000, adjusted, of course, each year for inflation.

  \(2\) Accumulate during retirement any surplus (unspent) money to be passed on to his children when he and his spouse die.

Max Spender, single, is unlike Buck Saver. Max wants to spend it all. During retirement, Max intends to spend as much of his retirement resources as possible each year. Max's idea of an adequate retirement nest egg is quite vague. Just how much is as much as possible? Unlike Buck's two financial goals, Max's two financial goals during his retirement are:

- \(1\) Enjoy the highest standard of living that he can within his means.

  \(2\) Leave very little, if any, unspent assets in his estate when he dies.

Max Spender's last will and testament just might read:

- "Being of sound mind, I spent it all!"

Let's examine Buck Saver's case. Buck knows what the standard annual need is for the two of them. In today's dollars, it is \$38,000 (after they pay their income tax). His next step is to determine if they have the necessary retirement resources to enable them to spend at least \$38,000 - adjusted annually for inflation - each year until his death and his spouse's death. If their retirement resources are NOT enough, then they must either reduce their standard annual need (i.e., their current standard of living), or increase their retirement resources, or do both.

The question for Buck is now more to the point:

- "Buck, do you and your wife have the necessary retirement resources to enable the two of you to fund, for your lifetime and your spouse's lifetime, your standard annual need of \$38,000 in today's dollars, and which, of course, must be adjusted annually for inflation?"

In Max Spender's case, Max doesn't have a clue how much he dare spend each year of his retirement. Max only knows that he does not want to underspend or to overspend. If Max lives well beyond his life expectancy, he may seriously regret having spent too much, too soon. On the other hand, if Max dies much sooner than he expects, he will not have achieved his true spending capability during his briefer-than-planned retirement.

So, the next step for Max is for him to determine what is his maximized standard annual need, his upper spending limit that is consistent with his retirement resources. The question for Max now becomes:

- "Max, given your retirement resources, what is your maximized standard annual need in today's dollars, and which must be adjusted annually for inflation?"

Death is a fact of life. So, there is that critical question to be answered by everyone who is planning his/her retirement:

- "WHEN DO I EXPECT TO DIE? (or how long do I expect to live?)"

It is your [life expectancy](#LIFE%20EXPECTANCY) that determines how long your retirement resources have to last! It is extremely important to understand that life expectancy is, perhaps, the most important parameter in the calculation of your retirement income, outgo, and assets depletion.

Now, let's focus on your retirement planning by asking you these three fundamental questions:

- "What are your (and your spouse's) retirement resources that will fund your retirement?"

  "What is your (and your spouse's) annual expense requirement during retirement? "\
  (Hint: Which type person are you; a Buck Saver or a Max Spender?)

  "When do you (and your spouse) expect to die?"

The Retirement Resources Calculator (RR_Cal) is intended to help you predict your retirement income, outgo, and the depletion of your financial assets. You must specify the necessary planning data that best represent your unique situation. RR_Cal can process this data in one of two ways:

- Report on whether or not your resources are adequate to fund your retirement.

  Report on the maximized standard annual need (calculated by RR_Cal) that is possible based on your retirement resources.

RR_Cal's reports are based on your answers to the questions that are asked. Each and every change to your answers has its own ripple effect on the analyses by RR_Cal. It is suggested that you use RR_Cal to explore the effect of changing:

- When you retire\
- The cost of living annual inflation rate\
- Your life expectancy\
- Your spouse's life expectancy\
- Your pension incomes\
- Your Social Security incomes\
- The amount of your savings\
- Interest rates\
- Investment growth rates\
- Income tax rates\
- Any of several other data elements.\

You will probably be more than surprised by the ripple effect of each change.

Note that RR_Cal deals with three types of cash-equivalent accounts that are representative of your various investments:

- Account \#1 is non-tax-deferred cash accounts and CDs.

  Account \#2 is other non-tax-deferred investments, e.g., stocks and bonds, including Roth IRA accounts. (In a future version of RR_Cal, Roth IRA accounts will be treated separately, as an Account \#4, namely, a tax-exempt account with a few rules.)

  Account \#3 is tax-deferred IRA accounts and other qualified tax-deferred plans, e.g., 401(k).

Note that Account \#3 is a tax-deferred account, and is subject to U.S. government rules regarding withdrawals, including, at age 70 1/2, the mandatory distribution of the funds in the account. Neither Account \#1 nor Account \#2 is subject to such withdrawal and mandatory distribution rules.

**Return to the [Table of Contents](#TOC)**

------------------------------------------------------------------------

## <span id="ASSUMPTIONS">Assumptions</span>

The following assumptions are used by RR_Cal (Version 1.0) to process your input data:

- 1\. Although your spouse, if any, may retire before you retire, retirement expenses do not take effect until the start of YOUR retirement.

  2\. "Income" is the money you actually receive and on which income tax may need to be paid. Income includes: pension checks, Social Security checks, interest (or gains) earned on non-tax-deferred Account \#1, withdrawals from Account \#1, withdrawals from non-tax-deferred Account \#2, and withdrawals from tax-deferred Account \#3.

  - Note 1: Interest and capital gains on Account \#2 and Account \#3 are not treated as income until withdrawn.

    Note 2: No penalty is assessed for early withdrawal from Account \#3.

    Note 3: Account \#1 and Account \#2 are considered to be held jointly by you and your spouse, if any.

    Note 4: You and your spouse, if any, each has your own tax-deferred Account \#3.

  3\. Additional income (such as from wages, an inheritance, or an annuity) received during retirement is declared as Special Income, where the amount is (a) net and (b) in today's dollars. Input of Special Income is not yet implemented.

  - Suggestion: If your spouse retires at a date later than you, input spouse's net wages as Special Income.

  4\. Social Security income is for the duration of the life of the person receiving it.

  - Note: Social Security income is received twelve months per year, including the year when first received, as well as the year of the recipient's death.

  5\. Should either spouse have a Social Security monthly benefit of zero (planning data entry), RR_Cal credits that spouse with a monthly income equivalent to 3/8's of the other spouse's Social Security monthly income. The estimated credit is reduced 20% if the Social Security income begins at age 62; reduced 13.27% if it begins at age 63; reduced 6.67% if it begins at age 64.

  6\. Pension income is for the duration of the life of the person receiving the pension.

  - Note: Pension income is received twelve months per year, including the year when first received, as well as the year of the pensioner's death.

  7\. Pension income inflates annually per the specified pension inflation rate.

  8\. Social Security income inflates annually per the specified cost of living inflation rate.

  9\. An item of Special Income inflates annually per the specified cost of living inflation rate only if its declaration indicates that it does. Input of Special Income is not yet implemented.

  10\. The Standard Annual Need inflates annually per the specified cost of living inflation rate.

  11\. An item of adjustment to the Standard Annual Need inflates annually per the specified cost of living inflation rate only if its declaration indicates that it does.

  12\. For each year of retirement, sufficient income, including withdrawals from Account \#1, Account \#2 and Account \#3, must be available to offset that year's need, including income tax. (RR_Cal does not permit deficit spending.)

  13\. The maximum possible Standard Annual Need is calculated by RR_Cal to be within two dollars below the exact value.

  - Note: If you increase the calculated value of the maximum possible Standard Annual Need by two dollars, sufficient funds will not be available per life expectancy.

  14\. Account \#1 and Account \#2 are held jointly by you and your spouse, if any, with right of survivorship.

  15\. You are the beneficiary of your spouse's Account \#3 per the specified percentage. Your spouse's Account \#3 is paid to you, as a surviving spouse, in equal, annual payments, beginning the year after your spouse's death. IRA rules regarding the period of distribution are followed.

  16\. Your spouse is the beneficiary of your Account \#3 per the specified percentage. Your Account \#3 is paid to your surviving spouse in equal, annual payments, beginning the year after your death. IRA rules regarding distribution requirements are followed.

  17\. Rejection of invalid planning data by the calculator: RR_Cal edits the planning data entries to detect an invalid input, which is rejected with an explanation; RR_Cal permits you to reenter the datum.

**Return to the [Table of Contents](#TOC)**

------------------------------------------------------------------------

## <span id="MORE INFO">For More Information</span>

RR_Cal, a Java applet, is copyrighted computer software developed by Uncle Chuck (Charles W. Dickens).

**Return to the [Table of Contents](#TOC)**

------------------------------------------------------------------------

## <span id="FAQ">Frequently Asked Questions (FAQ)</span>

Q1. What is the major difference between Account \#2 and Account \#3?

A1. Account \#3 is a tax-deferred IRA-like account and is subject to U.S. government rules regarding withdrawals, including, at age 70 1/2, the mandatory distribution of the funds in the account. Account \#2 is not a tax-deferred IRA-like account, and is not subject to those mandatory distribution rules.

Q2. Does RR_Cal permit me to specify future deposits into Account \#2 and/or Account \#3?

A2. No.

Q3. When will additional features be available?

A3. RR_Cal, Version 2, is still in the works. User feedback will strongly determine if Version 2 will be available to you sooner or later.

Q4. Does RR_Cal permit me to specify a tax-exempt basis for the funds in Account \#3?

A4. No.

Q5. Why is RR_Cal another freeware software product of Uncle Chuck?

A5. Why not? There is more to Uncle Chuck's life than making money. Developing RR_Cal was Uncle Chuck's personal project, and he is pleased to share his very own retirement resources calculator (RR_Cal) with you.

Q6. How do I send my feedback to Uncle Chuck?

A6. [E-mail your feedback to Uncle Chuck.](mailto:bi186@scn.org)

**Return to the [Table of Contents](#TOC)**

------------------------------------------------------------------------

## <span id="DATA ENTRY">Data Entry Instructions</span>

Use the mouse to input your data via the upper scroll bar. Click on the "NEXT QUESTION" button for the next item to input.

Respond to each question for data related to these ten retirement income planning topics:

\_\_\_\_\_\_ABOUT YOU

\_\_\_\_\_\_ABOUT YOUR SPOUSE

\_\_\_\_\_\_ABOUT SPECIAL INCOME DURING RETIREMENT

\_\_\_\_\_\_ABOUT ASSET GROWTH RATES DURING RETIREMENT

\_\_\_\_\_\_ABOUT INCOME TAX RATES DURING RETIREMENT

\_\_\_\_\_\_ABOUT LIFE EXPECTANCY

\_\_\_\_\_\_ABOUT BENEFICIARIES

\_\_\_\_\_\_ABOUT INFLATION DURING RETIREMENT

\_\_\_\_\_\_ABOUT STANDARD ANNUAL NEED DURING RETIREMENT

\_\_\_\_\_\_ABOUT ADJUSTMENTS TO STANDARD ANNUAL NEED

Reminder:

- Account \#1 retirement savings are non-IRA-like cash deposits.\
  Account \#2 retirement savings are other non-IRA-like investments, e.g., stocks.\
  Account \#3 retirement savings are regular IRA and qualified plans. e.g. 401(k).

RR_Cal questions you only for the planning data that is relevant for each of the ten categories. For example, RR_Cal always questions you for your age. However, RR_Cal does not question you for spouse-related data if you have no spouse, or if you do not want to include your spouse's data in a particular retirement planning scenario.

Note that you may go back to a previous question by clicking on the "PREVIOUS QUESTION" button. You may restart the data entry process by clicking on the "START OVER" button. Previously entered data are not cleared when you click on the "START OVER" button.

After the entry of all your planning data, click on the "CALCULATE" button. RR_Cal then processes the planning data and generates a report. Use the lower scroll bar to display the report one year at a time. The Standard Annual Need per year based on annual inflation is displayed. Also, the yearly ending account balances are displayed. A summary report is also written to the Java console, and is suitable for printing.

**Return to the [Table of Contents](#TOC)**

------------------------------------------------------------------------

## <span id="PRINTOUT">Summary Report Via The Java Console</span>

Each time you click on the "CALCULATE" button, a summary report is written to the Java console. (Refer to your browser's "Preferences" menu. There is the option to show, or not to show, the Java console.)

The summary report consists of the set of questions asked and your answers, followed by the results of the calculations by RR_Cal, at one-year intervals. The summary report is a record of your input and RR_Cal's calculations of your Standard Annual Need per year of retirement (due to inflation) and the yearly ending account balances.

You mat copy the Java console output to a text file, which may be printed, of course.

**Return to the [Table of Contents](#TOC)**

------------------------------------------------------------------------

## <span id="LIFE EXPECTANCY">Life Expectancy Tables</span>

## A bit of philosophy

> A time to be born, and a time to die;\
> a time to plant, and a time to pluck up\
> \[that which is\] planted;
>
> --King James version of the Christian Bible, Old Testament, Ecclesiastes 3:2

------------------------------------------------------------------------

## Individual Life Expectancy Table For Ages 35 - 115

Examples:

- At age 50, your life expectancy is to live another 33.1 years, to the age of 83.1.\
  At age 65, your life expectancy is to live another 20.0 years, to the age of 85.0.\
  At age 85, your life expectancy is to live another 6.9 years, to the age of 91.9.\
  At age 92, your life expectancy is to live another 4.4 years, to the age of 96.4.\
  At age 115, your life expectancy is to live another 0.5 year, to the age of 115.5.\

<!-- -->

      AGE   |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9   |
            |------------------------------------------------------------|
       30   |  INDIVIDUAL LIFE EXPECTANCY   47.3  46.4  45.4  44.4  43.5 |
            |                                                            |
       40   | 42.5  41.5  40.6  39.6  38.7  37.7  36.8  35.9  34.9  34.0 |
            |                                                            |
       50   | 33.1  32.2  31.3  30.4  29.5  28.6  27.7  26.8  25.9  25.0 |
            |                                                            |
       60   | 24.2  23.3  22.5  21.6  20.8  20.0  19.2  18.4  17.6  16.8 |
            |                                                            |
       70   | 16.0  15.3  14.6  13.9  13.2  12.5  11.9  11.2  10.6  10.0 |
            |                                                            |
       80   |  9.5   8.9   8.4   7.9   7.4   6.9   6.5   6.1   5.7   5.3 |
            |                                                            |
       90   |  5.0   4.7   4.4   4.1   3.9   3.7   3.4   3.2   3.0   2.8 |
            |                                                            |
      100   |  2.7   2.5   2.3   2.1   1.9   1.8   1.6   1.4   1.3   1.1 |
            |                                                            |
      110   |  1.0   0.9   0.8   0.7   0.6   0.5                         |
            |------------------------------------------------------------|

Individual Life Expectancy Table is for IRA distribution purposes.\
Source is IRS Publication No. 590, 1990.

------------------------------------------------------------------------

## Joint Life Expectancy Table For IRA Owner At Age 70 And Spouse, Age 35 - 115

Examples (IRA owner at age 70; spouse at different ages):

- At age 50, joint life expectancy is 34.0 years.\
  At age 65, joint life expectancy is 23.1 years.\
  At age 85, joint life expectancy is 16.9 years.\
  At age 92, joint life expectancy is 16.4 years.\
  At age 115, joint life expectancy is 16.0 years.\

<!-- -->

     AGE OF
     SPOUSE |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9   |
            |------------------------------------------------------------|
       30   |     JOINT LIFE EXPECTANCY     47.5  46.6  45.7  44.7  43.8 |
            |                                                            |
       40   | 42.9  41.9  41.0  40.1  39.2  38.3  37.4  36.5  35.7  34.8 |
            |                                                            |
       50   | 34.0  33.1  32.3  31.5  30.7  29.9  29.1  28.4  27.6  26.9 |
            |                                                            |
       60   | 26.2  25.6  24.9  24.3   23.7 23.1  22.5  22.0  21.5  21.1 |
            |                                                            |
       70   | 20.6  20.2  19.8  19.4  19.1  18.8  18.5  18.3  18.0  17.8 |
            |                                                            |
       80   | 17.6  17.4  17.3  17.1  17.0  16.9  16.8  16.7  16.6  16.5 |
            |                                                            |
       90   | 16.5  16.4  16.4  16.3  16.3  16.3  16.2  16.2  16.2  16.2 |
            |                                                            |
      100   | 16.2  16.1  16.1  16.1  16.1  16.1  16.1  16.1  16.1  16.1 |
            |                                                            |
      110   | 16.1  16.0  16.0  16.0  16.0  16.0                         |
            |------------------------------------------------------------|

Joint Life Expectancy Table is for IRA distribution purposes.\
Source is IRS Publication No. 590, 1990.

For the complete Joint Life Expectancy Table, see the source document.

**Return to the [Table of Contents](#TOC)**

------------------------------------------------------------------------

## <span id="DISCLAIMER">Disclaimer</span>

Uncle Chucks' Retirement Resources Calculator (RR_Cal), Version 1.0, is freeware. Uncle Chuck makes NO claims that RR_Cal accurately processes the user's input data in each and every case. Uncle Chuck assumes NO responsibility for the accuracy of the calculations, and assumes NO responsibility for how the RR_Cal software's calculations and summary results are used. The user of Uncle Chuck's RR_Cal software assumes total responsibility for the accuracy of the calculations and for how the retirement resources calculations are used.

**Return to the [Table of Contents](#TOC)**

------------------------------------------------------------------------

## Count of Visitors (Since February 8, 2001)

------------------------------------------------------------------------
