class Heap {
  List _heap = [];

  insert(int value) {
    _heap.add(value);
    heapifyupmax(_heap.length);
    //heapifyUpMin(_heap.length - 1);
  }

  heapifyupmax(int n) {
    if (n == 0) return;
    int parentIndex = (n - 1) ~/ 2;
    if (_heap[parentIndex] < _heap[n]) {
      int temp = _heap[parentIndex];
      _heap[parentIndex] = _heap[n];
      _heap[n] = temp;
    }
    heapifyupmax(parentIndex);
  }

  heapifyUpMin(int n) {
    if (n == 0) return;
    int parentIndex = (n - 1) ~/ 2;
    if (_heap[parentIndex] > _heap[n]) {
      int temp = _heap[parentIndex];
      _heap[parentIndex] = _heap[n];
      _heap[n] = temp;
    }
    heapifyUpMin(parentIndex);
  }

  extract() {
    if (_heap.isEmpty) {
      print('empty Heap!');
      return;
    }
    _heap[0] = _heap[_heap.length - 1];
    _heap.removeLast();

    heapifydown(0);
  }

  heapifydown(int n) {
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
      heapifydown(largest);
    }
  }

  sort() {
    int n = _heap.length;
    for (int i = n - 1; i >= 0; i--) {
      int temp = _heap[0];
      _heap[0] = _heap[i];
      _heap[i] = temp;

      heapify(0, i);
    }
  }

  heapify(int i, int n) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < n && _heap[left] > _heap[largest]) {
      largest = left;
    }
    if (right < n && _heap[right] > _heap[largest]) {
      largest = right;
    }
    if (largest != i) {
      int temp = _heap[i];
      _heap[i] = _heap[largest];
      _heap[largest] = temp;

      heapify(largest, n);
    }
  }

  display() {
    print(_heap);
  }
}

void main() {
  Heap h = Heap();
  List l1 = [3, 2, 1, 5, 33, 56, 23];
  for (var val in l1) h.insert(val);

  h.display();

  h.sort();
  h.display();
}
