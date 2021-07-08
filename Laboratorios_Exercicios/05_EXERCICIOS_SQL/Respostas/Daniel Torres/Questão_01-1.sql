select distinct employee.fname as 'employee.fname', employee.minit as 'employee.minit', employee.lname as 'employee.lname'
from company.employee, company.works_on, company.project
where works_on.essn = employee.ssn and 
      works_on.pno = project.pnumber and
      works_on.hours > 10 and
      employee.dno = 5 and
      project.pname = 'ProductX';