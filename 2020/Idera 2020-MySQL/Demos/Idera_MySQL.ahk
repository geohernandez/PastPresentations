
::d1::
Send explain select dept_no from departments where dept_name='Development' `\G
return


::d2::
Clipboard = 
(
     
	drop table if exists mi_tabla;

	create table mi_tabla (id int not null,descripcion varchar(25));

	select id,descripcion from mi_tabla;
)
send ^v
return


::d3::
Send explain select dept_no,dept_name from departments \G
return


::d4::
Clipboard = 
(
     
	/* Tip: Para que se aplique un Range Scan debo tener un indice que lo soporte */
	explain select emp_no,last_name,first_name from employees where hire_date between '1986-06-26' and '1987-01-01' \G

	/*Eliminando el indice en caso que exista */
	call drop_index_if_exists('employees', 'idx_hire_date')
	
	/* Vamos a crear un indice que soporte mi consulta */
	create index idx_hire_date on employees(hire_date); 
)
send ^v
return


::d5::
Send explain select emp_no,last_name,first_name from employees as e where e.emp_no = 10004 \G
return

::d6::
Clipboard = 
(
	select emp_no,last_name,first_name from employees as e
	inner join salaries as s on e.emp_no=s.emp_no
	where e.emp_no = 10004 \G;     

)
send ^v
return


::d7::
MsgBox *****  Baja Selectividad o Como establecer nuestras mejores columnas para filtrado  *******
Clipboard = 
(
select count(distinct emp_no)/COUNT(*) as 'Cardinality for PRIMARY', 
count(distinct last_name)/COUNT(*) as 'Cardinality for last_name column in employees', 
count(distinct gender)/COUNT(*) as 'Cardinality for gender column in employees',
count(distinct hire_date)/COUNT(*) as 'Cardinality for hired_date column in employees' from employees;
)
send ^v
return


::d8::
Send explain select emp_no,last_name,first_name from employees where YEAR(hire_date) ='1986' \G
return

::d9::
MsgBox *****  Mejoremos el rendimiento de nuestra consulta   *******
Send explain select emp_no,last_name,first_name from employees where hire_date >='1986-01-01' and hire_date <'1987-01-01' \G
return


::d10::
Send explain select emp_no,last_name,first_name from employees where first_name like 'Elvis' \G
Return


::d11::
Send explain select emp_no,last_name,first_name from employees where first_name like 'Elvi`%' \G
return


::d12::
Send explain select emp_no,last_name,first_name from employees where first_name like ' `%lvis' \G
return


::d13::
MsgBox *****  El orden en la definición de nuestros indices   *******
Clipboard = 
(
     
	/*Vamos a crear un indice basado en una columna cuya selectividad represente una mala elección */

	create index idx_gender_lastname on employees(gender,last_name);

	/*Luego ejecutamos la siguiente consulta en donde filtramos el last_name que es parte de nuestro indice */

	explain select emp_no,last_name,first_name from employees where last_name = 'Randi' \G

	/*Ahora comparemos si de verdad incluimos el genero, todo va bien */

	explain select emp_no,last_name,first_name from employees where gender='M' and last_name = 'Randi' \G
 
	/* Y si .. cambiamos el orden? */

	explain select emp_no,last_name,first_name from employees where last_name = 'Randi' and gender='M' \G
	
	/* Ahora, hagamos las cosas bien */
	
	drop index idx_gender_lastname on employees;

	create index idx_lastname_gender on employees(last_name,gender) \G;

	drop index idx_lastname_gender on employees;
	
)
send ^v
return



::d14::
MsgBox *****  Divide y Venceras  *******
Clipboard = 
(

	select dm.dept_no, e.first_name,e.last_name,s.salary,s.from_date,s.to_date,e.emp_no
	from dept_manager as dm 
	inner join employees as e USING(emp_no)
	inner join salaries as s USING(emp_no)
	where last_name='Onuegbe' and first_name='Peternela' \G
     

    select emp_no from employees where first_name='Peternela' and last_name='Onuegbe' \G
	select salary,from_date,to_date from salaries where emp_no = emp_no=110725 \G
	select dept_name from dept_manager where emp_no = 110725 \G

)
send ^v
return

::ef::
Send explain format = json
return


::e::
Send explain
return