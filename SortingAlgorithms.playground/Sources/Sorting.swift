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
    //        Swap adjacent elements 
    //        https://www.youtube.com/watch?v=xli_FI7CuzA
    // -------  -------  -------  -------  -------  //
    
    public func bubbleSort(input: [Int]) -> [Int] {
        var result = input
        
        for outerLoop in 0..<input.count {
            // Traverse one element less after each run, as the lightest element would have bubbled out
            for innerLoop in 0..<(input.count - outerLoop) {
               // if (innerLoop + 1 < result.count) && (result[innerLoop] < result[innerLoop + 1]) { // Sort in descending order
                  if (innerLoop + 1 < result.count) && (result[innerLoop] > result[innerLoop + 1])  { // Sort in Ascending order
                    swap(&result, swapIndexLeft: innerLoop, swapIndexRight: innerLoop + 1)
                }
            }
        }
        return result
    }
    
    // -------  -------  -------  -------  -------  //
    // QUICK Sort
    // It is a recursive algorithm
    // It is a Divide-&-Conquer approach using a pivot
    // Very efficient for large datasets
    // Logic: https://www.youtube.com/watch?v=MZaf_9IZCrc
    //        https://www.youtube.com/watch?v=7h1s2SojIRw
    // Worst Case: N*N
    // Average Case: N Log N

    // Logic:
    // 1. select a pivot in unsorted array (it can be mid, or last or first element)
    // 2. Move elements smaller than the pivot to its left, larger than the pivot to right (each iteration should move the pivot to correct position in the final sorted array)
    // 3. Keep doing it until each partition is exhausted
    // -------  -------  -------  -------  -------  //

    public func quickSort_Swifty<T: Comparable>(_ a: [T]) -> [T] {
        guard a.count > 1 else { return a }
        
        let pivot = a[a.count/2]
        let less = a.filter { $0 < pivot }
        let equal = a.filter { $0 == pivot }
        let greater = a.filter { $0 > pivot }
        
        return quickSort_Swifty(less) + equal + quickSort_Swifty(greater)
    }
    
    func swap(_ input: inout [Int], firstIndex: Int, lastIndex: Int) {
        let firstElement = input[firstIndex]
        input[firstIndex] = input[lastIndex]
        input[lastIndex] = firstElement
    }

    
    func partition(input: inout [Int], low: Int, high: Int) -> Int {
        let pivot = input[low]
        var lower = low
        var higher = high
        while lower < higher {
            repeat {
                lower += 1
            } while (input[lower] <= pivot && lower < higher)
            
            while input[higher] > pivot {
                higher -= 1
            }
            
            if lower < higher {
                swap(&input, firstIndex: lower, lastIndex: higher)
            }
        }
        swap(&input, firstIndex: lower, lastIndex: higher)
        
        return higher
    }

    func quickSortHelper(input: inout [Int], l: Int, h: Int) {
        if l < h {
            let idx = partition(input: &input, low: l, high: h)
            quickSortHelper(input: &input, l: l, h: idx - 1)
            quickSortHelper(input: &input, l: idx + 1, h: h)
        }
    }

    public func quickSort(input: inout [Int]) {
        quickSortHelper(input: &input, l: 0, h: (input.count - 1))
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

    public func insertionSort(input: inout [Int]) {
        for i in 1..<input.count {
            for j in 0..<i {
                if input[i-j-1] > input[i-j] {
                    swap(&input, swapIndexLeft:i-j-1, swapIndexRight:i-j)
                }
            }
        }
    }

    // -------  -------  -------  -------  -------  //
    // SELECTION Sort
    // time Complexity: N * N
    //  bubble Sort < Selection Sort < Insertion Sort
    // Logic: In the same original array, maintain 2 subarrays, one is sorted and another one is unsorted.
    //        Select the lowest element in unsorted array in each iteration and swap it with highest index element in sorted array
    // https://www.youtube.com/watch?v=g-PGLbMth_g&t=5s
    
    // NOTE: Heap Sort uses the same principle as selection sort but has a fast method for finding the minimum value in the rest of the array.
    // Heap sort' performance is O(n log n)
    // -------  -------  -------  -------  -------  //
    public func selectionSort(input: inout [Int]) {
        for i in 0..<input.count {
            var minInUnsortedArr = input[i]
            var minIdxUnsortedArr = i
            
            for j in i..<input.count {
                if input[j] < minInUnsortedArr {
                    minInUnsortedArr = input[j]
                    minIdxUnsortedArr = j
                }
            }
            swap(&input, swapIndexLeft: i, swapIndexRight: minIdxUnsortedArr)
        }
    }

    // -------  -------  -------  -------  -------  //
    // MERGE Sort
    // time Complexity: N * log N (for best, worst, and average case)
    // Space Complexity: not an in-place sort algorithm, needs an extra array of equal size as input array
    // Goal: Sort an array in ascending order
    // Logic:
    // 1. Divide the array by half at a time until it can not be divide further. At this time, we will have n arrays with one element each.
    // 2. Merge the arrays with 1 element each in ascending order to get the sorted array
    // Reference: https://github.com/raywenderlich/swift-algorithm-club/tree/master/Merge%20Sort
    // -------  -------  -------  -------  -------  //
    public func mergeSort(input: [Int]) -> [Int] {
        // if there is only 1 element, return
        guard input.count > 1 else {
            return input
        }
        
        let mid = input.count / 2 // for defining the current array in 2 parts
        let leftPart = mergeSort(input: Array(input[0..<mid])) // sort the 1st part of array
        let rightPart = mergeSort(input: Array(input[mid..<input.count])) // sort the 2nd part of array
        
        return merge(leftArray: leftPart, rightArray: rightPart)
    }
    
    fileprivate func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
        // added for debugging
        print("Left Part: \(leftArray)")
        // added for debugging
        print("Right Part: \(rightArray)")

        var leftStartIndex = 0
        var rightStartIndex = 0
        
        var orderedArr = [Int]()
    
        //
        while leftStartIndex < leftArray.count && rightStartIndex < rightArray.count {
            if leftArray[leftStartIndex] < rightArray[rightStartIndex] {
                orderedArr.append(leftArray[leftStartIndex])
                leftStartIndex = leftStartIndex + 1
            } else if rightArray[rightStartIndex] < leftArray[leftStartIndex] {
                orderedArr.append(rightArray[rightStartIndex])
                rightStartIndex = rightStartIndex + 1
            } else {
                orderedArr.append(rightArray[rightStartIndex])
                orderedArr.append(leftArray[leftStartIndex])
                rightStartIndex = rightStartIndex + 1
                leftStartIndex = leftStartIndex + 1
            }
        }
        // Right array is over, merge rest of the items from left array
        while leftStartIndex < leftArray.count {
            orderedArr.append(leftArray[leftStartIndex])
            leftStartIndex = leftStartIndex + 1
        }
        // Left array is over, merge rest of the items from right array
        while rightStartIndex < rightArray.count {
            orderedArr.append(rightArray[rightStartIndex])
            rightStartIndex = rightStartIndex + 1
        }
        // Added for debugging
        print("Merged Array: \(orderedArr)\n")
        
        return orderedArr
    }
}
