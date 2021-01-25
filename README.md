# Pewlett-Hackard-Analysis
## Overview
The purpose of this analysis was to determine the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program. The goal of this analysis is to help prepare for the "silver tsunami" of current employees reaching retirement age.

## Results
* The silver tsunami will hit senior engingeering the hardest with more than 29,000 employees reaching retirement as seen in this [breakdown](https://github.com/LaurenSonis/Pewlett-Hackard-Analysis/blob/main/2021-01-24%20(4).png).
* Likewise, and maybe not surprisingly, senior staff will also be hit hard at more than 28,000 employees reaching retirement age.
* Meanwhile, management will not suffer much with only two employees reaching retirement age.
* There are [1,469](https://github.com/LaurenSonis/Pewlett-Hackard-Analysis/blob/main/2021-01-24%20(4).png) when you take the mentorship_eligibility data and filter out those who may have already retired according to their to_date.

## Summary
The data suggests that more than 90,000 employees are nearing retirement and will need their roles filled. After performing a count on the number of employees eligible for the mentorship program, only 1,469, it is easy to conclude that there are more than enough retirement-ready employees to mentor those eligible in the mentorship program. However, it does not appear that there are enough mentorship eligibile employees available to fill the hole that the silver tsunami will create. It may be helpful to perform two additional queries:
* Clean the data further and filter out who among the retirement_titles data may have already retired. To do this, add a filter query to the retirement_titles data. By adding retirement_titles.to_date and filtering so that retirement_titles.to_date = '9999-01-01', we get a count of [72,458](https://github.com/LaurenSonis/Pewlett-Hackard-Analysis/blob/main/2021-01-24%20(8).png) retirement-ready employees, which closes the gap of retirement-ready and mentorship-eligible employees by almost 20,000.

* To expand the number of employees who could be eligible for the mentorship program, you could expand the birth_date range to ________ then run the code

