class Heap {
  List _heap = [];

  insert(int value) {
    _heap.add(value);
    heapifyUpMax(_heap.length - 1);
    // heapifyUpMin(_heap.length - 1);
  }

  heapifyUpMin(int n) {
    if (n == 0) return;
    int parentIndex = (n - 1) ~/ 2;
    if (_heap[n] < _heap[parentIndex]) {
      int temp = _heap[parentIndex];
      _heap[parentIndex] = _heap[n];
      _heap[n] = temp;
    }
    heapifyUpMin(parentIndex);
  }

  heapifyUpMax(int n) {
    if (n == 0) return;
    int parentIndex = (n - 1) ~/ 2;
    if (_heap[n] > _heap[parentIndex]) {
      int temp = _heap[n];
      _heap[n] = _heap[parentIndex];
      _heap[parentIndex] = temp;
    }
    heapifyUpMax(parentIndex);
  }

  extraxt() {
    if (_heap.isEmpty) {
      print('Heap empty!');
      return;
    }
    int temp = _heap[0];
    print('removed:$temp');
    _heap[0] = _heap[_heap.length - 1];
    _heap.removeLast();

    heapifyDownMax(0);
  }

  heapifyDownMax(int n) {
    int largest = n;
    int left = 2 * n + 1;
    int right = 2 * n + 2;

    if (left < _heap.length && _heap[left] > _heap[largest]) {
      largest = left;
    }
    if (right < _heap.length && _heap[right] > _heap[largest]) {
      largest = right;
    }
    if (largest != n) {
      int temp = _heap[largest];
      _heap[largest] = _heap[n];
      _heap[n] = temp;
      heapifyDownMax(largest);
    }
  }

  sort() {
    int n = _heap.length;
    for (int i = n - 1; i >= 0; i--) {
      heapify(i, n);
    }
    for (int i = n - 1; i >= 0; i--) {
      int temp = _heap[0];
      _heap[0] = _heap[i];
      _heap[i] = temp;

      heapify(0, i);
    }
  }

  heapify(int i, int n) {
    int l = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;
    if (left < n && _heap[left] > _heap[l]) {
      l = left;
    }
    if (right < n && _heap[right] > _heap[l]) {
      l = right;
    }
    if (i != l) {
      int temp = _heap[i];
      _heap[i] = _heap[l];
      _heap[l] = temp;
      heapify(l, n);
    }
  }

  display() {
    print(_heap);
  }
}

void main() {
  Heap h = Heap();
  List l1 = [10, 3, 5, 2, 4, 15];
  for (var val in l1) {
    h.insert(val);
  }
//  h.display();
  h.insert(34);
  // h.display();
  h.insert(1);
  // h.display();
  h.insert(0);
  h.display();
  // h.extraxt();
  // h.display();
  h.sort();
  h.display();
}
