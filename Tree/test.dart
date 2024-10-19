import 'dart:io';

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
    stdout.write('${node.data} ');
    inorder(node.right);
  }

  postorder(Node? node) {
    if (node == null) return;
    postorder(node.left);
    postorder(node.right);
    stdout.write('${node.data} ');
  }

  preorder(Node? node) {
    if (node == null) return;
    stdout.write('${node.data} ');
    preorder(node.left);
    preorder(node.right);
  }

  levelorder(Node? node) {
    if (node == null) return;
    List _queue = [];
    _queue.add(node);
    while (_queue.isNotEmpty) {
      Node current = _queue.removeAt(0);
      stdout.write('${current.data} ');

      if (current.left != null) {
        _queue.add(current.left);
      }
      if (current.right != null) {
        _queue.add(current.right);
      }
    }
  }

  findmin(Node node) {
    while (node.left != null) {
      node = node.left!;
    }
    return node.data;
  }

  findmax(Node node) {
    while (node.right != null) {
      node = node.right!;
    }
    return node.data;
  }

  deletenode(Node? node, int data) {
    if (node == null) return;
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

  sumofnodes(Node? node) {
    if (node == null) return 0;
    return sumofnodes(node.left) + sumofnodes(node.right) + node.data;
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

  height(Node? node) {
    if (node == null) return -1;
    int left = height(node.left);
    int right = height(node.right);
    return (left > right) ? left + 1 : right + 1;
  }

  secondlargest(Node? node) {
    if (node == null || (node.right == null && node.left == null)) return null;
    Node? current = node;
    Node? temp = node;
    Node? parent;

    while (current?.right != null) {
      parent = current;
      current = current?.right;
    }
    if (current?.left != null) {
      return findmax(current!.left!) + findmax(temp);
    }
    return parent!.data + current!.data;
  }

  secondsmallest(Node? node) {
    if (node == null || (node.right == null && node.left == null)) {
      return null;
    }
    Node? current = node;
    Node? prev = null;

    while (current?.left != null) {
      prev = current;
      current = current?.left;
    }
    if (current?.right != null) {
      return findmin(current!.right!);
    }
    return prev?.data;
  }

  bool search(Node? node, int data) {
    if (node == null) return false;
    if (node.data == data) return true;

    if (data < node.data) {
      return search(node.left, data);
    } else {
      return search(node.right, data);
    }
  }

  int? prev;
  isbst(Node? node, {int? min, int? max}) {
    if (node == null) return true;

    if ((min != null && node.data <= min) ||
        (max != null && node.data >= max)) {
      return false;
    }

    return isbst(node.left, min: min, max: node.data) &&
        isbst(node.right, min: node.data, max: max);
  }

  findLca(Node? node, int n1, int n2) {
    if (node == null) return;
    if (n1 > node.data && n2 > node.data) {
      return findLca(node.right, n1, n2);
    } else if (n1 < node.data && n2 < node.data) {
      return findLca(node.left, n1, n2);
    } else {
      return node;
    }
  }

  int? closest;
  findclosest(Node? node, int n) {
    if (node == null) return closest;
    if (closest == null) closest = node.data;
    if ((node.data - n).abs() < (closest! - n).abs()) {
      closest = node.data;
    }
    if (n < node.data) return findclosest(node.left, n);
    if (n > node.data) return findclosest(node.right, n);

    return closest;
  }
}

void main() {
  Tree t = Tree();
  List l1 = [10, 5, 15, 2, 7, 11, 1, 3, 6, 8, 19];
  for (var val in l1) {
    t.insert(val);
  }
  print('inorder:');
  t.inorder(t.root);
  // print('\npreorder:');
  // t.preorder(t.root);
  // print('\npostorder:');
  //t.postorder(t.root);
  // print('\nlevelorder:');
  // t.levelorder(t.root);
  // print('\nminnode=${t.findmin(t.root!)}');
  // print('maxnode=${t.findmax(t.root!)}');
  // print('\nnew:');
  // t.deletenode(t.root, 7);
  t.inorder(t.root);
  print('\nsum=${t.sumofnodes(t.root!)}');
  print('count=${t.countall(t.root!)}');
  print('Leaf=${t.countleaf(t.root!)}');
  print('height=${t.height(t.root!)}');
  print('2nd max node=${t.secondlargest(t.root!)}');
  print('2nd min node=${t.secondsmallest(t.root!)}');

  bool result = t.search(t.root, 5);
  if (result) {
    print('Value found in the tree');
  } else {
    print('Value not found in the tree');
  }
  bool result1 = t.isbst(t.root);
  if (result1) {
    print('Binary tree');
  } else {
    print('Not Binary tree');
  }
  Node? node = t.findLca(t.root, 1, 8);
  if (node == null)
    print('not found!');
  else
    print('common ancestor:${node.data}');
  print('closest=${t.findclosest(t.root!, 4)}');
}
