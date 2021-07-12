//
//  Time.swift
//  Timer
//
//  Created by Артем Соловьев on 12.07.2021.
//

func getTime(seconds: Int) -> String {
    switch seconds {
    case 1 ..< 60:
        return "0:0:\(seconds)"
    case 60 ..< 3600:
        return "0:\(seconds/60):\(seconds%60)"
    case 3600 ..< 86400:
        return "\(seconds/3600):\(seconds%3600/60):\(seconds%60)"
    default:
        return "23:59:59"
    }
}
func sorted(names:[String], timers:[Int])->(names:[String], timers:[Int]){
    var returnNames = [String]()
    var returnTimers = [Int]()
    let Dictionary = Dictionary(uniqueKeysWithValues: zip(timers, names))
    for (timers,names) in (Array(Dictionary).sorted {$0 > $1}) {
        returnTimers.append(timers)
        returnNames.append(names)
    }
    return (returnNames, returnTimers)
}
