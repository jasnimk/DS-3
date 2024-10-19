class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEnd = false;
}

class Trie {
  TrieNode root = TrieNode();

  // Inserts a word into the trie
  void insert(String word) {
    TrieNode current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      // If the character does not exist in the current node's children, add it
      if (!current.children.containsKey(char)) {
        current.children[char] = TrieNode();
      }
      // Move to the next node (character)
      current = current.children[char]!;
    }
    // Mark the end of the word
    current.isEnd = true;
  }

  // Returns true if the word is found in the trie
  bool search(String word) {
    TrieNode? node = _searchNode(word);
    // Check if node exists and is marked as end of a word
    return node != null && node.isEnd;
  }

  // Returns true if there is any word in the trie that starts with the given prefix
  bool startsWith(String prefix) {
    // If a node corresponding to the prefix exists, it means some word starts with that prefix
    return _searchNode(prefix) != null;
  }

  // Helper method to search for a node corresponding to a string (word or prefix)
  TrieNode? _searchNode(String word) {
    TrieNode current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      // If the character is not found in the current node's children, return null
      if (!current.children.containsKey(char)) {
        return null;
      }
      // Move to the next node
      current = current.children[char]!;
    }
    return current;
  }

  // Returns a list of words that start with the given prefix
  List<String> searchByPrefix(String prefix) {
    TrieNode? node = _searchNode(prefix);
    List<String> result = [];
    if (node != null) {
      _findAllWords(node, prefix, result);
    }
    return result;
  }

  // Helper method to find all words starting from a given node
 void _findAllWords(TrieNode node, String prefix, List<String> result) {
  if (node.isEnd) {
    result.add(prefix);
  }
  
  for (var entry in node.children.entries) {
    _findAllWords(entry.value, prefix + entry.key, result);
  }
}

}

void main() {
  // Example usage:
  Trie trie = Trie();

  trie.insert("hello");
  trie.insert("helium");
  trie.insert("hero");
  trie.insert("her");

  // Searching for words
  print(trie.search("hello")); // true
  print(trie.search("hel"));   // false

  // Searching by prefix
  print(trie.startsWith("hel")); // true
  print(trie.startsWith("he"));  // true
  print(trie.startsWith("hi"));  // false

  // Searching words that start with a prefix
  List<String> wordsWithPrefix = trie.searchByPrefix("he");
  print(wordsWithPrefix); // ['hello', 'helium', 'hero', 'her']
}
