class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BinaryTree {
  Node? root;
  insert(int data) {
    if (root == null) {
      root = Node(data);
      return;
    }
    List _queue = [];
    _queue.add(root!);

    while (_queue.isNotEmpty) {
      Node current = _queue.removeAt(0);
      if (current.left == null) {
        current.left = Node(data);
        return;
      } else
        _queue.add(current.left);
      if (current.right == null) {
        current.right = Node(data);
        return;
      } else
        _queue.add(current.right);
    }
  }

  inorder(Node? node) {
    if (node == null) return;
    inorder(node.left);
    print(node.data);
    inorder(node.right);
  }

  isbst(Node? node, {int? min, int? max}) {
    if (node == null) return true;
    if ((min != null && node.data <= min) ||
        (max != null && node.data >= max)) {
      return false;
    }
    return isbst(node.left, min: min, max: node.data) &&
        isbst(node.right, min: node.data, max: max);
  }
}

void main() {
  BinaryTree bt = BinaryTree();
  List l1 = [2, 3, 1, 4, 12, 34, 90, 45];
  for (var val in l1) bt.insert(val);

  bt.inorder(bt.root);
  bool find = bt.isbst(bt.root);
  if (find) {
    print('binary tree!');
  } else
    print('not binary tree!');
}
