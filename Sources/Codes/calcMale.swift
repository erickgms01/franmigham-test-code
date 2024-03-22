
import Foundation

var score: Double = 0;

var L: Double = 0;
var maleM: Double = 4.4227101;

//Constantes Masculinas
let agePoint = 0.49716;
let smoke = 0.47254;
let dcv = 0.45341;//Doenca Cardio Vascular
let fa = 0.08064;//Fibrilacao Arterial
let ageMore65 = 0.45426;
let diabete = 1.35304;
let diabete65 = 0.34385;
let hrx = 0.82598; //remedio hipertensao
let pssNoBlood = 0.27323;
let pssBlood = 0.09793;

func calcLMale(pessoa: Pessoa) -> (Double) {
    L = agePoint * (pessoa.idade/10);
    print("Estagio 1", L)
    if (pessoa.isFumante) {
        L += smoke;
        print("Estagio 2", L)
    }
    if(pessoa.isDcv) {
        L += dcv;
        print("Estagio 3", L)
    }
    if(pessoa.isFa){
        L += fa;
        print("Estagio 4", L)
    }
    if(pessoa.idade >= 65){
        L += ageMore65;
        print("Estagio 5", L)
    }
            
    if(pessoa.idade < 65 && pessoa.isDiabetico) {
        L += diabete;
        print("Estagio 6", L)
    } else if(pessoa.idade >= 65 && pessoa.isDiabetico) {
        L += diabete65;
        print("Estagio 7", L)
    }
    
    if(pessoa.isHrx){
        L += hrx;
        L += pssBlood * ((pessoa.pss-120)/10)
        print("Estagio 8", L)
    }
    else if(pessoa.isHrx == false) {
        L += pssNoBlood * ((pessoa.pss-120)/10)
        print("Estagio 1", L)
    }
    return L;
}

func calcFsrs() {
    
    let time10y = 0.94451;
    var expoente = L - maleM;

    print(1 - pow(5, 2))
    score = 1 - powl(time10y, expoente)
    
    //Transforma em porcentagem
    
    
    print("Sua chance e: ", score)
}
