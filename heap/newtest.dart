class Heap {
  List _heap = [];

  insert(int value) {
    int len = _heap.length;
    _heap.add(value);
    heapifyUp(len);
  }

  heapifyUp(int len) {
    if (len == 0) return;
    int parentIndex = (len - 1) ~/ 2;
    if (_heap[parentIndex] < _heap[len]) {
      int temp = _heap[parentIndex];
      _heap[parentIndex] = _heap[len];
      _heap[len] = temp;
    }
    heapifyUp(parentIndex);
  }

  extract() {
    if (_heap.isEmpty) {
      print('list empty!');
      return;
    }
    _heap[0] = _heap[_heap.length - 1];
    _heap.removeLast();

    heapifydown(0);
  }

  void heapifydown(int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < _heap.length && _heap[left] > _heap[largest]) {
      largest = left;
    }
    if (right < _heap.length && _heap[right] > _heap[largest]) {
      largest = right;
    }

    if (largest != i) {
      int temp = _heap[largest];
      _heap[largest] = _heap[i];
      _heap[i] = temp;
      heapifydown(largest);
    }
  }

  display() {
    print(_heap);
  }

  sort()
  {
    
  }
}

void main() {
  Heap h = Heap();
  List l1 = [10, 15, 8, 6, 3, 7, 13, 17];
  for (var val in l1) {
    h.insert(val);
  }
  h.display();
  h.extract();
  h.display();
}
