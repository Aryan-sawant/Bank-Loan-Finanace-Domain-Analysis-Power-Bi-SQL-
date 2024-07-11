select * from financial_loan

select count(*) as Total_Loan_Applications from financial_loan

select count(*) as MTD_Loan_Applications from financial_loan
where month(issue_date) = 12 and year(issue_date)=2021

select count(*) as PMTD_Loan_Applications from financial_loan
where month(issue_date) = 11 and year(issue_date)=2021


select sum(loan_amount) as Total_Funded_Amount from financial_loan

select sum(loan_amount) as Total_MTD_Funded_Amount from financial_loan
where month(issue_date) = 12 and year(issue_date)=2021

select sum(loan_amount) as Total_PMTD_Funded_Amount from financial_loan
where month(issue_date) = 11 and year(issue_date)=2021


select sum(total_payment) as Total_Amount_Received from financial_loan

select sum(total_payment) as Total_MTD_Amount_Received from financial_loan
where month(issue_date) = 12 and year(issue_date)=2021

select sum(total_payment) as Total_PMTD_Amount_Received from financial_loan
where month(issue_date) = 11 and year(issue_date)=2021


select round(avg(int_rate),4)*100 as Average_Interest_Rate from financial_loan

select round(avg(int_rate),4)*100 as Average_MTD_Interest_Rate from financial_loan
where month(issue_date) = 12 and year(issue_date)=2021

select round(avg(int_rate),4)*100 as Average_PMTD_Interest_Rate from financial_loan
where month(issue_date) = 11 and year(issue_date)=2021


select round(avg(dti),4)*100 as Average_DTI from financial_loan

select round(avg(dti),4)*100 as Average_MTD_DTI from financial_loan
where month(issue_date) = 12 and year(issue_date)=2021

select round(avg(dti),4)*100 as Average_PMTD_DTI from financial_loan
where month(issue_date) = 11 and year(issue_date)=2021


select
	(count(case when loan_status ='Fully Paid' or loan_status ='Current' then id end)*100)
	/ count(id) as Good_Loan_Percentage
from financial_loan

select count(id) as Good_Loan_Applications from financial_loan
where loan_status='Fully Paid' or loan_status='Current'

select sum(loan_amount) as Good_Loan_Funded_Amount from financial_loan
where loan_status='Fully Paid' or loan_status='Current'

select sum(total_payment) as Good_Loan_Received_Amount from financial_loan
where loan_status='Fully Paid' or loan_status='Current'


select
	(count(case when loan_status='Charged Off' then id end)*100)
	/count(id) as Bad_Loan_Percentage
from financial_loan

select count(id) as Bad_Loan_Applications from financial_loan
where loan_status='Charged Off'

select sum(loan_amount) as Bad_Loan_Funded_Amount from financial_loan
where loan_status='Charged Off'

select sum(total_payment) as Bad_Loan_Received_Amount from financial_loan
where loan_status='Charged Off'


select
	loan_status,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount,
	avg(int_rate)*100 as Average_Interest_Rate,
	avg(dti)*100 as Average_DTI
from financial_loan
group by loan_status


select
	loan_status,
	sum(loan_amount) as Total_MTD_Funded_Amount,
	sum(total_payment) as Total_MTD_Received_Amount
from financial_loan where month(issue_date)=12
group by loan_status


select
	month(issue_date) as Month_Number,
	datename(month,issue_date) as Month_Name,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from financial_loan
group by month(issue_date),datename(month,issue_date)
order by month(issue_date)


select
	address_state,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from financial_loan
group by address_state
order by sum(loan_amount) desc


select
	term,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from financial_loan
group by term
order by term desc


select
	emp_length,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from financial_loan
group by emp_length
order by emp_length desc


select
	purpose,
	count(id) as Total_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from financial_loan
group by purpose
order by count(id) desc


select
	home_ownership,
	count(id) as Total_Applications,
	sum(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from financial_loan
group by home_ownership
order by count(id) desc