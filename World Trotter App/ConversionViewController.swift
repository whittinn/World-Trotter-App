//
//  ViewController.swift
//  World Trotter App
//
//  Created by Nathaniel Whittington on 7/17/21.
//

import UIKit
//made conversion view controller conform to uitextfielddelegate protocol
class ConversionViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var celsiusLabel : UILabel!
    
    //created a outlet to textfield.
    @IBOutlet var textField : UITextField!
    
    //created a number formatter to formater celsius label digits
    let numbersFormatter : NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()

    
    //created a optional property to store the measurement for temperature.
    var fahrenheitValue : Measurement<UnitTemperature>?{
    
        //created a property observer that will update the fahrenheit value when the text field changes, which will trigger updatecelsius.
        didSet{
            updateCelsius()
        }
    }
    //created a computed property to convert the faherenheitvalue property to the equivalent value in celsius.
    var celsiusValue : Measurement<UnitTemperature>?{
        if let fahrenheitValue = fahrenheitValue{
          return  fahrenheitValue.converted(to: .celsius)
        }else{
         return nil
        }
    }
    //created a method to update celsius label with celsius value in numbers formatter if it has a value.
    func updateCelsius() {
        
        if let celsiusValue = celsiusValue{
            celsiusLabel.text = numbersFormatter.string(from: NSNumber(value: celsiusValue.value))
        }else{
            celsiusLabel.text = "???"
        }
        
        
    }
    
    //created action method to dismiss decmial keyboard with user taps background.
    @IBAction func dismissBackground(_ sender: UITapGestureRecognizer){
        
        textField.resignFirstResponder()
    }
    
    //created an action method to update celsius label with "???" if empty, or in a represented as a double value.
    @IBAction func fahrenheitFieldEditingChanged(_ textfield : UITextField){
        
        //coverted text field string into anumberin a locale indepedent way.
        if let text = textfield.text, let number = numbersFormatter.number(from: text){
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        }else{
            fahrenheitValue = nil
        }
        
    }
    
    
    //added a action delegate method to call on conversation view that handles requests for inputs.
    func textField(_ _textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
       
       //internationalizing the decimal separator
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)

        
        if existingTextHasDecimalSeparator != nil,
        replacementTextHasDecimalSeparator != nil {
            return false
        }else{
            return true
            
        }
        
    }

    
    //override to configure view created by loading a file. method is called after the view of the view controller is created.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Conversion view controller did load.")
        //set initial celsius label to "???"
        updateCelsius()
    }


}

