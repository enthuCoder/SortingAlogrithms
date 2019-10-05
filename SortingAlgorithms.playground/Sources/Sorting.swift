import Foundation

// -------  -------  -------  -------  -------  //
// Common functions needed for Sorting
// -------  -------  -------  -------  -------  //
protocol SortUtils {
    func swap(_ input: inout [Int], swapIndexLeft: Int, swapIndexRight: Int)
}

extension SortUtils {
    
    func swap(_ input: inout [Int], swapIndexLeft: Int, swapIndexRight: Int) {
        let tempElement = input[swapIndexLeft]
        input[swapIndexLeft] = input[swapIndexRight]
        input[swapIndexRight] = tempElement
    }
}

public struct Sorting: SortUtils {
    
    public init() {}
    
    // -------  -------  -------  -------  -------  //
    // Quick Sort
    // -------  -------  -------  -------  -------  //

    public func quickSort(input: inout [Int]) {
        sort(inputArr: &input, lowIndex: 0, highIndex: input.count-1)
    }
    
    private func sort(inputArr: inout [Int], lowIndex: Int, highIndex: Int) {
        if lowIndex < highIndex {
            
            let pi = partition(arr: &inputArr, low: lowIndex, high: highIndex)
            
            sort(inputArr: &inputArr, lowIndex: lowIndex, highIndex: pi - 1)
            sort(inputArr: &inputArr, lowIndex: pi + 1, highIndex: highIndex)
        }
    }
    
    private func partition(arr: inout [Int], low: Int, high: Int) -> Int {
        var i = low - 1
        var j = low
        
        while j < high {
            if arr[j] < arr[high] {
                i = i + 1
                swap(&arr, swapIndexLeft: i, swapIndexRight: j)
            }
            j = j + 1
        }
        arr.insert(arr.remove(at: high), at: i+1)
        return i+1
    }

    // -------  -------  -------  -------  -------  //
    // Insertion Sort
    // -------  -------  -------  -------  -------  //

    public func insertionSort(input: [Int]) -> [Int] {
        var result = input
        
        for (i, _) in input[1..<input.count].enumerated() {
            for (j, _) in input[0..<i].enumerated() {
                print("\n i:\(i) j:\(j)")
                if result[j] > result[i] {
                    let removedElement = result.remove(at: i)
                    result.insert(removedElement, at: j)
                    print("\(i):: \(result)")
                }
            }
        }
        
        return result
    }

    // -------  -------  -------  -------  -------  //
    // Selection Sort
    // -------  -------  -------  -------  -------  //
    public func selectionSort(input: [Int]) -> [Int] {
        var result = input
        var swapIndex = -1
        var swapNeeded = false
        
        for outerIndex in 0..<input.count {
            swapIndex = outerIndex
            for innerIndex in outerIndex..<input.count {
                if result[innerIndex] < result[swapIndex] {
                    swapIndex = innerIndex
                    swapNeeded = true
                }
            }
            if swapNeeded == true {
                swap(&result, swapIndexLeft: outerIndex, swapIndexRight: swapIndex)
            }
            swapIndex = -1
            swapNeeded = false
        }
        
        return result
    }

}
