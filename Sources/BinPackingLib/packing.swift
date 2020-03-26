//
//  File.swift
//  
//
//  Created by Kai on 26.03.20.
//

import Foundation

public func binPacking(capacity: Int, num_packages: Int){
    print("Capacity \(capacity), \(num_packages)")
    
    let packages = (randomElements(range: 1..<capacity, n: num_packages))
    print("Sum of packages \(packages.sum())")
    let bins = firstFit(packages: packages, capacity: capacity )
    
    assert(packages.sum() == bins.sum())
    print(bins)
}


public func firstFit(packages: [Int], capacity: Int)-> [Int]{
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
