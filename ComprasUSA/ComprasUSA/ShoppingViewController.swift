//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Juan Fernandes on 10/04/23.
//

import UIKit

class ShoppingViewController: UIViewController {
    
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var lbRealDecription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfDolar.resignFirstResponder()
        setAmmount()
    }

    func setAmmount() {
        tc.shoppingValue = tc.convertToDouble(tfDolar.text!)
        lbReal.text = tc.getFormattedValue(of: tc.shoppingValue * tc.dolar, withCurrency: "R$ ")
        let dolar = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        lbRealDecription.text = "Valor sem impostos (dólar \(tc.dolar))"
    }
}

