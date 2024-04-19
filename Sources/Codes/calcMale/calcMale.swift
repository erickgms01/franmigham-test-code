import Foundation

// Variáveis globais para o cálculo do risco para homens
var maleScore: Double = 0
var maleL: Double = 0
var maleMean: Double = 4.4227101

// Constantes para o cálculo do risco para homens
let maleAgePoint: Double = 0.49716
let maleSmoke = 0.47254
let maleDcv = 0.45341 // Doença Cardiovascular
let maleAtrialFibrilation = 0.08064 // Fibrilação Arterial
let maleAgeMore65 = 0.45426
let maleDiabete = 1.35304
let maleDiabete65 = 0.34385
let maleHrx = 0.82598 // Remédio para hipertensão
let malePssNoBlood = 0.27323
let malePssBlood = 0.09793

// Função para calcular o risco para homens
func calcLMale(pessoa: Pessoa) -> Double {
    // Inicializa o valor de maleL com base na idade da pessoa
    maleL = maleAgePoint * (Double(pessoa.idade) / 10)
    print("Estágio 1", maleL)
    
    // Adiciona pontos com base em fatores de risco específicos
    if pessoa.isFumante {
        maleL += maleSmoke
        print("Estágio 2", maleL)
    }
    else if pessoa.isDcv {
        maleL += maleDcv
        print("Estágio 3", maleL)
    }
    else if pessoa.isFa {
        maleL += maleAtrialFibrilation
        print("Estágio 4", maleL)
    }
    if pessoa.idade >= 65 {
        maleL += maleAgeMore65
        print("Estágio 5", maleL)
    }
    if pessoa.idade < 65 && pessoa.isDiabetico {
        maleL += maleDiabete
        print("Estágio 6", maleL)
    } else if pessoa.idade >= 65 && pessoa.isDiabetico {
        maleL += maleDiabete65
        print("Estágio 7", maleL)
    }
    if pessoa.isHrx {
        maleL += maleHrx
        maleL += malePssBlood * (Double(pessoa.pss) - 120) / 10
        print("Estágio 8", maleL)
    } else {
        maleL += malePssNoBlood * (Double(pessoa.pss) - 120) / 10
        print("Estágio 9", maleL)
    }
    
    return maleL
}

// Função para calcular o escore FSRS para homens
func maleCalcFsrs() {
    let time10y = 0.94451
    let exponencialFunction = exp(maleL - maleMean)

    maleScore = 1 - pow(time10y, exponencialFunction)
    
    // Transforma o escore em porcentagem
    let scorePorcent = maleScore * 100
    
    let formatNumber = String(format: "%.2f", scorePorcent)
    print("------------------------------------\n")
    print("Sua chance em porcentagem é: ", formatNumber)
    print("\n------------------------------------")
}
