import Foundation

func main() {
    
    //Constantes Masculinas
    let agePoint = 0.49716;
    let smoke = 0.47254;
    let dcv = 0.45341;//Doenca Cardio Vascular
    let fa = 0.08064;//Fibrilacao Arterial
    let ageMore65 = 0.45426;
    let diabete = 1.35304;
    let diabete65 = 0.34385;
    let hrx = 0.82598;
    let pssNoBlood = 0.27323;
    let pssBlood = 0.09793;


    //Dados Ilusorios
    var pessoa1: Pessoa = Pessoa(nome: "Erick", sexo: "M", idade: 69, isFumante: true, isDiabetico: true, isDcv: true, isFa: true, pss: 120, isHrx: true)
    
    
    var score: Double = 0;
    
    var L: Double = 0;
    var M: Double = 0;
    
    
    func calcLMale() {
        L = 0.49716 * (pessoa1.idade/10);
        
        if (pessoa1.isFumante) {
            L += smoke;
        }
        else if(pessoa1.isDcv) {
            L += dcv;
        }
        else if(pessoa1.isFa){
            L += fa;
        }
        else if(pessoa1.idade >= 65){
            L += ageMore65;
        }
                
        else if(pessoa1.idade < 65 && pessoa1.isDiabetico) {
            L += diabete;
        }
        else if(pessoa1.idade >= 65 && pessoa1.isDiabetico) {
            L += diabete65;
        }
        else if(pessoa1.isHrx){
            L += hrx;
            L += pssBlood * (pessoa1.pss/120)
        }
        else if(pessoa1.isHrx == false) {
            L += pssNoBlood * (pessoa1.pss/120)
        }
    }
    func calcM() {
        let betaCoefficients = [
            agePoint,
            smoke,
            dcv,
            fa,
            ageMore65,
            diabete,
            diabete65,
            hrx,
            pssNoBlood,
            pssBlood,
          ]
          let means = [
            pessoa1.idade / 10,
            pessoa1.isFumante ? 1 : 0,
            pessoa1.isDcv ? 1 : 0,
            pessoa1.isFa ? 1 : 0,
            pessoa1.idade >= 65 ? 1 : 0,
            pessoa1.isDiabetico ? 1 : 0,
            pessoa1.idade >= 65 && pessoa1.isDiabetico ? 1 : 0,
            pessoa1.isHrx ? 1 : 0,
            pessoa1.pss / 120, // Assuming mean PSS is
            pessoa1.isHrx ? pssBlood : pssNoBlood,
          ]
          
          var sum = 0.0
          for (i, beta) in betaCoefficients.enumerated() {
            sum += beta * means[i]
          }
          M = sum
    }
    
    func calcFsrs() {
        let time10y = 0.94451;
        print(M)
        score = 1 - (pow(time10y, L-M))
        print(score)
        //Transforma em porcentagem
        score = score / 100;
        
        print("Sua chance e: ", score)
    }
    
    
    
    calcLMale()
    calcM()
    calcFsrs()
}


main()
