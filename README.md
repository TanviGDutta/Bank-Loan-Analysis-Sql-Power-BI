# Bank-Loan-Analysis-Sql-Power-BI
Bank Loan Analysis-Power BI,Sql

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
