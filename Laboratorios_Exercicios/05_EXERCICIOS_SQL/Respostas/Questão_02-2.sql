select parts.pno, parts.price, odetails.pno, odetails.qty, odetails.ono
from mailorder.parts
inner join mailorder.odetails on mailorder.parts.pno = mailorder.odetails.pno and
   mailorder.parts.price * mailorder.odetails.qty > 50.00
group by parts.pno;


select employees.eno, employees.ename, zipcodes.city, orders.eno, orders.ono
from mailorder.employees 
inner join mailorder.zipcodes on mailorder.employees.zip = mailorder.zipcodes.zip
inner join mailorder.orders on mailorder.employees.eno = mailorder.orders.eno;

