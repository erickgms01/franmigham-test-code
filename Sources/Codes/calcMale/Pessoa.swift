import Foundation

/// Estrutura que representa uma pessoa e seus fatores de saúde.
struct Pessoa {
    var nome: String            // Nome da pessoa.
    var sexo: String            // Sexo da pessoa (M - masculino, F - feminino).
    var idade: Double           // Idade da pessoa.
    var isFumante: Bool         // Indica se a pessoa é fumante (true) ou não (false).
    var isDiabetico: Bool       // Indica se a pessoa é diabética (true) ou não (false).
    var isDcv: Bool             // Indica se a pessoa tem doença cardiovascular (true) ou não (false).
    var isFa: Bool              // Indica se a pessoa tem fibrilação atrial (true) ou não (false).
    var pss: Double             // Pressão sistólica da pessoa.
    var isHrx: Bool             // Indica se a pessoa faz uso de medicamentos para hipertensão (true) ou não (false).
}
    