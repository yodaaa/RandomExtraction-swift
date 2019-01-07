//
//  RandomExtraction.swift
//  
//
//  Created by yodaaa on 2019/01/01.
//


protocol RandomExtractionProtocol {
    var list: [String]  { get set }
    var overlap: Bool { get set }
    
    func getRandom() -> String
    
    func getAllRandom() -> [String]
    
    func getNRandom(_ count: Int) -> [String]
}

class RandomExtraction: RandomExtractionProtocol {
    
    var list: [String] = []
    
    var overlap: Bool
    
    // list: ランダム抽出する対象のリスト
    // overlap: 抽出する際に、重複するか(true: 重複する, false: 重複しない)
    init(_ list: [String], _ overlap: Bool) {
        self.list = list
        self.overlap = overlap
    }
    
    // 配列からランダムで要素を１つ返す
    func getRandom() -> String {
        return list.randomElement()!
    }
    
    // 配列からランダムで要素をすべて返す
    // String型のShufled
    func getAllRandom() -> [String] {
        var tempList: [String] = self.list
        var randomArray: [String] = []
        
        while !tempList.isEmpty {
            let randomElement = tempList.randomElement()
            randomArray.append(randomElement!)
            
            tempList.remove(at: tempList.index(of: randomElement!)!)
            print("tempList: \(tempList)")
            print("randomArray: \(randomArray)")
            
            
        }
        
        return randomArray
    }
    
    //指定した数のランダムを抽出
    // ※重複しない場合, [配列要素数 < 抽出する数が多い場合], 抽出するのは配列要素数まで
    func getNRandom(_ count: Int) -> [String] {
        var tempList: [String] = self.list
        var randomArray: [String] = []
        
        // 重複する
        if overlap == true {
            for i in 1 ... count{
                randomArray.append(list.randomElement()!)
            }
            
            // 重複しない
        } else if overlap == false {
            let tempCount: Int = count < tempList.count ? count : tempList.count
            
            for i in 1 ... tempCount {
                let randomElement = tempList.randomElement()
                randomArray.append(randomElement!)
                
                tempList.remove(at: tempList.index(of: randomElement!)!)
            }
        }
        
        return randomArray
    }
    
}

// testArray
var testArray: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k"]
var testArrayEmpty: [String] = []

var testRandom: RandomExtraction = RandomExtraction(testArray, true)
var r1 = testRandom.getRandom()
print(r1)

var r2 = testRandom.getAllRandom()
print(r2)

var r3 = testRandom.getNRandom(20)
print("r3: \(r3)")

testRandom.overlap = false
var r4 = testRandom.getNRandom(20)
print("r4: \(r4)")






