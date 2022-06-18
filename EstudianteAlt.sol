// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract EstudianteAlt{
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping (string => uint8)[4] private bim_notas_materias;
    string [] private _cantMaterias;
    address [] private _docentes;

    event Nota_asignada (address indexed sender, string message);

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

    function asignar_docentes(address docente) public {
        require(msg.sender == _docente, "Solo el docente puede asignar otros docentes");

        _docentes.push(docente);
    } 

    function set_bim_nota_materia (uint8 bimestre, uint8 nota, string memory materia) public{
        uint i;
        for (i = 0; i < _docentes.length; i++)
        {
            if (msg.sender == _docentes[i]){
                break;
            }
        }

        require(msg.sender == _docente || msg.sender == _docentes[i], "Solo el docente puede setear la nota.");

        for (uint j = 0; j < 4; i++){
        if (bim_notas_materias[j][materia] == 0)
        {
            _cantMaterias.push(materia);
        }
        }

        bim_notas_materias[bimestre][materia]= nota;
        emit Nota_asignada (msg.sender, "Se ha asignado una nota");
    }

    function bim_nota_materia(uint8 bimestre, string memory materia) public view returns(uint8){
        return bim_notas_materias[bimestre][materia];
    }

    function aprobo(uint8 bimestre, string memory materia) public view returns (bool) {
        bool aprobado;
        if (bim_notas_materias[bimestre][materia]< 60)
        {
            aprobado = false ;
        }
        else
        {
            aprobado = true;
        }
        return aprobado;
    }

    function promedio() public view returns (uint) {
        uint promedioMaterias = 0;
        for (uint j = 0; j < 4; j++){
            for (uint8 i = 0; i< _cantMaterias.length; i++)
            {
                promedioMaterias += bim_notas_materias[j][_cantMaterias[i]];
            }
        }

        promedioMaterias = promedioMaterias/_cantMaterias.length/4;
        return promedioMaterias;
    }
}