class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class Tree {
  Node? root;

  insert(int data) {
    if (root == null) {
      root = Node(data);
    } else
      insertrecursively(root!, data);
  }

  insertrecursively(Node node, int data) {
    if (data < node.data) {
      if (node.left == null) {
        node.left = Node(data);
      } else {
        insertrecursively(node.left!, data);
      }
    }
    if (data > node.data) {
      if (node.right == null) {
        node.right = Node(data);
      } else {
        insertrecursively(node.right!, data);
      }
    }
  }

  inorder() {
    if (root != null) {
      print('inorder printing:');
      inorderrecursively(root!);
    } else {
      print("Tree is empty");
    }
  }

  inorderrecursively(Node? node) {
    if (node == null) {
      return;
    }
    inorderrecursively(node.left);
    print(node.data);
    inorderrecursively(node.right);
  }

  preorder() {
    if (root != null) {
      print('Preorder:');
      preorderrecursively(root!);
    } else {
      print('empty tree!');
    }
  }

  preorderrecursively(Node? node) {
    if (node == null) return;
    print(node.data);
    preorderrecursively(node.left);
    preorderrecursively(node.right);
  }

  postorder() {
    if (root != null) {
      print('Postorder:');
      postorderrecursively(root!);
    } else
      print('empty tree!');
  }

  postorderrecursively(Node? node) {
    if (node == null) return;
    postorderrecursively(node.left);
    postorderrecursively(node.right);
    print(node.data);
  }

  minval() {
    // print(root?.data);
    if (root == null) {
      return null;
    } else
      return findmin(root!);
  }

  Node findmin(Node node) {
    //  print(node.data);
    while (node.left != null) {
      node = node.left!;
    }
    return node;
  }

  findmax(Node node) {
    if (root == null) {
      return null;
    } else {
      while (node.right != null) {
        node = node.right!;
      }
      return node;
    }
  }

  deletenode(Node? node, int data) {
    if (node == null) return null;
    if (data < node.data) {
      node.left = deletenode(node.left, data);
    } else if (data > node.data) {
      node.right = deletenode(node.right, data);
    } else {
      if (node.left == null) return node.right;
      if (node.right == null) return node.left;

      Node min = findmin(node.right!);
      node.data = min.data;
      node.right = deletenode(node.right, min.data);
    }
    return node;
  }

}

void main() {
  Tree t = Tree();
  List l1 = [8, 3, 1, 6, 4, 7, 10, 14, 13];
  for (var val in l1) {
    t.insert(val);
  }
  t.inorder();
  // t.preorder();
  // t.postorder();
  // Node? data = t.minval();
  // print('min value:${data?.data}');
  // Node? data1 = t.findmax(t.root!);
  // print('max value:${data1?.data}');
  t.deletenode(t.root, 7);
  t.inorder();
}
