//
//  File.swift
//  
//
//  Created by Kai on 26.03.20.
//

import Foundation

public struct KnapSackPacking{
    
    public struct Item{
        public var weight: Int = 0
        public var value: Double = 0.0
    }
    
    public static func createRandomPackages(capacity: Int, numPackages: Int) -> [Item]{
        
        let valueRange = 0.001...10
        let weightRange = 1...capacity
        
        func createRandomItem() -> Item{
            let weight = Int.random(in: weightRange)
            let value = Double.random(in: valueRange)
            return Item(weight: weight, value: value)
        }
        
        return  (1...numPackages).map {_ in createRandomItem()}
    }

    public static func randomPacking(packages: [Item], capacity: Int)-> [Item]{
        var packedItems:[Item] = []
        var totalWeight = 0
        while totalWeight < capacity{
            let randomPackage = packages.randomElement()!
            if totalWeight + randomPackage.weight > capacity{
                continue
            }
            packedItems.append(randomPackage)
            totalWeight += randomPackage.weight
        }
        return packedItems
    }
    
    public static func firstFitDecreasing(packages: [Item], capacity: Int)-> [Item]{
        var packedItems:[Item] = []
        var totalWeight = 0
        let sortedPackages = packages.sorted(by: {a, b in a.value/Double(a.weight) > b.value/Double(b.weight)})
        for package in sortedPackages {
            if totalWeight == capacity{
                break
            }
            if totalWeight + package.weight > capacity{
                continue
            }
            totalWeight += package.weight
            packedItems.append(package)
        }
        return packedItems
    }
}

public struct OneDimensionalPacking {
    
    private init(){
        //avpid initializing this. 
    }
    
    public static func firstFit(packages: [Int], capacity: Int)-> [Int]{
        var bins = [0]
        for package in packages{
            var i = 0
            while true{
                if i >= bins.count{
                    bins.append(0)
                }
                if package + bins[i] <= capacity{
                    bins[i] += package
                    i += 1
                    break
                }
                i += 1
            }
        }
        return bins
    }

    public static func firstFitDecreasing(packages: [Int], capacity: Int)-> [Int]{
        return firstFit(packages: packages.sorted(by: >), capacity: capacity)
    }

    public static  func bestFit(packages: [Int], capacity: Int)-> [Int]{
        var bins = [0]
        for package in packages{

            var i = 0
            var bestIndex = -1
            var bestDifference = capacity
            while i < bins.count{
                let diff = capacity - (package + bins[i])
                if (diff < bestDifference) && (diff >= 0) {
                    bestDifference = diff
                    bestIndex = i
                }
                i += 1
            }
            if bestIndex >= 0 {
                bins[bestIndex] += package
            } else {
                bins.append(package)
            }
        }
        return bins
    }

}
