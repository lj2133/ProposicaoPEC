// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importação dos contratos Deputado e PEC
import "contracts/Deputado.sol";
import "contracts/PEC.sol";

// Contrato Plenario - Responsável pela administração do sistema de votação
contract Plenario {
    PEC public propostaEmenda; // Instância da PEC em votação
    Deputado[77] public deputados; // Array de Deputados
    string[77] public nomesDeputados = [
        "Ana", "Breno", "Carla", "Daniel", "Elisa", "Felipe", "Gabriela", "Hugo", "Isabela", "Joao",
        "Karla", "Luiz", "Maria", "Nathan", "Olivia", "Pedro", "Quiteria", "Rafael", "Sara", "Thiago",
        "Ursula", "Vitor", "Wendy", "Xavier", "Yasmin", "Zoe",
        "Arthur", "Eduarda", "Miguel", "Sophia", "Matheus", "Laura", "Lucas", "Manuela", "Gustavo",
        "Leticia", "Carlos", "Juliana", "Bruno", "Camila", "Leonardo", "Julia", "Caio", "Lara",
        "David", "Mariana", "Alexandre", "Ana Clara", "Joaquim", "Fernanda", "Lucas", "Alice", "Marcos",
        "Isadora", "Rafaela", "Felipe", "Lorena", "Guilherme", "Beatriz", "Joao Pedro", "Amanda",
        "Thiago", "Nicole", "Vinicius", "Carolina", "Gustavo", "Nathalia", "Leandro", "Gabriela", "Raul"
    ]; // Array de nomes de Deputados

    

    // Função para adicionar 77 deputados ao sistema de votação
    function adicionarDeputados() public {
        require(nomesDeputados.length == 77, "Numero incorreto de deputados.");
        for (uint i = 0; i < 77; i++) {
            deputados[i] = new Deputado(nomesDeputados[i]);
        }
    }

    // Função para adicionar uma nova PEC ao sistema de votação
    function adicionarPEC(string memory _nomePEC, string memory _descricaoPEC, uint numDeputados) public {
        propostaEmenda = new PEC(_nomePEC, _descricaoPEC, numDeputados);
    }

    // Função para realizar o primeiro turno de votação
    function votarPrimeiroTurno(bool _voto, uint qtd, bool rand) public {
        for (uint i = 0; i < qtd; i++) {
            // Verifica se o voto é aleatório
            if (rand){
                // Gera um número aleatório usando o bloco atual como semente
                bytes32 _entropy = keccak256(abi.encodePacked(block.timestamp, block.prevrandao,i));
                uint random = uint(_entropy) % 2;
                // Registra o voto no contrato PEC e no contrato Deputado
                if (random == 0){
                    propostaEmenda.registrarVotoPrimeiroTurno(false);
                    deputados[i].votarPrimeiroTurno(false);
                }
                else{
                    propostaEmenda.registrarVotoPrimeiroTurno(true);
                    deputados[i].votarPrimeiroTurno(true);
                }
                
            }
            // Se o voto não é aleatório, registra o voto de acordo com o parâmetro _voto
            else{
                propostaEmenda.registrarVotoPrimeiroTurno(_voto);
                deputados[i].votarPrimeiroTurno(_voto);
                
            }
        }
    }

    // Função para realizar o segundo turno de votação
    function votarSegundoTurno(bool _voto, uint qtd, bool rand) public {
        for (uint i = 0; i < qtd; i++) {
             // Verifica se o voto é aleatório
             if (rand){
                // Gera um número aleatório usando o bloco atual como semente
                bytes32 _entropy = keccak256(abi.encodePacked(block.timestamp, block.prevrandao,i));
                uint random = uint(_entropy) % 2;
                // Registra o voto no contrato PEC e no contrato Deputado
                if (random == 0){
                    propostaEmenda.registrarVotoSegundoTurno(false);
                    deputados[i].votarSegundoTurno(false);
                }
                else{
                    propostaEmenda.registrarVotoSegundoTurno(true);
                    deputados[i].votarSegundoTurno(true);
                }
                
            }
            // Se o voto não é aleatório, registra o voto de acordo com o parâmetro _voto
            else{
                propostaEmenda.registrarVotoSegundoTurno(_voto);
                deputados[i].votarSegundoTurno(_voto);
            }
        }
    }

    // Função para verificar a quantidade de votos favoráveis no primeiro turno
    function verificarVotosFavoraveisPrimeiroTurno() public view returns (uint){
        return propostaEmenda.verificarVotosFavoraveisPrimeiroTurno();
    }

    // Função para verificar a quantidade de votos favoráveis no segundo turno
    function verificarVotosFavoraveisSegundoTurno() public view returns (uint){
        return propostaEmenda.verificarVotosFavoraveisSegundoTurno();
    }

    // Função para verificar se a PEC foi aprovada
    function verificarAprovacao() public view returns (bool) {
        return propostaEmenda.verificarAprovacao();
    }
}
