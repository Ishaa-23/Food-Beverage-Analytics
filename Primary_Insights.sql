create database Beverage_Case_Study;

select * from dim_cities
select * from dim_repondents;
select * from fact_survey_responses

--Primary insights
--Demographic insights
--which gender prefers it more
select t2.Gender,count(t1.Respondent_ID) count_of_respondents
from fact_survey_responses t1 left join dim_repondents t2 on t1.Respondent_ID=t2.Respondent_ID
group by t2.Gender
order by count_of_respondents desc

--which age group
select t2.Age,count(t1.Respondent_ID) count_of_respondents
from fact_survey_responses t1 left join dim_repondents t2 on t1.Respondent_ID=t2.Respondent_ID
group by t2.Age
order by count_of_respondents desc

--which city has most consumers
select t3.City,count(t1.Respondent_ID) count_of_respondents
from fact_survey_responses t1 left join dim_repondents t2 on t1.Respondent_ID=t2.Respondent_ID
left join dim_cities t3 on t2.City_ID=t3.City_ID
group by t3.City
order by count_of_respondents desc

--what type of marketing reaches the youth
select t1.Marketing_channels,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1 left join dim_repondents t2 on t1.Respondent_ID=t2.Respondent_ID
where Age='19-30'
group by t1.Marketing_channels
order by [number of reach] desc


--Consumer preferences
--What are the preferred ingredients of energy drinks among respondents?
select t1.Ingredients_expected,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Ingredients_expected
order by [number of reach] desc

--Interest in natural or organic
select t1.Interest_in_natural_or_organic,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1 
group by t1.Interest_in_natural_or_organic
order by [number of reach] desc

--Packaging preferences
select t1.Packaging_preference,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Packaging_preference
order by [number of reach] desc


--Competition analysis
--current market leaders
select t1.Current_brands,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Current_brands
order by [number of reach] desc

--Reasons for choosing others
select t1.Reasons_for_choosing_brands,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Reasons_for_choosing_brands
order by [number of reach] desc

--Marketing channels and brand awareness
-- which marketing channels to reach more customers
select t1.Marketing_channels,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Marketing_channels
order by [number of reach] desc


--how much have we been heard of?
select t1.Heard_before,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Heard_before
order by [number of reach] desc

--tried before?
select t1.Tried_before,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Tried_before
order by [number of reach] desc

--Brand penetration
--overall rating what do people think
select t1.Taste_experience,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Taste_experience
order by [number of reach] desc

--what do people think of the brand
select t1.Brand_perception,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Brand_perception
order by [number of reach] desc

--which cities to focus on
select t3.City,t3.Tier,count(t2.Respondent_ID) "count of respondents"
from dim_repondents t2 
left join dim_cities t3 on t2.City_ID=t3.City_ID
group by City,Tier
order by [count of respondents] desc

--Purchase behavior
--where do they purchase from
select t1.Purchase_location,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Purchase_location
order by [number of reach] desc

--typical consumption situations
select t1.Typical_consumption_situations,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Typical_consumption_situations
order by [number of reach] desc

--factors influencing consumption (price-range, limited edition packaging)
select t1.Price_range,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Price_range
order by [number of reach] desc

--more likely to buy limited edition packaging
select t1.Limited_edition_packaging,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Limited_edition_packaging
order by [number of reach] desc

--Product development
--improvements needed
select t1.Improvements_desired,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Improvements_desired
order by [number of reach] desc

--reasons for not trying
select t1.Reasons_preventing_trying,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Reasons_preventing_trying
order by [number of reach] desc

--general perception bout energy drinks
select t1.General_perception,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.General_perception
order by [number of reach] desc

--consume time
select t1.Consume_time,count(t1.Respondent_ID) "number of reach" from fact_survey_responses t1
group by t1.Consume_time
order by [number of reach] desc
