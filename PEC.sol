// SPDX-License-Identifier: MIT
// Diretiva SPDX-License-Identifier para especificar a licença do contrato

pragma solidity ^0.8.0;

// Contrato PEC - Responsável por armazenar informações e gerenciar os votos da Proposta de 
// Emenda Constitucional
contract PEC {
    string public nome; // Nome da PEC
    string public descricao; // Descrição da PEC
    uint private  quorum; // Quorum para proposição da PEC
    uint private votosFavoraveisPrimeiroTurno; // Número de votos favoráveis no primeiro turno
    uint private votosContraPrimeiroTurno; // Número de votos contrários no primeiro turno
    uint private votosFavoraveisSegundoTurno; // Número de votos favoráveis no segundo turno
    uint private votosContraSegundoTurno; // Número de votos contrários no segundo turno

    // Construtor - Função executada apenas uma vez durante a criação do contrato para inicializar o 
    // nome e a descrição da PEC, bem como o quórim mínimo de 1/3 dos Deputados Estaduais para propô-la
    constructor(string memory _nome, string memory _descricao, uint  _quorum) {
        require(_quorum >= 26, "Numero insuficiente para proposicao de PEC");
        nome = _nome; // Inicializa o nome da PEC
        descricao = _descricao; // Inicializa a descrição da PEC
        quorum = _quorum;// Inicialização do quórum
    }

    // Função para registrar o voto no primeiro turno da PEC
    function registrarVotoPrimeiroTurno(bool _favoravel) public {
        if (_favoravel) {
            votosFavoraveisPrimeiroTurno++; // Incrementa o número de votos favoráveis no primeiro turno
        } else {
            votosContraPrimeiroTurno++; // Incrementa o número de votos contrários no primeiro turno
        }
    }

    // Função para registrar o voto no segundo turno da PEC
    function registrarVotoSegundoTurno(bool _favoravel) public {
        if (_favoravel) {
            votosFavoraveisSegundoTurno++; // Incrementa o número de votos favoráveis no segundo turno
        } else {
            votosContraSegundoTurno++; // Incrementa o número de votos contrários no segundo turno
        }
    }

    // Função para verificar o número de votos favoráveis no primeiro turno da PEC
    function verificarVotosFavoraveisPrimeiroTurno() public view returns (uint){
        return votosFavoraveisPrimeiroTurno;
    }

    // Função para verificar o número de votos favoráveis no segundo turno da PEC
    function verificarVotosFavoraveisSegundoTurno() public view returns (uint){
        return votosFavoraveisSegundoTurno;
    }

    // Função para verificar se a PEC foi aprovada, ou seja, se obteve no mínimo 43 votos favoráveis em ambos os turnos
    function verificarAprovacao() public view returns (bool) {
        return votosFavoraveisPrimeiroTurno >= 43 && votosFavoraveisSegundoTurno >= 43;
    }
}
