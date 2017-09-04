//: Playground - noun: a place where people can play

import UIKit


//MARK - Variables

var aString:String = "Hola, playground"
var anInt:Int = 100
var aDoble:Double = 9999999999999900000
var aFloat:Float = 5.11111
var aChar:Character = "C"

let value = 10
let anotherValue = "String"




//MARK - Operaciones

anInt * value
anInt / value
anInt % value




//MARK - Value Types





//Ejemplo Value Type
struct Person {
    var age: Int = 0
}
var a = Person()
var b = a						// a se copia a b
a.age = 26						// Se cambia a, pero no b

a.age
b.age





//Ejemplo Referencia
class Animal {
    var legs = 4
}

var pig = Animal()
var chicken = pig
chicken.legs = 2

pig.legs
chicken.legs





//Colletions

var farmArray: [Animal] = []
farmArray.append(pig)
farmArray.append(chicken)

var farmDict: [String: Any] = [:]
farmDict["Pig"] = pig
farmDict["Chicken"] = chicken





//Tuplas

//Tupla Anonima

var aTuple = (10,15,67,"Str")
aTuple.0
aTuple.3




//Definiendo nombre de parametros
var anotherTuple = (name:"Tim", last:"Cook")
anotherTuple.name
anotherTuple.last
anotherTuple.0

var coor = (lat: "45", long: "45")
coor.lat




//Con Typle Alias
typealias Names = (String, String, String)

var name:Names = ("Name", "","Last")
name.0
name.1 = "Middle"
name = ("Nombre", "", "Apellido")


