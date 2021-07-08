SELECT employee.fname, employee.minit, employee.lname FROM company.employee, company.dependent WHERE employee.ssn = dependent.essn AND dependent_name = employee.fname;


SELECT employee.fname, employee.minit, employee.lname FROM company.employee WHERE employee.fname = 'Franklin' AND employee.lname = 'Wong' AND employee.ssn;

SELECT department.dnumber, department.mgr_ssn FROM company.department;


SELECT employee.fname, employee.minit, employee.lname FROM company.employee WHERE not exists (select * from company.project where project.pnumber NOT IN (select works_on.pno FROM company.works_on, company.employee WHERE employee.ssn = works_on.essn));

select * FROM company.works_on, company.employee WHERE employee.ssn = works_on.essn;

select project.pname, project.pnumber from company.project where project.pnumber;

select * from company.employee where employee.ssn;

SELECT employee.fname, employee.minit, employee.lname, works_on.essn, project.pname FROM company.employee, company.works_on, company.project WHERE employee.ssn = works_on.essn;

SELECT employee.fname, employee.minit, employee.lname, works_on.pno FROM company.employee, company.works_on, company.project WHERE works_on.pno = project.pnumber AND works_on.essn = employee.ssn;

SELECT employee.fname, employee.minit, employee.lname FROM company.employee, company.works_on WHERE works_on.essn = employee.ssn;


