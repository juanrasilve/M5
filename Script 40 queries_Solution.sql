/* 1. Obtener todos los datos de todos los empleados. 
select * from empleados;

SELECT EMPNO, DEPTNO,ENAME,JOB,MGR,DATE_FORMAT(HIREDATE,'%d/%m/%y'),SAL,IFNULL(COMM,'')FROM empleados

/* 2. Obtener todos los datos de todos los departamentos.
SELECT * FROM departamentos;

/* 3. Obtener todos los datos de los administrativos (su trabajo es, en ingles, 'CLERK').

SELECT EMPNO, ENAME, DEPTNO, JOB,MGR,DATE_FORMAT(HIREDATE,'%d/%m/%y'),SAL,IFNULL(COMM,'')FROM empleados where job='CLERK';

/* 4. Idem, pero ordenado por el nombre.

SELECT EMPNO, ENAME, DEPTNO, JOB,MGR,DATE_FORMAT(HIREDATE,'%d/%m/%y'),SAL,IFNULL(COMM,'')FROM empleados where job='CLERK' order by ename;

/* 5. Obten el mismo resultado de la pregunta anterior, pero ahora ordenando sólo por deptno en sentido descendente:

SELECT EMPNO, ENAME, DEPTNO, JOB,MGR,DATE_FORMAT(HIREDATE,'%d/%m/%y'),SAL,IFNULL(COMM,'')FROM empleados where job='CLERK' order by deptno desc;

/* 6. Obten el Obten (codigo), nombre y salario de los empleados.

SELECT EMPNO,ENAME,SAL FROM EMPLEADOS;

/* 7. Lista los nombres de todos los departamentos.

SELECT DNAME FROM DEPARTAMENTOS;

/* 8. Idem, pero ordenandolos por nombre.
SELECT DNAME FROM DEPARTAMENTOS ORDER BY DNAME;

/* 9. Idem, pero ordenandolo por la ciudad (no se debe seleccionar la ciudad en el resultado).
SELECT DNAME FROM DEPARTAMENTOS ORDER BY loc;

/* 10. Idem, pero el resultado debe mostrarse ordenado por la ciudad en orden inverso.
SELECT DNAME FROM DEPARTAMENTOS ORDER BY loc DESC;

/* 11. Obtener el nombre y empleo de todos los empleados, ordenado por salario.
SELECT ENAME,JOB FROM EMPLEADOS ORDER BY SAL;

/* 12. Obtener el nombre y empleo de todos los empleados, ordenado primero por su trabajo y luego por su salario.
SELECT ENAME,JOB FROM EMPLEADOS ORDER BY JOB,SAL ;

/* 13. Idem, pero ordenando inversamente por empleo y normalmente por salario.
SELECT ENAME,JOB FROM EMPLEADOS ORDER BY JOB DESC,SAL ;

/* 14. Obten los salarios y las comisiones de los empleados del departamento 30.
SELECT SAL,IFNULL(COMM,'') as COMM FROM EMPLEADOS WHERE DEPTNO = 30;

/* 15. Idem, pero ordenado por comision.
SELECT SAL,IFNULL(COMM,'') as COMM FROM EMPLEADOS WHERE DEPTNO = 30 ORDER BY COMM;

/* 16. (a) Obten las comisiones de todos los empleados.

SELECT IFNULL(COMM,'') as COMM FROM EMPLEADOS;

/* 16. (b) Obten las comisiones de los empleados de forma que no se repitan.
SELECT DISTINCT IFNULL(COMM,'') as COMM FROM EMPLEADOS;

/* 17. Obten el nombre de empleado y su comision SIN FILAS repetidas.
SELECT DISTINCT ENAME, IFNULL(COMM,'') as COMM FROM EMPLEADOS;

/* 18. Obten los nombres de los empleados y sus salarios, de forma que no se repitan filas.
SELECT DISTINCT ENAME, SAL FROM EMPLEADOS ORDER BY ENAME;

/* 19. Obten las comisiones de los empleados y sus Obtens de departamento, de forma que no serepitan filas.
SELECT DISTINCT IFNULL(COMM,'') AS COMISION, DEPTNO FROM EMPLEADOS ORDER BY COMM,DEPTNO;

/* 20. Obten los nuevos salarios de los empleados del departamento 30, que resultar³an 
de sumar a su salario una gratificacion de 1000. Muestra tambien los nombres de los empleados.
SELECT ENAME, SAL+1000 FROM EMPLEADOS WHERE DEPTNO = 30;

/* 21. Lo mismo que la anterior, pero mostrando tambien su salario original, y 
haz que la columna que almacena el nuevo salario se denomine NUEVO SALARIO.
SELECT ENAME, SAL, SAL+1000 AS NUEVO_SALARIO FROM EMPLEADOS WHERE DEPTNO = 30;

/* 22. Halla los empleados que tienen una comision superior a la mitad de su salario.
SELECT ENAME FROM EMPLEADOS WHERE COMM>SAL/2;

/* 23. Halla los empleados que no tienen comision, o que la tengan menor o igual que el 25% de su salario.
SELECT ENAME FROM EMPLEADOS WHERE COMM IS NULL OR COMM<=SAL/4

/* 24. Obten una lista de nombres de empleados y sus salarios, de forma que en 
la salida aparezca en todas las filas \Nombre:" y \Salario:" antes del respectivo campo.
SELECT CONCAT('Nombre: ',ENAME) AS NOMBRE,CONCAT('Salario: ',SAL) as SALARIO FROM EMPLEADOS;

/* 25. Hallar el codigo, salario y comision de los empleados cuyo codigo sea mayor que 7500.
SELECT EMPNO, SAL, IFNULL(COMM,'') AS COMM FROM EMPLEADOS WHERE EMPNO > 7500;

/* 26. Obten todos los datos de los empleados que esten a partir de la J, inclusive.
NOTA: Para ello usa la funcion left de PLMySql
SELECT EMPNO, DEPTNO,ENAME,JOB,MGR,DATE_FORMAT(HIREDATE,'%d/%m/%y') AS HIREDATE,SAL,IFNULL(COMM,'') AS COMM FROM EMPLEADOS WHERE LEFT(ENAME,1) >= 'J';

/* 27. Obten el salario, comision y salario total (salario+comision) de los empleados 
con comision, ordenando el resultado por numero de empleado.
SELECT ENAME, SAL, IFNULL(COMM,''), SAL+COMM AS SALARIO_TOTAL FROM EMPLEADOS WHERE COMM IS NOT NULL ORDER BY EMPNO;

/* 28. Lista la misma informacion, pero para los empleados que no tienen comision.

SELECT ENAME, SAL, IFNULL(COMM,'') as COMM, IFNULL(SAL+COMM,'') AS SALARIO_TOTAL FROM EMPLEADOS WHERE COMM IS NULL ORDER BY EMPNO;

/* 29. Muestra el nombre de los empleados que, teniendo un salario superior 
a 1000, tengan como jefe al empleado cuyo codigo es 7698.
SELECT ENAME FROM EMPLEADOS WHERE DEPTNO = 30 AND SAL>1000 AND JOB NOT LIKE '%MANAGER%';

/* 30. Muestra el nombre de los empleados que, teniendo un salario inferior 
a 1000, no tengan como jefe al empleado cuyo codigo es 7698.
SELECT ENAME FROM EMPLEADOS WHERE NOT DEPTNO = 30 AND SAL<1000 AND JOB NOT LIKE '%MANAGER%';

/* 31. Indica para cada empleado el porcentaje que supone su comision sobre su 
salario, ordenando el resultado por el nombre del mismo.
SELECT ENAME,  IFNULL(IFNULL(COMM,'')/IFNULL(SAL+COMM,'')*100,'') AS porcentaje FROM EMPLEADOS ORDER BY ENAME;

/* 32. Hallar los empleados del departamento 10 cuyo nombre no contiene la cadena LA.
SELECT ENAME FROM EMPLEADOS WHERE DEPTNO = 10 AND ENAME NOT LIKE '%LA%';

/* 33. Obten los empleados que no son supervisados por ningun otro.
SELECT ENAME FROM EMPLEADOS WHERE JOB ='PRESIDENT';

/* 34. Obten los nombres de los departamentos que no sean Ventas (SALES) ni 
investigacion (RESEARCH). Ordena el resultado por la localidad del departamento.
SELECT DNAME FROM DEPARTAMENTOS WHERE DNAME NOT IN ('SALES','RESEARCH') ORDER BY LOC;

/* 35. Deseamos conocer el nombre de los empleados y el codigo del departamento 
de los administrativos(CLERK) que no trabajan en el departamento 10, y cuyo 
salario es superior a 800, ordenado por fecha de contratacion.
SELECT ENAME,DEPTNO FROM EMPLEADOS WHERE JOB='CLERK' AND NOT DEPTNO = 10 AND SAL>800
ORDER BY HIREDATE;

/* 36. Para los empleados que tengan comision, obten sus nombres y el cociente entre 
su salario y su comision (excepto cuando la comision sea cero), ordenando el resultado por nombre.
SELECT ENAME, IFNULL(SAL/COMM,'') FROM EMPLEADOS WHERE IFNULL(SAL/COMM,'')>0  ORDER BY ENAME;

/* 37. Lista toda la informacion sobre los empleados cuyo nombre completo tenga exactamente 5 caracteres.
SELECT EMPNO, DEPTNO,ENAME,JOB,MGR,DATE_FORMAT(HIREDATE,'%d/%m/%y'),SAL,IFNULL(COMM,'')FROM empleados where length(ENAME) = 5 

/* 38. Lo mismo, pero para los empleados cuyo nombre tenga al menos cinco letras.
SELECT EMPNO, DEPTNO,ENAME,JOB,MGR,DATE_FORMAT(HIREDATE,'%d/%m/%y'),SAL,IFNULL(COMM,'')FROM empleados where length(ENAME) >= 5 

/* 39. Halla los datos de los empleados que, o bien su nombre empieza por A y su 
salario es superior a 1000, o bien reciben comision y trabajan en el departamento 30.
SELECT EMPNO, DEPTNO,ENAME,JOB,MGR,DATE_FORMAT(HIREDATE,'%d/%m/%y'),SAL,IFNULL(COMM,'')FROM empleados where (ENAME like 'A%' and sal>1000) or (COMM>0 and deptno=30) 

/* 40. Halla el nombre, el salario y el sueldo total de todos los empleados, ordenando 
el resultado primero por salario y luego por el sueldo total. En el caso de que no 
tenga comision, el sueldo total debe reflejar solo el salario.
SELECT ENAME,SAL AS SALARIO,IFNULL(SAL+COMM,'') AS SALARIO_TOTAL FROM EMPLEADOS ORDER BY SAL,SAL+COMM;