class Node {
  Map<String, Node> children = {};
  bool isEnd = false;
}

class Trie {
  Node? root;
  Trie() {
    root = null;
  }

  insert(String word) {
    if (root == null) {
      root = Node();
    }

    Node? current = root!;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current!.children.containsKey(char)) {
        current.children[char] = Node();
      }
      current = current.children[char]!;
    }
    current!.isEnd = true;
  }

  search(String word) {
    Node? current = root!;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current!.children.containsKey(char)) {
        return false;
      }
      current = current.children[char];
    }
    return current!.isEnd;
  }
  searchprefix(String prefix)
  {
    
  }
}

void main() {
  Trie t = Trie();
  t.insert('hello');
  t.insert('hai');
  t.insert('ball');
  bool find1 = t.search('hello');
  print(find1);
  bool find = t.search('gsd');
  print(find);
}
