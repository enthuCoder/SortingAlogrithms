import Cocoa

let sorting = Sorting()

// -------  -------  -------  -------  -------  //
// BUBBLE Sort
// -------  -------  -------  -------  -------  //
let bubbleSortInput: [Int] = [5,1,4,2,8]
let bubSortedList = sorting.bubbleSort(input: bubbleSortInput)
print("\n=-=-=-=-  BUBBLE Sort  -=-=-=-=")
print("Input=\(bubbleSortInput) ===== SortedList=\(bubSortedList)\n")

// -------  -------  -------  -------  -------  //
// QUICK Sort
// -------  -------  -------  -------  -------  //
var quickSortInput: [Int] = [17, 41, 5, 22, 54, 6, 29, 3, 13]
sorting.quickSort(input: &quickSortInput)
print("=-=-=-=-  QUICK Sort  -=-=-=-=")
print("===== SortedList=\(quickSortInput)\n")

// -------  -------  -------  -------  -------  //
// INSERTION Sort
// -------  -------  -------  -------  -------  //
let input: [Int] = [5,1,4,2,8]
let insSortedList = sorting.insertionSort(input: input)
print("=-=-=-=-  INSERTION Sort  -=-=-=-=")
print("Input=\(input) ===== SortedList=\(insSortedList)\n")

// -------  -------  -------  -------  -------  //
// SELECTION Sort
// -------  -------  -------  -------  -------  //
var selectionSortInput: [Int] = [17, 41, 5, 22, 54, 6, 29, 3, 13]
selectionSortInput = sorting.selectionSort(input: selectionSortInput)
print("=-=-=-=-  SELECTION Sort  -=-=-=-=")
print("===== SortedList=\(selectionSortInput)\n")

// -------  -------  -------  -------  -------  //
// MERGE Sort
// -------  -------  -------  -------  -------  //
var mergeSortInput: [Int] = [9,7,8,3,2,1]
mergeSortInput = sorting.mergeSort(input: mergeSortInput)
print("=-=-=-=-  MERGE Sort  -=-=-=-=")
print("===== SortedList=\(mergeSortInput)\n")
