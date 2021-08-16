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

/* 41. Obten el nombre, salario y la comision de los empleados que perciben 
un salario que esta entre la mitad de la comision y la propia comision.
SELECT ENAME, SAL, COMM FROM EMPLEADOS WHERE SAL BETWEEN 1/2*COMM AND COMM;

/* 42. Obten el nombre, salario y la comision de los empleados que perciben 
un salario complementario al caso 41: que sea superior a la comision o inferior a la mitad de la comision.
SELECT ENAME,SAL,COMM FROM EMPLEADOS WHERE SAL>COMM OR SAL<1/2*COMM;

/* 43. Lista los nombres y empleos de aquellos empleados cuyo empleo acaba 
en MAN y cuyo nombre empieza por A.
SELECT ENAME,JOB FROM EMPLEADOS WHERE JOB LIKE '%MAN' AND ENAME LIKE 'A%';

/* 44. Intenta resolver la pregunta anterior con un predicado simple, es decir, 
de forma que en la clausula WHERE no haya conectores logicos como AND, OR, etc. 
Si ayuda a resolver la pregunta, se puede suponer que el nombre del empleado tiene al menos cinco letras.
SELECT ENAME,JOB FROM EMPLEADOS WHERE ENAME LIKE 'AL%';

/* 45. Halla los nombres de los empleados cuyo nombre tiene como maximo cinco caracteres.
SELECT ENAME FROM EMPLEADOS WHERE LENGTH(ENAME)<=5;

/* 46. Suponiendo que el a~no proximo la subida del sueldo total de cada empleado sera del 60 %, 
y el siguiente del 70 %, halla los nombres y el salario total actual, del a~no proximo y del 
siguiente, de cada empleado. Indique ademas con SI o NO, si el empleado tiene comision. 
SELECT ENAME,IFNULL(SAL+COMM,'') AS SALARIO ,(SAL+COMM)*1.6 AS SAL_ANO_PROXIMO,(SAL+COMM)*1.6*1.7 AS SAL_ANO_SIGUIENTE FROM EMPLEADOS

/* 47. Lista los nombres y fecha de contratacion de aquellos empleados que no son vendedores (SALESMAN).
SELECT ENAME,DATE_FORMAT(HIREDATE,'%d/%m/%y') FROM empleados WHERE JOB NOT LIKE '%SALESMAN%';

/* 48. Obten la informacion disponible de los empleados cuyo numero es uno de los 
siguientes: 7844, 7900, 7521, 7521, 7782, 7934, 7678 y 7369, pero que no sea uno 
de los siguientes: 7902, 7839, 7499 ni 7878. La sentencia no debe complicarse 
innecesariamente, y debe dar el resultado correcto independientemente de lo 
empleados almacenados en la base de datos.
SELECT EMPNO, DEPTNO,ENAME,JOB,MGR,DATE_FORMAT(HIREDATE,'%d/%m/%y'),SAL,IFNULL(COMM,'')FROM empleados
WHERE EMPNO IN (7844,7900,7521,7782,7934,7678,7369);

/* 49. Ordena los empleados por su codigo de departamento, y luego de manera descendente por su numero de empleado.
SELECT EMPNO, DEPTNO,ENAME,JOB,MGR,DATE_FORMAT(HIREDATE,'%d/%m/%y'),SAL,IFNULL(COMM,'')FROM empleados ORDER BY DEPTNO,EMPNO DESC;

/* 50. Para los empleados que tengan como jefe a un empleado con codigo mayor que 
el suyo, obten los que reciben de salario mas de 1000 y menos de 2000, o que estan en el departamento 30.
SELECT ENAME FROM EMPLEADOS WHERE JOB NOT IN('MANAGER','PRESIDENT')

/* 51. Obten el salario mas alto de la empresa, el total destinado a 
comisiones y el numero de empleados.
SELECT MAX(SAL), SUM(COMM),COUNT(*) FROM EMPLEADOS;

/* 52. Halla los datos de los empleados cuyo salario es mayor que el del empleado de codigo 7934, ordenando por el salario.
SELECT EMPNO, DEPTNO,ENAME,JOB,MGR,DATE_FORMAT(HIREDATE,'%d/%m/%y'),SAL,IFNULL(COMM,'')FROM empleados WHERE SAL>(SELECT SAL FROM EMPLEADOS WHERE EMPNO = 7934) ORDER BY SAL;

/* 53. Obten informacion en la que se reflejen los nombres, empleos y salarios tanto de 
los empleados que superan en salario a Allen como del propio Allen.
SELECT ENAME,JOB,SAL FROM EMPLEADOS WHERE SAL >= (SELECT SAL FROM EMPLEADOS WHERE ENAME = 'ALLEN');

/* 54. Halla el nombre el ultimo empleado por orden alfabetico.

SELECT MAX(ENAME) FROM EMPLEADOS;

/* 55. Halla el salario mas alto, el mas bajo, y la diferencia entre ellos.
SELECT MAX(SAL),MIN(SAL),MAX(SAL)-MIN(SAL) FROM EMPLEADOS;

/* 56. Sin conocer los resultados del ejercicio anterior, Â¿quienes reciben el 
salario mas alto y el mas bajo, y a cuanto ascienden estos salarios?
SELECT ENAME,SAL FROM EMPLEADOS 
WHERE SAL=(SELECT MAX(SAL) FROM EMPLEADOS) OR 
SAL =(SELECT MIN(SAL) FROM EMPLEADOS);

/* 57. Considerando empleados con salario menor de 5000, halla la media de los salarios 
de los departamentos cuyo salario minimo supera a 900. Muestra tambien el codigo y 
el nombre de los departamentos.
SELECT DEP.DNAME, AVG(EMP.SAL),DEP.DEPTNO FROM EMPLEADOS EMP 
INNER JOIN DEPARTAMENTOS DEP ON EMP.DEPTNO = DEP.DEPTNO
WHERE SAL<5000 AND SAL>900 GROUP BY DEP.DEPTNO;

/* 58. Â¿Que empleados trabajan en ciudades de mas de cinco letras? Ordena el resultado 
inversamente por ciudades y normalmente por los nombres de los empleados.
SELECT EMP.ENAME FROM EMPLEADOS EMP 
INNER JOIN DEPARTAMENTOS DEP ON EMP.DEPTNO = DEP.DEPTNO
WHERE LENGTH(DEP.LOC)>5 ORDER BY DEP.LOC DESC,EMP.ENAME ASC;

/* 59. Halla los empleados cuyo salario supera o coincide con la media del salario de la empresa.
SELECT ENAME FROM EMPLEADOS WHERE SAL>=(SELECT AVG(SAL) FROM EMPLEADOS);

/* 60. Obten los empleados cuyo salario supera al de sus companeros de departamento.
SELECT ENAME FROM EMPLEADOS WHERE 
SAL=(SELECT MAX(SAL) FROM EMPLEADOS WHERE DEPTNO IN(10)) OR
SAL=(SELECT MAX(SAL) FROM EMPLEADOS WHERE DEPTNO IN(20)) OR
SAL=(SELECT MAX(SAL) FROM EMPLEADOS WHERE DEPTNO IN(30))
GROUP BY EMPNO,DEPTNO ORDER BY DEPTNO;