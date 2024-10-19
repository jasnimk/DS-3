class Heap {
  List<int> heap = [];
  int parent(index) => (index - 1) ~/ 2;
  int leftchild(int index) => (2 * index + 1);
  int rightchild(int index) => (2 * index + 2);

  void swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  void printHeap() {
    print(heap);
  }
}

class MaxHeap extends Heap {
  void build(List<int> arr) {
    heap = arr;
    for (int i = parent(heap.length - 1); i >= 0; i--) {
      heapifyDown(i);
    }
  }

  void insert(int value) {
    heap.add(value);
    heapifyUp(heap.length - 1);
  }

  void remove() {
    if (heap.isEmpty) {
      return print('heap is empty');
    }
    heap[0] = heap.removeLast();
    heapifyDown(0);
  }

  heapifyUp(int index) {
    while (index > 0 && heap[index] > heap[parent(index)]) {
      swap(index, parent(index));
      index = parent(index);
    }
  }

  heapifyDown(int index) {
    int largest = index;
    int left = leftchild(index);
    int right = rightchild(index);

    if (left < heap.length && heap[left] > heap[largest]) {
      largest = left;
    }
    if (right < heap.length && heap[right] > heap[largest]) {
      largest = right;
    }

    if (largest != index) {
      swap(index, largest);
      heapifyDown(largest);
    }
  }
  List<int> heapSort() {
    List<int> sorted = [];
    while (!heap.isEmpty) {
      sorted.add(heap.removeAt(0));
      heapifyDown(0);
    }
    return sorted;
  }
}

void main() {
  MaxHeap obj = MaxHeap();
  obj.insert(2);
  obj.insert(6);
  obj.insert(4);
  obj.insert(10);
  obj.insert(7);

  //obj.printHeap();

  obj.insert(12);
  //obj.printHeap();

  //obj.remove();
   print( obj.heapSort());

}