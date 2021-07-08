select distinct employee.fname as 'employee.fname', employee.minit as 'employee.minit', employee.lname as 'employee.lname'
from company.employee, company.dependent
where company.employee.ssn = company.dependent.essn and
      company.employee.fname = company.dependent.dependent_name;