import Foundation

func main() {
    
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
    
    
    
    calcLMale(pessoa: pessoa1);
 
    maleCalcFsrs()

}


main()
