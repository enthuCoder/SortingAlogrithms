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
    // BUBBLE Sort
    // time complexity: N*N
    // Space Complexity: N*2
    
    // Logic: Bubble out the lightest/heaviest element to the end of the list during each iteration
    //        Iterate though 1-less elements in subsequent passes
    //        https://www.youtube.com/watch?v=xli_FI7CuzA
    // -------  -------  -------  -------  -------  //
    public func bubbleSort(input: [Int]) -> [Int] {
        var result: Array<Int> = input
        for (outerIndex, _) in result.enumerated() {
            var requiredSwap = false
            for (innerIndex, value) in result.enumerated() {
                if innerIndex + 1 < result.count - outerIndex {
                    if result[innerIndex] < result[innerIndex + 1] {
                        swap(&result, swapIndexLeft: innerIndex, swapIndexRight: innerIndex + 1)
                        requiredSwap = true
                    }
                    print("\(innerIndex): \(value)")
                }
            }
            if requiredSwap == false {
                break
            }
        }
        return result
    }
    
    
    // -------  -------  -------  -------  -------  //
    // QUICK Sort
    // It is a recursive algorithm
    // It is a Divide-&-Conquer approach using a pivot
    // Very efficient for large datasets
    // Login: https://www.youtube.com/watch?v=MZaf_9IZCrc
    
    // Worst Case: N*N
    // Average Case: N Log N

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
    // INSERTION Sort
    // time complexity: N*N
    // Space Complexity: N*2
    
    // Logic: Work items left to right
    //        Examine each item and compare it to items to its left
    //        Insert the item in the correct position in the array
    //        https://www.youtube.com/watch?v=JU767SDMDvA&t=27s
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
    // SELECTION Sort
    // Logic: In the same original array, maintain 2 subarrays, one is sorted and another one is unsorted.
    //        Select the lowest element in unsorted array in each iteration and put it in sorted array
    // https://www.youtube.com/watch?v=g-PGLbMth_g&t=5s
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

    // -------  -------  -------  -------  -------  //
    // MERGE Sort
    // time Complexity: n logn
    // 
    // -------  -------  -------  -------  -------  //
    public func mergeSort(input: [Int], lower: Int, higher: Int) {
        
        if lower < higher {
            let mid = (lower + higher) / 2
            mergeSort(input: input, lower: lower, higher: mid)
            mergeSort(input: input, lower: mid+1, higher: higher)
        }
    }
    
    public func merge() {
        
    }
}
