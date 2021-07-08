select distinct emp.fname as 'E.fname', emp.minit as 'E.minit', emp.lname as 'E.lname'
from company.employee emp, company.employee sup
where emp.super_ssn = sup.ssn and
      sup.fname = 'Franklin' and
      sup.lname = 'Wong';