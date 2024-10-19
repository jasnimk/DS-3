class Node {
  Map<String, Node> children = {};
  bool isEnd = false;
}

class Trie {
  Node root = Node();

  insert(String word) {
    word = word.toLowerCase();
    Node node = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!node.children.containsKey(char)) {
        node.children[char] = Node();
      }
      node = node.children[char]!;
    }
    node.isEnd = true;
  }

  searchNode(String word) {
    Node node = root;
    word = word.toLowerCase();
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!node.children.containsKey(char)) {
        return null;
      }
      node = node.children[char]!;
    }
    return node;
  }

  search(String word) {
    word = word.toLowerCase();
    Node? node = searchNode(word);
    return node != null && node.isEnd;
  }

  searchPrefix(String prefix) {
    Node? node = searchNode(prefix);
    // print(node?.children);
    List result = [];
    if (node != null) {
      collectWords(node, prefix, result);
    }
    return result;
  }

  collectWords(Node node, String prefix, List result) {
    // print(node.children);
    if (node.isEnd) {
      print("val:$prefix");
      result.add(prefix);
    }

    for (var val in node.children.keys) {
      collectWords(node.children[val]!, prefix + val, result);
    }
  }

  getallWords() {
    List result = [];
    collectWords(root, "", result);
    return result;
  }
}

void main() {
  Trie t = Trie();
  t.insert('Hello');
  t.insert('helloooo');
  t.insert('Hai');
  t.insert('good');
  print(t.search('good'));
  print(t.search('Good'));
  // List words = t.getallWords();
  // print(words);
  print(t.searchPrefix('he'));
}
