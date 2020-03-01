import Cocoa

let sorting = Sorting()

// -------  -------  -------  -------  -------  //
// BUBBLE Sort
// -------  -------  -------  -------  -------  //
let bubbleSortInput: [Int] = [5,1,4,2,8]
print("\n// -------  -------  -------  -------  -------  //")
print("=-=-=-=-  BUBBLE Sort  -=-=-=-=")
print("INPUT=\(bubbleSortInput)")
print("Sorting...\n")
let bubSortedList = sorting.bubbleSort(input: bubbleSortInput)

print("\nSortedList=\(bubSortedList)\n")
print("// -------  -------  -------  -------  -------  //\n")

// -------  -------  -------  -------  -------  //
// QUICK Sort
// -------  -------  -------  -------  -------  //
var quickSortInput: [Int] = [17, 41, 5, 22, 54, 6, 29, 3, 13]
print("\n// -------  -------  -------  -------  -------  //")
print("=-=-=-=-  QUICK Sort  -=-=-=-=")
print("INPUT=\(quickSortInput)")
print("Sorting...\n")
sorting.quickSort(input: &quickSortInput)
print("SortedList=\(quickSortInput)\n")
print("// -------  -------  -------  -------  -------  //\n")

// -------  -------  -------  -------  -------  //
// INSERTION Sort
// -------  -------  -------  -------  -------  //
var insertionSortInput: [Int] = [5,1,4,2,8]
print("\n// -------  -------  -------  -------  -------  //")
print("=-=-=-=-  INSERTION Sort  -=-=-=-=")
print("INPUT=\(insertionSortInput)")
print("Sorting...\n")
sorting.insertionSort(input: &insertionSortInput)
print("SortedList=\(insertionSortInput)\n")

// -------  -------  -------  -------  -------  //
// SELECTION Sort
// -------  -------  -------  -------  -------  //
var selectionSortInput: [Int] = [17, 41, 5, 22, 54, 6, 29, 3, 13]
print("\n// -------  -------  -------  -------  -------  //")
print("=-=-=-=-  SELECTION Sort  -=-=-=-=")
print("INPUT=\(selectionSortInput)")
print("Sorting...\n")
sorting.selectionSort(input: &selectionSortInput)
print("SortedList=\(selectionSortInput)\n")
print("// -------  -------  -------  -------  -------  //\n")

// -------  -------  -------  -------  -------  //
// MERGE Sort
// -------  -------  -------  -------  -------  //
var mergeSortInput: [Int] = [9,7,8,3,2,1]
print("\n// -------  -------  -------  -------  -------  //")
print("=-=-=-=-  MERGE Sort  -=-=-=-=")
print("INPUT=\(mergeSortInput)")
print("Sorting...\n")
mergeSortInput = sorting.mergeSort(input: mergeSortInput)

print("SortedList=\(mergeSortInput)\n")
print("// -------  -------  -------  -------  -------  //\n")
