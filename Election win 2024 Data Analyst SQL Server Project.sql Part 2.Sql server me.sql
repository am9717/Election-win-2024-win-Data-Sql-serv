use kind 

select * from [dbo].[election_results_2024]

---Advanced Queries:

----List constituencies where the status is 'Undecided' and margin is less than 1000
select Constituency,Status ,Margin from [dbo].[election_results_2024]
where margin < 1000;

alter table [dbo].[election_results_2024]
add  leading_votes int

update [election_results_2024]
set leading_votes = Margin

----Find the constituencies where the difference in margin between the leading and 
----trailing candidates is less than 200 votes.

select Constituency, 
Leading_candidate,
Leading_Party,
trailing_Candidate,
Trailing_Party ,
Trailing_Votes,
Leading_votes,
ABS(Leading_votes - Trailing_Votes ) as Margin 

from [election_results_2024]
where ABS(Leading_votes - Trailing_Votes ) <200

---Calculate the ratio of leading to trailing candidates for each constituency.

Select Constituency,
Leading_candidate,
Leading_Party,
trailing_Candidate,
Trailing_Party ,
Trailing_Votes,
Leading_votes,
cast(Leading_votes as float) / Trailing_votes as Vote_Ratio
from [election_results_2024]


select Cast(margin as float)   from [election_results_2024]

-----Time-Based Queries:

--Retrieve the constituencies with status 'Counting' and update them to 'Completed'
---if the margin is greater than 5000.

select Constituency,Status,Margin from [election_results_2024]
where Margin > 5000

---Find the constituencies where the results were declared after a specific date.















SELECT Constituency,
       Leading_Candidate,
       Leading_Party,
       Trailing_Candidate,
       Trailing_Party,
       Leading_Votes,
       Trailing_Votes,
       CAST(Leading_Votes AS FLOAT) / Trailing_Votes AS Vote_Ratio
FROM [dbo].[election_results_2024];
