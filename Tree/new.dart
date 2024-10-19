class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class Tree {
  Node? root;
  int count = 0;

  insert(int data) {
    if (root == null) {
      root = Node(data);
      return;
    }
    insertrecursively(root!, data);
  }

  insertrecursively(Node node, int data) {
    if (data < node.data) {
      if (node.left == null) {
        node.left = Node(data);
      } else {
        insertrecursively(node.left!, data);
      }
    } else {
      if (node.right == null) {
        node.right = Node(data);
      } else {
        insertrecursively(node.right!, data);
      }
    }
  }

  inorder(Node? node) {
    if (node == null) return;
    inorder(node.left);

    print(node.data);
    inorder(node.right);
  }

  sumall(Node? node) {
    if (node == null) return 0;
    return sumall(node.left) + sumall(node.right) + node.data;
  }

  preorder(Node? node) {
    if (node == null) return;
    print(node.data);
    preorder(node.left);
    preorder(node.right);
  }

  postorder(Node? node) {
    if (node == null) return;
    postorder(node.left);
    postorder(node.right);
    print(node.data);
  }

  levelorder(Node? node) {
    if (node == null) return;

    List _queue = [];
    _queue.add(node);
    while (_queue.isNotEmpty) {
      Node current = _queue.removeAt(0);
      print(current.data);

      if (current.left != null) {
        _queue.add(current.left);
      }
      if (current.right != null) {
        _queue.add(current.right);
      }
    }
  }

  countall(Node? node) {
    if (node == null) return 0;

    return countall(node.left) + countall(node.right) + 1;
  }

  countleaf(Node? node) {
    if (node == null) return 0;
    if (node.left == null && node.right == null) {
      return 1;
    }
    return countleaf(node.left) + countleaf(node.right);
  }
}

void main() {
  Tree t = Tree();
  List l1 = [9, 2, 3, 6, 7, 1];
  for (var val in l1) {
    t.insert(val);
  }
  // print("inorder:");
  // t.inorder(t.root);
  // print("preorder:");
  // t.preorder(t.root);
  // print("postorder:");
  // t.postorder(t.root);
  // print('level order:');
  // t.levelorder(t.root);
  int sum = t.sumall(t.root);
  print('sum=$sum');
  int count = t.countall(t.root);
  print('count=$count');
  int countleaf = t.countleaf(t.root);
  print('count=$countleaf');
}
