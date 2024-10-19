import 'dart:collection';
import 'dart:math';
import 'dart:mirrors';

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
      return;
    }
    insert1(root!, data);
  }

  insert1(Node node, int data) {
    if (data < node.data) {
      if (node.left == null)
        node.left = Node(data);
      else
        insert1(node.left!, data);
    } else {
      if (node.right == null)
        node.right = Node(data);
      else
        insert1(node.right!, data);
    }
  }

  inorder(Node? node) {
    if (node == null) return;
    inorder(node.left);
    print(node.data);
    inorder(node.right);
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
    Queue q = Queue();
    q.add(node);
    while (q.isNotEmpty) {
      Node current = q.removeFirst();
      print(current.data);
      if (current.left != null) q.add(current.left);
      if (current.right != null) q.add(current.right);
    }
  }

  findmin(Node? node) {
    while (node!.left != null) {
      node = node.left;
    }
    return node.data;
  }

  findmax(Node? node) {
    while (node!.right != null) {
      node = node.right;
    }
    return node.data;
  }

  deleteNode(Node? node, int data) {
    if (node == null) return;
    if (data < node.data) {
      node.left = deleteNode(node.left, data);
    } else if (data > node.data) {
      node.right = deleteNode(node.right, data);
    } else {
      if (node.left == null) return node.right;
      if (node.right == null) return node.left;

      Node min = findmin(node.right);
      node.data = min.data;
      node.right = deleteNode(node.right, min.data);
    }
    return node;
  }

  search(Node? node, int data) {
    if (node == null) return false;
    if (node.data == data) return true;
    if (data < node.data)
      return search(node.left, data);
    else
      return search(node.right, data);
  }

  int? close;
  findclosest(Node? node, int number) {
    print(close);
    if (node == null) return close;
    if (close == null) close = node.data;
    if ((node.data - number).abs() < (close! - number).abs()) {
      close = node.data;
    }

    if (number < node.data) findclosest(node.left, number);
    if (number > node.data) findclosest(node.right, number);

    return close;
  }

  isBst(Node? node, {int? min, int? max}) {
    if (node == null) return true;
    if ((min != null && node.data <= min) || (max != null && node.data >= max))
      return false;

    return isBst(node.left, min: min, max: node.data) &&
        isBst(node.right, min: node.data, max: max);
  }

  sumofnodes(Node? node) {
    if (node == null) return 0;
    return sumofnodes(node.left) + sumofnodes(node.right) + node.data;
  }

  count(Node? node) {
    if (node == null) return 0;
    return count(node.left) + count(node.right) + 1;
  }

  countleaf(Node? node) {
    if (node == null) return 0;
    if (node.left == null && node.right == null) return 1;
    return countleaf(node.left) + countleaf(node.right);
  }

  sumofleafs(Node? node) {
    if (node == null) return 0;
    if (node.left == null && node.right == null) return node.data;
    return sumofleafs(node.left) + sumofleafs(node.right);
  }

  height(Node? node) {
    if (node == null) return -1;
    int left = height(node.left);
    int right = height(node.right);
    //return (left > right) ? left + 1 : right + 1;
    return max(left, right) + 1;
  }

  findLca(Node? node, int n1, int n2) {
    if (node == null) return;
    if (n1 < node.data && n2 < node.data)
      findLca(node.left, n1, n2);
    else if (n1 > node.data && n2 > node.data)
      findLca(node.right, n1, n2);
    else
      return node.data;
  }

  secondlargest(Node? node) {
    if (node == null || (node.right == null && node.left == null)) return;
    Node? current = node;
    Node? parent;

    while (current?.right != null) {
      parent = current;
      current = current?.right;
    }
    if (current?.left != null) {
      return findmax(current?.left);
    }
    return parent!.data;
  }

  secondsmallest(Node? node) {
    if (node == null || (node.right == null && node.left == null)) {
      return null;
    }
    Node? current = node;
    Node? parent;

    while (current?.left != null) {
      parent = current;
      current = current?.left;
    }
    if (current?.right != null) return findmin(current!.right);

    return parent!.data;
  }
}

void main() {
  Tree t = Tree();
  List l1 = [10, 15, 8, 6, 3, 7, 13, 17];
  for (var val in l1) t.insert(val);
  // t.levelorder(t.root);
  // Node node = t.findmin(t.root);
  // print('minimum data: ${node.data}');
  // Node node1 = t.findmax(t.root);
  // print('maxim data: ${node1.data}');
  // t.deleteNode(t.root, 3);

  // t.levelorder(t.root);
  // print(t.search(t.root, 17));
  print(t.findclosest(t.root, 17));
  // print(t.isBst(t.root));
  // print(t.sumofnodes(t.root));
  // print(t.sumofleafs(t.root));
  // print(t.height(t.root));
  // print(t.findLca(t.root, 15, 8));
  // print(t.secondlargest(t.root));
  // print(t.secondsmallest(t.root));
}
