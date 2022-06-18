// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract Estudiante{
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping (string => uint8) private notas_materias;
    string [] private _cantMaterias;

    constructor (string memory name, string memory surname, string memory course){
        _nombre = name;
        _apellido = surname;
        _curso = course;
        _docente = msg.sender;
    }

    function apellido() public view returns (string memory){
        return _apellido;
    }

    function nombre_completo() public view returns (string memory){
        return string.concat(_nombre," ",_apellido);
    }

    function curso() public view returns (string memory){
        return _curso;
    }

    function set_nota_materia (uint8 nota, string memory materia) public{
        require(msg.sender == _docente, "Solo el docente puede setear la nota.");
        if (notas_materias[materia] == 0)
        {
            _cantMaterias.push(materia);
        }
        notas_materias[materia]= nota;
    }

    function nota_materia(string memory materia) public view returns(uint8){
        return notas_materias[materia];
    }

    function aprobo(string memory materia) public view returns (bool) {
        bool aprobado;
        if (notas_materias[materia]< 60)
        {
            aprobado = false ;
        }
        else
        {
            aprobado = true;
        }
        return aprobado;
    }

    function promedio() public view returns (uint256) {
        uint256 promedioMaterias = 0;
        for (uint256 i = 0; i < _cantMaterias.length; i++)
        {
            promedioMaterias += notas_materias[_cantMaterias[i]];
        }
        promedioMaterias = promedioMaterias/_cantMaterias.length;
        return promedioMaterias;
    }
}