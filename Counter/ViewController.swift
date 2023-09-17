//
//  ViewController.swift
//  Counter
//
//  Created by Kirill Sklyarov on 16.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    var dateList = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "0"
    
        // Do any additional setup after loading the view.
    }
    
    // Тут обозначаем кнопки
    @IBOutlet weak var myField: UITextView!
    @IBOutlet weak var nullButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    // Тут пишем метод для формирования сообщений в "логе" нашего экрана
    func information(operation: Int) { 
        let task = Date()
        
        // Создаем и настраиваем форматор дат
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let dateString = dateFormatter.string(from: task)
        
        // Через свитч делаем выбор сообщения в зависимости от параметра operation
        switch operation {
        case -1: dateList += "\n[\(dateString)]: значение изменено на -1"
        case 0: dateList += "\n[\(dateString)]: попытка уменьшить значение счётчика меньше 0"
        case 1: dateList += "\n[\(dateString)]: значение изменено на +1"
        case 2: dateList += "\n[\(dateString)]: значение сброшено"
        default: dateList += "\nОшибочный параметр"
        }
        return myField.text = "\(dateList)"
    }
    
    
    // Настраиваем кнопку плюс - увеличиваем счетчик очков и выводим два поля
    @IBAction func plusButton(_ sender: Any) {
        counter += 1
        counterLabel.text = "\(counter)"
        information(operation: 1)
    }

    // Настраиваем кнопку минут - уменьшаем счетчик очков и выводим два поля

    @IBAction func minusButton(_ sender: Any) {
        counter -= 1
        
        // Делаем проверку на нулевое значение очков и выводим соответствующее сообщение
        if counter < 0 {
            counter = 0
            information(operation: 0)
        } else {
            information(operation: -1)
        }
        counterLabel.text = "\(counter)"
    }
    
    // Настраиваем кнопку обнуления - сбрасываем счетчик очков и выводим два поля
    @IBAction func nullCounter(_ sender: Any) {
        counter = 0
        counterLabel.text = "0"
        information(operation: 2)
    }
}
