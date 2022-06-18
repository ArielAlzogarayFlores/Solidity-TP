# Solidity-TP
 
Trabajo realizado por Ariel A. y Alan Y. en la versión 0.8.12.

Estudiante.sol : https://rinkeby.etherscan.io/address/0x4c6df1dE1C2C498D49390b6BA8DBF74197827c25

EstudianteAlt.sol : https://rinkeby.etherscan.io/address/0xc5eb711d68B6181639Aa89FDDdf17533DB46EBb7

Opcional:

a) Primero, a las funciones set_bim_nota_materia, bim_nota_materia y aprobo le agregaríamos un uint bimestre en los parámetros a completar. Luego, crearíamos un array bim_notas_materias que sea igual que el mapping solo que lo recorra 4 veces por cada uno de los bimestres. Finalmente, para conocer el promedio de los 4 bimestres, crearíamos un for que recorra el mapping 4 veces para conocer la nota de los 4 bimestres.

b) Creamos un array de address como en cant_Materias que se llame _docentes y le asignamos todas las adresses de los docentes que tienen permiso para asignar notas mediante una función que se llame asignar_docentes. Luego, a la hora de setear las notas, hacemos un for que recorra _docentes y un uint x para conocer la clave de cada address. Si una addres es igual al msg.sender, cortamos el for. Finalmente, en el require ponemos que msg.sender sea igual _docentes[x].

c) Declaramos un event que toma un mensaje y la address del docente que llama a la función. Luego, en set_nota_materia, lo emitimos.

Observación: Al querer realizar la transacción para probar la función set_bim_nota_materia nos pide una cantidad absurda de ether.


