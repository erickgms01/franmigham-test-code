import Foundation

var femaleScore: Double = 0;

var femaleL: Double = 0;

var femaleM: Double = 4.4227101;

//Constantes Femininas
let femaleAgePoint = 0.87938;
let femaleSmoke = 0.51127;
let femaleDcv = -0.03530;//Doenca Cardio Vascular
let femaleAtrialFibrilation = 1.20720;//Fibrilacao Arterial
let femaleAgeMore65 = 0.39796;
let femaleDiabete = 1.07111;
let femaleDiabete65 = 0.06565;
let femaleHrx = 0.13085; //remedio hipertensao
let femalePssNoBlood = 0.11303;
let femalePssBlood = 0.12234;



func calcFemale(pessoa: Pessoa) -> (Double) {
    femaleL = femaleAgePoint * (pessoa.idade/10);
    print("Estagio 1", femaleL)
    
    if (pessoa.isFumante) {
        femaleL += femaleSmoke;
        print("Estagio 2", femaleL)
    }
    if(pessoa.isDcv) {
        femaleL += femaleDcv;
        print("Estagio 3", femaleL)
    }
    if(pessoa.isFa){
        femaleL += femaleAtrialFibrilation;
        print("Estagio 4", femaleL)
    }
    if(pessoa.idade >= 65){
        femaleL += femaleAgeMore65;
        print("Estagio 5", femaleL)
    }
            
    if(pessoa.idade < 65 && pessoa.isDiabetico) {
        femaleL += femaleDiabete;
        print("Estagio 6", femaleL)
    } else if(pessoa.idade >= 65 && pessoa.isDiabetico) {
        femaleL += femaleDiabete65;
        print("Estagio 7", femaleL)
    }
    
    if(pessoa.isHrx){
        femaleL += femaleHrx;
        femaleL += femalePssBlood * ((pessoa.pss-120)/10)
        print("Estagio 8", femaleL)
    }
    else if(pessoa.isHrx == false) {
        femaleL += femalePssNoBlood * ((pessoa.pss-120)/10)
        print("Estagio 9", femaleL)
    }
   
    return femaleL;
}

func calcFsrs() {
    
    let time10y = 0.094;
    let exponencialFunction = exp(femaleL - femaleM);

    femaleScore = 1 - powl(time10y, exponencialFunction)
    femaleScore *= -1;
    //Transforma em porcentagem
    print("------------------------------------");
    //Score inválido, porque ao tranformar em porcentagem o valor fica completamente errado
    print("Sua chance e: ", femaleScore)
    
    
    let scorePorcent = femaleScore * 100;
    
    print("------------------------------------")
    print("Sua chance em porcentagem é: ", scorePorcent)
    print("Ao invés de 1.74")
    
}
