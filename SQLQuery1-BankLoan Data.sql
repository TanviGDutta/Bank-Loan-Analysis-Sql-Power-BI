Create database bankloan

Select * from Bank_loan_data

--Total Loan Application

Select Count(id) as Total_Loan_application from Bank_loan_data

--MTD Loan Application

Select Month(issue_date) as Month_No,year(issue_date) as Year_,count(id) as MTD_loan_application from 
Bank_loan_data
where Month(issue_date)=12 and year(issue_date)=2021
group by Month(issue_date), year(issue_date)

--PMTD Loan Application

Select Month(issue_date) as Month_No,year(issue_date) as Year_,count(id) as PMTD_loan_application from 
Bank_loan_data
where Month(issue_date)=11 and year(issue_date)=2021
group by Month(issue_date), year(issue_date)


--Total Funded Amount

Select * from Bank_loan_data

Select SUM(Loan_Amount) as Total_fundedAmount from Bank_loan_data


Select Month(issue_date) as Month_No,year(issue_date) as Year_,sum(loan_amount) as MTD_loan_fundedAmount from 
Bank_loan_data
where Month(issue_date)=12 and year(issue_date)=2021
group by Month(issue_date), year(issue_date)

Select Month(issue_date) as Month_No,year(issue_date) as Year_,sum(loan_amount) as PMTD_loan_fundedAmount from 
Bank_loan_data
where Month(issue_date)=11 and year(issue_date)=2021
group by Month(issue_date), year(issue_date)


--Total Amount Received

Select Sum(total_payment) as Total_Amount_Received from Bank_loan_data

--MTD Amount Received

Select Sum(total_payment) as MTD_Amount_Received from Bank_loan_data
where Month(issue_date)=12 and year(issue_date)=2021

--PMTD Amount Received

Select Sum(total_payment) as PMTD_Amount_Received from Bank_loan_data
where Month(issue_date)=11 and year(issue_date)=2021

--Average Interest Rate

Select Round(Avg(int_rate),2)*100 as Average_Dti from Bank_loan_data

--MTD Average Interest Rate

Select Round(Avg(int_rate),4)*100 as MTD_Average_Dti from Bank_loan_data
where Month(issue_date)=12 and year(issue_date)=2021

--PMTD Average Interest Rate

Select Round(Avg(int_rate),4)*100 as PMTD_Average_Dti from Bank_loan_data
where Month(issue_date)=11 and year(issue_date)=2021

--Good Loan Application Percentage
with good_loan as
(
Select count(id) as Count_ from Bank_loan_data
where loan_status ='Fully Paid' or loan_status='Current'
)
Select 100*count_/(Select Count(id) from Bank_loan_data) from good_loan

--Good Loan Applications

Select count(id) as Count_ from Bank_loan_data
where loan_status ='Fully Paid' or loan_status='Current'

--Good Loan Funded Amount

Select Sum(loan_amount) as Goodloan_FundedAmt from Bank_loan_data
where loan_status ='Fully Paid' or loan_status='Current'

--Good Loan Received Amount
Select * from Bank_loan_data

Select Sum(total_payment) as Goodloan_ReceivedAmt from Bank_loan_data
where loan_status ='Fully Paid' or loan_status='Current'

--Bad Loan Application Percentage
with Bad_loan as
(
Select count(id) as Count_ from Bank_loan_data
where loan_status ='charged off'
)
Select 100*count_/(Select Count(id) from Bank_loan_data) as Bad_Loan_Percentage from Bad_loan

--Bad Loan Applications

Select count(id) as Count_ from Bank_loan_data
where loan_status='charged off'

--Bad Loan Funded Amount

Select Sum(loan_amount) as Badloan_FundedAmt from Bank_loan_data
where loan_status ='charged off'

--Bad Loan Received Amount

Select Sum(total_payment) as Badloan_AmtReceived from Bank_loan_data
where loan_status ='charged off'

--Loan Status

Select Loan_status,Count(id) as Total_Loan_Application,Sum(loan_amount) as TotalFunded_Amount,
Sum(total_payment) as Total_paymentReceived,avg(int_rate)*100 as Avg_InterestRate,
Avg(dti)*100 as Avg_Dti from Bank_loan_data
Group by Loan_status

--MTD Loan Status

Select Loan_status,Sum(loan_amount) as MTD_Total_Funded_Amount,
Sum(total_payment) as MTD_Total_payment_Received from Bank_loan_data
where Month(issue_date)=12 and year(issue_date)=2021
Group by Loan_status

--PMTD Loan Status

Select Loan_status,Sum(loan_amount) as PMTD_Total_Funded_Amount,
Sum(total_payment) as PMTD_Total_payment_Received from Bank_loan_data
where Month(issue_date)=11 and year(issue_date)=2021
Group by Loan_status


--MONTHLY TREND

Select Month(issue_date) as Month_number,datename(Month,issue_date) as Months,count(id) as TotalLoan_App,sum(loan_amount) as Loan_Amt,
Sum(total_payment) as Total_pymt from Bank_loan_data
Group by datename(Month,issue_date),Month(issue_date)
order by Month(issue_date) asc

--Regional Anlaysis(State)

Select address_state,count(id) as TotalLoan_App,sum(loan_amount) as Loan_Amt,
Sum(total_payment) as Total_pymt from Bank_loan_data
Group by address_state
order by count(id) desc

--Loan Term Analysis

Select term,count(id) as TotalLoan_App,sum(loan_amount) as Loan_Amt,
Sum(total_payment) as Total_pymt from Bank_loan_data
Group by term

--Emp_Length

Select * from Bank_loan_data

Select emp_length,count(id) as TotalLoan_App,sum(loan_amount) as Loan_Amt,
Sum(total_payment) as Total_pymt from Bank_loan_data
Group by emp_length
Order by emp_length Desc

--Purpose

Select Purpose,count(id) as TotalLoan_App,sum(loan_amount) as Loan_Amt,
Sum(total_payment) as Total_pymt from Bank_loan_data
Group by purpose

--Home OwnerShip

Select home_ownership,count(id) as TotalLoan_App,sum(loan_amount) as Loan_Amt,
Sum(total_payment) as Total_pymt from Bank_loan_data
Group by home_ownership








