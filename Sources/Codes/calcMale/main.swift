import Foundation

// Função principal
func main() {
    // Criação de instâncias de Pessoa para teste
    let pessoa1: Pessoa = Pessoa(nome: "Erick",
                                 sexo: "M",
                                 idade: 57,
                                 isFumante: false,
                                 isDiabetico: false,
                                 isDcv: false,
                                 isFa: false,
                                 pss: 135,
                                 isHrx: false)
    
    let pessoa2: Pessoa = Pessoa(nome: "Erick",
                                 sexo: "M",
                                 idade: 57,
                                 isFumante: false,
                                 isDiabetico: false,
                                 isDcv: false,
                                 isFa: true,
                                 pss: 135,
                                 isHrx: true)
    
    // Chamadas de função para cálculo de risco para homens
    calcLMale(pessoa: pessoa1)
    maleCalcFsrs()
    
    // Criação de outra instância de Pessoa para teste
    let pessoa3: Pessoa = Pessoa(nome: "Erick",
                                 sexo: "M",
                                 idade: 86,
                                 isFumante: true,
                                 isDiabetico: true,
                                 isDcv: true,
                                 isFa: true,
                                 pss: 145,
                                 isHrx: true)
    calcLMale(pessoa: pessoa3)
    maleCalcFsrs()
}

// Chamada da função principal para iniciar o programa
main()
