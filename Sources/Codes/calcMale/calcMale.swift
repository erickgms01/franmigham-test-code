
import Foundation

var maleScore: Double = 0;

var maleL: Double = 0;

var maleMean: Double = 4.4227101;

//Constantes Masculinas
let maleAgePoint: Double = 0.49716;
let maleSmoke = 0.47254;
let maleDcv = 0.45341;//Doenca Cardio Vascular
let maleAtrialFibrilation = 0.08064;//Fibrilacao Arterial
let maleAgeMore65 = 0.45426;
let maleDiabete = 1.35304;
let maleDiabete65 = 0.34385;
let maleHrx = 0.82598; //remedio hipertensao
let malePssNoBlood = 0.27323;
let malePssBlood = 0.09793;



func calcLMale(pessoa: Pessoa) -> (Double) {
    maleL = maleAgePoint * (pessoa.idade/10);
    print("Estagio 1", maleL)
    
    if (pessoa.isFumante) {
        maleL += maleSmoke;
        print("Estagio 2", maleL)
    }
    else if(pessoa.isDcv) {
        maleL += maleDcv;
        print("Estagio 3", maleL)
    }
    
    else if(pessoa.isFa){
        maleL += maleAtrialFibrilation;
        print("Estagio 4", maleL)
    }
    
    if(pessoa.idade >= 65){
        maleL += maleAgeMore65;
        print("Estagio 5", maleL)
    }
    
    
    if(pessoa.idade < 65 && pessoa.isDiabetico) {
        maleL += maleDiabete;
        print("Estagio 6", maleL)
    }else if(pessoa.idade >= 65 && pessoa.isDiabetico) {
        maleL += maleDiabete65;
        print("Estagio 7", maleL)
    }
    
    if(pessoa.isHrx){
        maleL += maleHrx;
        maleL += malePssBlood * (pessoa.pss-120)/10
        print("Estagio 8", maleL)
    }
    else if(pessoa.isHrx == false) {
        maleL += malePssNoBlood * (pessoa.pss-120)/10
        print("Estagio 9", maleL)
    }
   
    return maleL;
}

func maleCalcFsrs() {
    
    let time10y = 0.94451;
    let exponencialFunction = exp(maleL - maleMean);

    maleScore = 1 - pow(time10y, exponencialFunction)
    
    //Transforma em porcentagem

    let scorePorcent = maleScore * 100;
    
    print(maleL)
    print(maleMean)
    print("------------------------------------\n")
    print("Sua chance em porcentagem é: ", scorePorcent)
    print("\n------------------------------------")
   
    
}
