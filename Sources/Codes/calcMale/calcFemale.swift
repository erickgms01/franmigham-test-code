import Foundation

// Variáveis globais para o cálculo do risco para mulheres
var femaleScore: Double = 0
var femaleL: Double = 0
var femaleM: Double = 4.4227101

// Constantes para o cálculo do risco para mulheres
let femaleAgePoint = 0.87938
let femaleSmoke = 0.51127
let femaleDcv = -0.03530 // Doença Cardiovascular
let femaleAtrialFibrilation = 1.20720 // Fibrilação Arterial
let femaleAgeMore65 = 0.39796
let femaleDiabete = 1.07111
let femaleDiabete65 = 0.06565
let femaleHrx = 0.13085 // Remédio para hipertensão
let femalePssNoBlood = 0.11303
let femalePssBlood = 0.12234

// Função para calcular o risco para mulheres
func calcFemale(pessoa: Pessoa) -> Double {
    // Inicializa o valor de femaleL com base na idade da pessoa
    femaleL = femaleAgePoint * (Double(pessoa.idade) / 10)
    print("Estágio 1", femaleL)
    
    // Adiciona pontos com base em fatores de risco específicos
    if pessoa.isFumante {
        femaleL += femaleSmoke
        print("Estágio 2", femaleL)
    }
    if pessoa.isDcv {
        femaleL += femaleDcv
        print("Estágio 3", femaleL)
    }
    if pessoa.isFa {
        femaleL += femaleAtrialFibrilation
        print("Estágio 4", femaleL)
    }
    if pessoa.idade >= 65 {
        femaleL += femaleAgeMore65
        print("Estágio 5", femaleL)
    }
    if pessoa.idade < 65 && pessoa.isDiabetico {
        femaleL += femaleDiabete
        print("Estágio 6", femaleL)
    } else if pessoa.idade >= 65 && pessoa.isDiabetico {
        femaleL += femaleDiabete65
        print("Estágio 7", femaleL)
    }
    if pessoa.isHrx {
        femaleL += femaleHrx
        femaleL += femalePssBlood * ((pessoa.pss - 120) / 10)
        print("Estágio 8", femaleL)
    } else {
        femaleL += femalePssNoBlood * ((pessoa.pss - 120) / 10)
        print("Estágio 9", femaleL)
    }
    
    return femaleL
}

// Função para calcular o escore FSRS para mulheres
func calcFsrs() {
    let time10y = 0.094
    let exponencialFunction = exp(femaleL - femaleM)
    
    femaleScore = 1 - pow(time10y, exponencialFunction)
    femaleScore *= -1
    
    // Transforma o escore em porcentagem
    let scorePorcent = femaleScore * 100
    
    print("------------------------------------")
    print("Sua chance em porcentagem é: ", scorePorcent)
}

// Documentação:
// As funções `calcFemale` e `calcFsrs` são responsáveis pelo cálculo do risco e do escore FSRS para mulheres,
// respectivamente. A função `calcFemale` recebe uma instância da estrutura Pessoa como entrada e calcula
// o risco com base nos fatores de risco femininos definidos. Em seguida, retorna o valor do risco.
// A função `calcFsrs` utiliza o risco calculado pela função `calcFemale` para determinar o escore FSRS,
// que representa a probabilidade de desenvolver certas condições de saúde. Este escore é então exibido
// em porcentagem. Todas as constantes e variáveis globais são usadas nessas funções para armazenar valores
// relevantes para os cálculos.
