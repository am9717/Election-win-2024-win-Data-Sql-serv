use [kind]

select * from [dbo].[election_results_2024]

--Retrieve the names of all constituencies.
select top 10 Constituency from [dbo].[election_results_2024]

---Find the leading candidate for a given constituency.

select top 5 Leading_candidate ,Constituency from  [dbo].[election_results_2024]

----List all constituencies where the margin is greater than 10,000 votes;

select top 5 Constituency,Margin from [dbo].[election_results_2024]
where Margin >= 10000;

---Retrieve the names of all trailing candidates.

select top 5 Trailing_Party from [dbo].[election_results_2024]

--Find the number of constituencies where a specific party is leading.

select Constituency, Leading_Party
from [dbo].[election_results_2024]
where Leading_Party = 'Jammu & Kashmir National Conference ';

--Aggregation Queries:

-----Calculate the average margin across all constituencies.

select  top 5 Constituency,Avg(Margin) as Avg_Margin  from [dbo].[election_results_2024]
group by Constituency
order by avg(margin) asc;

--Find the total number of votes won by the leading candidates.

select * from [dbo].[election_results_2024]

select Leading_Candidate, sum(Margin) as Total_Margin from [dbo].[election_results_2024]
group by Leading_Candidate
order by sum(Margin) desc;

--Determine the constituency with the maximum margin.

select top 5 Constituency,max(Margin) as Max_Margin from [dbo].[election_results_2024]
group by Constituency
order by max(Margin) desc;

---Calculate the total number of constituencies for each leading party.
select * from [dbo].[election_results_2024]

select  count(Constituency) as Total_Number_Constituencies,
Leading_Party from  [dbo].[election_results_2024]
group by Leading_Party
order by count(Constituency) desc


----Find the minimum margin recorded in the election


select * from [dbo].[election_results_2024]

select top 5
Constituency,  Const_No,  Leading_Candidate,  
Leading_Party,   Trailing_Candidate,   Trailing_Party,   Status,
min(margin) as Min_Margin from [dbo].[election_results_2024]
group by Constituency,  Const_No,  Leading_Candidate,  
Leading_Party,   Trailing_Candidate,   Trailing_Party,   Status
order by min(margin) desc

----Filtering Queries:

----List all constituencies where the status is 'Won'.

select top 5 
Constituency ,Status from [dbo].[election_results_2024]
where Status = 'Result Declared';

----Find all constituencies where the leading party is 'Party A'.
select * from [dbo].[election_results_2024]


select top 10
Constituency ,leading_party  from [dbo].[election_results_2024]
where Leading_Party = 'Bharatiya Janata Party';

---Retrieve constituencies where the trailing party is 'Party B' and the margin is less than 5000.

use kind

select Constituency,Trailing_party,Margin
from [dbo].[election_results_2024]
where margin <5000;

----List constituencies where the status is 'Counting'.

select top 5
Constituency,Status
from [dbo].[election_results_2024]
where Status = 'Result Declared';



select * from [dbo].[election_results_2024]

---Find all constituencies where the leading candidate's name starts with 'A'.

select Constituency, Leading_Candidate  from [dbo].[election_results_2024]
where  leading_Candidate  like   '%A%'

--Sorting and Ranking Queries:

--Rank constituencies by the margin in descending order.

select Constituency,rank() over (order by  Margin desc)  as Rank_Margin 
from [dbo].[election_results_2024]

---Retrieve the top 5 constituencies with the highest margins.
select Top 5 Constituency,max(Margin) as Max_Margin from [dbo].[election_results_2024]
group by Constituency
order by max(Margin) desc;

--Sort constituencies by constituency number in ascending order

use kind
select  Constituency,Margin
from [dbo].[election_results_2024]
order by Margin asc


