sort(List l1) {
  int len = l1.length;
  for (int i = len - 1; i >= 0; i--) {
    heapify(l1, i, len);
  }
  for (int i = len - 1; i >= 0; i--) {
    int temp = l1[0];
    l1[0] = l1[i];
    l1[i] = temp;
    heapify(l1, 0, i);
  }
}

heapify(List l2, int i, int n) {
  int l = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && l2[left] > l2[l]) {
    l = left;
  }
  if (right < n && l2[right] > l2[l]) {
    l = right;
  }
  if (i != l) {
    int temp = l2[i];
    l2[i] = l2[l];
    l2[l] = temp;
    heapify(l2, l, n);
  }
}

void main() {
  List l1 = [6, 100, 34, 56, 23, 67];
  print(l1);
  sort(l1);
  print(l1);
}
