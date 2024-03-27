// SPDX-License-Identifier: MIT
// Diretiva SPDX-License-Identifier para especificar a licença do contrato

pragma solidity ^0.8.0;

// Contrato Deputado - Responsável por armazenar informações e votos de cada deputado
contract Deputado {
    // Struct Voto - Estrutura para armazenar os votos do deputado
    struct Voto {
        bool votouPrimeiroTurno; // Indica se o deputado votou no primeiro turno
        bool votouSegundoTurno; // Indica se o deputado votou no segundo turno
        bool votoPrimeiroTurno; // Indica o voto do deputado no primeiro turno (true = favorável, false = contrário)
        bool votoSegundoTurno; // Indica o voto do deputado no segundo turno (true = favorável, false = contrário)
    }

    string public nome; // Nome do deputado
    Voto public voto; // Struct Voto para armazenar os votos do deputado

    // Construtor - Função executada apenas uma vez durante a criação do contrato para inicializar o nome e os votos do deputado
    constructor(string memory _nome) {
        nome = _nome; // Inicializa o nome do deputado
        // Inicializa a struct Voto com votouPrimeiroTurno, votouSegundoTurno, votoPrimeiroTurno e votoSegundoTurno como false
        voto.votouPrimeiroTurno = false;
        voto.votouSegundoTurno = false;
        voto.votoPrimeiroTurno = false;
        voto.votoSegundoTurno = false;
    }

    // Função para registrar o voto do deputado no primeiro turno
    function votarPrimeiroTurno(bool _voto) public {
        voto.votouPrimeiroTurno = true; // Marca que o deputado votou no primeiro turno
        voto.votoPrimeiroTurno = _voto; // Registra o voto do deputado no primeiro turno
    }

    // Função para registrar o voto do deputado no segundo turno
    function votarSegundoTurno(bool _voto) public {
        voto.votouSegundoTurno = true; // Marca que o deputado votou no segundo turno
        voto.votoSegundoTurno = _voto; // Registra o voto do deputado no segundo turno
    }
}






