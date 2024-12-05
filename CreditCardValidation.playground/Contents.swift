import UIKit

let cardNumber = "4111111111111111"

func isValidCreditCard(_number: String) -> Bool {
    
    /*Verifica se o cartão tem 16 dígitos(requisito mínimo para que seja um cartão válido). Caso não tenha 16 dígitos, já encerra a verificação não executando o restante do código*/
    guard _number.count == 16 else {
            print("O número do cartão não tem 16 dígitos.")
            return false
        }
    
    var sum = 0  /* Armazena a soma dos valores*/
    let length = _number.count /* Determina o número de dígitos do cartão */
    
/* Percorre todos os dígitos do cartão até o penúltimo, pois o último dígito é o dígito de verificação*/
    for i in 0..<length - 1 {
        let index = _number.index(_number.startIndex, offsetBy: i)
        if let value = _number[index].wholeNumberValue {
            if i % 2 != 0 { /* Se a divisão por dois for diferente de paridade então*/
                sum += value /* Não Dobra*/
            } else if value > 4 { /* Senão dobra e nos números maiores que 4 que o dobro seria 8, subtrai 9*/
                sum += 2 * value - 9
            } else {
                sum += 2 * value
            }
        } else {
            return false
        }
    }
    
    var validLastNumber = ((10 - (sum % 10)) % 10)  /* soma % 10 = calcula o resto da divisão por 10 da soma, 10 - = complemento necessário para que a soma se torne um múltiplo de 10 e o último % 10 = resolve o caso em que o dígito de verificação for 10*/
    
    if let lastNumber = _number.last?.wholeNumberValue {
        return lastNumber == validLastNumber
    }

    return false
    
 
}

if isValidCreditCard(_number: cardNumber) {
    print("O número do cartão é válido!")
} else if cardNumber.count == 16 {
    print("O número do cartão é inválido.")
}
