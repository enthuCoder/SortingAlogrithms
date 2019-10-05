import Cocoa

// -------  -------  -------  -------  -------  //
// Quick Sort
// -------  -------  -------  -------  -------  //
let sorting = Sorting()

var quickSortInput: [Int] = [17, 41, 5, 22, 54, 6, 29, 3, 13]
sorting.quickSort(input: &quickSortInput)
print("=-=-=-=-  Quick Sort  -=-=-=-=")
print("===== SortedList=\(quickSortInput)\n")

// -------  -------  -------  -------  -------  //
// Insertion Sort
// -------  -------  -------  -------  -------  //
let input: [Int] = [5,1,4,2,8]
let insSortedList = sorting.insertionSort(input: input)
print("=-=-=-=-  INSERTION Sort  -=-=-=-=")
print("Input=\(input) ===== SortedList=\(insSortedList)\n")

// -------  -------  -------  -------  -------  //
// Selection Sort
// -------  -------  -------  -------  -------  //
var selectionSortInput: [Int] = [17, 41, 5, 22, 54, 6, 29, 3, 13]
selectionSortInput = sorting.selectionSort(input: selectionSortInput)
print("=-=-=-=-  Selection Sort  -=-=-=-=")
print("===== SortedList=\(selectionSortInput)\n")
