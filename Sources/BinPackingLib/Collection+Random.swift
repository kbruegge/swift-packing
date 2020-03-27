import Foundation


public extension Collection{
    /// Returns `n` random elements from the collection.
    ///
    /// Call `randomElements(n: 10)` to select 10 random elements from the collections
    /// This example picks 2 names at random from an array:
    ///
    ///     let names = ["Otto", "Detlef", "Helge", "Hanni", "Nanni"]
    ///     let randomNames = names.randomElement()!
    ///     // randomNames == ["Detlef", "Helge"]
    ///
    /// - Returns: Random elements from the collection. If the collection is
    ///   empty, the method returns `nil`.
    ///
    func randomElements(n: Int) -> [Element]? {
        if self.isEmpty{
            return nil
        }
        else{
            return (1...n).map {_ in self.randomElement()!}
        }
    }
}

