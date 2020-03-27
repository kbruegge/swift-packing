import Commander
import Foundation
import BinPackingLib


let main = command(
    Option("capacity", default: 20),
    Option("numPackages", default: 100)
) { capacity, numPackages in
    binPacking(capacity: capacity, numPackages: numPackages)
}


func binPacking(capacity: Int, numPackages: Int){
    let packages = (1..<capacity).randomElements(n: numPackages)!
    
    var bins = OneDimensionalPacking.firstFit(packages: packages, capacity: capacity )
    print("First-Fit bin packing needed \(bins.count) to pack \(numPackages) packages.")
    print(bins)
       
    bins = OneDimensionalPacking.firstFitDecreasing(packages: packages, capacity: capacity )
    print("First-Fit-Decreasing bin packing needed \(bins.count) to pack \(numPackages) packages.")
    print(bins)

    bins = OneDimensionalPacking.bestFit(packages: packages, capacity: capacity )
    print("Best-Fit bin packing needed \(bins.count) to pack \(numPackages) packages.")
    print(bins)
    
    
    print("----------------")
    
    let items = KnapSackPacking.createRandomPackages(capacity: capacity, numPackages: numPackages)

    var knapsack = KnapSackPacking.randomPacking(packages: items, capacity: capacity)
    var totalWeight = knapsack.sum(with: {it in it.weight})
    var totalValue = knapsack.sum(with: {it in it.value})
    print("RandomPacking knapsack packing packed \(knapsack.count) items with a total weight of \(totalWeight) and a total value of \(totalValue)")
    
//    items.sort
    knapsack = KnapSackPacking.firstFitDecreasing(packages: items, capacity: capacity)
    totalWeight = knapsack.sum(with: {it in it.weight})
    totalValue = knapsack.sum(with: {it in it.value})
    print("First-Fit-Decreasing knapsack packing packed \(knapsack.count) items with a total weight of \(totalWeight) and a total value of \(totalValue)")
}
main.run()
