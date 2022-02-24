import UIKit

var greeting = "Hello, playground"

struct Point{
    var x: Float
    var y: Float
}

var origin = Point(x:0, y:0)
origin.x = 10.5

//----------


class Account{
    var balance = 0.0
}

class Person{
    let account: Account
    
    init(account: Account){
        self.account = account
    }
}


//--------

class Teacher{
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    func setName(name: String){
        self.name = name
    }
    
    func getName() -> String?{
        if self.name == ""{
            return nil
        }
        return self.name
    }
}

let nikolas = Teacher(name: "Nikolas")

//print(nikolas.name)
nikolas.setName(name: "Random name")
if let name: String = nikolas.getName(){
    //print(name)
}else{
    //mam nil
}
//-----

nikolas.setName(name: "")
let name:String = nikolas.getName() ?? "Sorry"

//print(name)


//---- Protocol

protocol Logger{
    func saveError(description: String)
}

class MemoryLogger: Logger{
    var errors: [String] = []
    
    func printErrors(){
        for err in errors{
            print(err)
        }
    }
    
    func saveError(description: String) {
        errors.append(description)
    }
}

class ErrorVisualiser: Logger{
    
    func showErrors(){
        print("Nice chart")
    }
    
    func saveError(description: String) {
        //todo
    }
}

class UserManager{
    var logger: Logger
    
    init(logger: Logger){
        self.logger = logger
    }
    
    func addUser(name: String){
        if name.count < 3{
            logger.saveError(description: "problem xxx")
        }

    }
}

let logger = MemoryLogger()
let userMNGR = UserManager(logger: logger)
userMNGR.addUser(name: "AB")

