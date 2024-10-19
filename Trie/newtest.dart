class Node {
  Map<String, Node> children = {};
  bool IsEnd = false;
  int count = 0;
}

class Trie {
  Node? root = Node();
  String longestword = '';
  int longcount = 0;
  Insert(String word) {
    Node? node = root;

    for (int i = 0; i < word.length; i++) {
      String char = word[i];

      if (!node!.children.containsKey(char)) {
        node.children[char] = Node();
      }
      if (node.children[char] != null) {
        node = node.children[char];
      }
    }
    node?.IsEnd = true;
    print(word.length);
    if (word.length >= longestword.length) {
      longcount = word.length;
      longestword = word;
    }
  }

  searchnode(String word) {
    Node? node = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!node!.children.containsKey(char)) {
        return null;
      }
      node = node.children[char];
    }
    return node;
  }

  search(String word) {
    Node? node = searchnode(word);
    return node != null && node.IsEnd;
  }

  searchPrefix(String prefix) {
    Node? node = searchnode(prefix);
    List result = [];
    if (node != null) {
      collectwords(node, prefix, result);
    }
    return result;
  }

  collectwords(Node? node, String prefix, List result) {
    if (node!.IsEnd) {
      result.add(prefix);
    }
    for (var val in node.children.keys) {
      collectwords(node.children[val], prefix + val, result);
    }
  }

  getallwords() {
    List result = [];
    collectwords(root, '', result);
    return result;
  }
}

void main() {
  Trie t = Trie();
  t.Insert('Hello');
  t.Insert('Helloworld');
  t.Insert('goodfine thankyou');
  print(t.getallwords());
  // print(t.searchPrefix('H'));
  print(t.longestword);
}
