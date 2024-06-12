USE kind

select * from [dbo].[election_results_2024] 

---Sorting and Ranking Queries:

---Rank constituencies by the margin in descending order.
select  Constituency,rank()	over (order by Margin desc) as Rank_Margin from [dbo].[election_results_2024]

--Retrieve the top 5 constituencies with the highest margins.

select top 5 Constituency,max(margin) as Max_Margin from [dbo].[election_results_2024] 
group by Constituency
order by max(margin) desc;

----Sort constituencies by constituency number in ascending order.
select Count(Constituency) as Count_Constituency from [dbo].[election_results_2024] 

---List the trailing candidates sorted by margin in ascending order.

select * from [dbo].[election_results_2024] 

select trailing_candidate,Margin from [dbo].[election_results_2024]
order by Margin desc

---Rank the parties by the number of constituencies they are leading in.
select Constituency,rank() over (order by Leading_Party asc) as Rank_Leading_Party
from [dbo].[election_results_2024]

--------Joining and Subqueries:

----Find the number of constituencies where the leading candidate's name appears in another 
---table of candidates.

select * from [dbo].[election_results_2024];


select top 5  Constituency, Leading_Candidate from [dbo].[election_results_2024] 
where Leading_Candidate = 'DEVENDRA SINGH ALIAS BHOLE SINGH';

---List constituencies where the leading party has the same number of constituencies as the trailing party.

use kind
select * from [dbo].[election_results_2024];

select Constituency,Leading_Party,Trailing_Party from [dbo].[election_results_2024] 
where Leading_Party = 'Telugu Desam';

---Retrieve constituencies where the margin is greater than the average margin.

select Constituency,Margin  from  [dbo].[election_results_2024]
where Margin > ( select  Avg(Margin) as AVg_Margin
from  [dbo].[election_results_2024])


---Find constituencies where the trailing candidate is also a leading candidate in another constituency.

select * from [dbo].[election_results_2024]

select DISTINCT t1.Constituency as TrailingConstituency,
t1.Trailing_Candidate,
t2.Constituency as LeadingConstituency
from [dbo].[election_results_2024] t1
inner join [dbo].[election_results_2024] t2
on t1. Trailing_Candidate = t2.Leading_Candidate
--------------------------------------------------
select * from [dbo].[election_results_2024]

----Determine constituencies where the leading candidate's party 
--is different from the trailing candidate's party.

select Constituency,Leading_Candidate,Trailing_Candidate,Leading_party,Trailing_Party from [dbo].[election_results_2024]
where Leading_party <>Trailing_Party


--------------Advanced Queries:

---Calculate the percentage margin for each constituency.

select Constituency,Leading_Candidate,Trailing_Candidate,
leading_Votes, Trailing_Votes,
((Leading_Votes - Trailing_votes) * 100.0 /(Lead

from [dbo].[election_results_2024]

SELECT Constituency,
       Leading_Candidate,
       Trailing_Candidate,
       Leading_Votes,
       Trailing_Votes,
       -- Calculate the percentage margin
       ((Leading_Votes - Trailing_Votes) * 100.0 / (Leading_Votes + Trailing_Votes)) AS Percentage_Margin
FROM [dbo].[election_results_2024];


---make a column name 
Alter table [dbo].[election_results_2024]
add Leading_Votes int

--update
update  [dbo].[election_results_2024]
set Leading_Votes = margin

select Constituency,Leading_Candidate,Trailing_Candidate,Leading_Votes,
Trailing_Votes,
((Leading_Votes - Trailing_Votes) * 100.0 / (Leading_Votes + Trailing_Votes)) as Percentage_Margin
from [dbo].[election_results_2024]



--make a new column and name is Trailing_VOtes 
Alter TABLE [election_results_2024]
add Trailing_Votes INT;

update [election_results_2024] 
set  Trailing_Votes = Margin; 

select * from  [election_results_2024] 

---Identify constituencies where the leading party has more than twice the margin of the trailing party.

select Constituency from [election_results_2024]
where margin <> Trailing_Party