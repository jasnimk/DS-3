class TrieNode {
  Map<String, TrieNode> children = {}; // Map for children nodes
  bool isEndOfWord = false; // End-of-word marker

  TrieNode(); // Constructor
}

class Trie {
  TrieNode root = TrieNode(); // Initialize the root node

  // Method to insert a word into the Trie
  void insert(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      // If character is not in children, create a new node
      if (!node.children.containsKey(char)) {
        node.children[char] = TrieNode();
      }
      node = node.children[char]!;
    }
    node.isEndOfWord = true; // Mark the end of the word
  }

  // Method to search for a word in the Trie
  bool search(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      // If character is not found, return false
      if (!node.children.containsKey(char)) {
        return false;
      }
      node = node.children[char]!;
    }
    return node.isEndOfWord; // Return true if it's the end of the word
  }

  // Method to return all words that start with a given prefix
  List<String> startWith(String prefix) {
    List<String> result = [];
    TrieNode node = root;

    // Traverse to the end of the prefix
    for (int i = 0; i < prefix.length; i++) {
      String char = prefix[i];
      if (!node.children.containsKey(char)) {
        return result; // Return empty list if prefix not found
      }
      node = node.children[char]!;
    }

    // Recursively collect words from this point
    _collectWords(node, prefix, result);
    return result;
  }

  // Helper method to collect words starting from a given node
  void _collectWords(TrieNode node, String currentWord, List<String> result) {
    // Add current word to the result if it's the end of a word
    if (node.isEndOfWord) {
      result.add(currentWord);
    }

    // Recursively collect words from all child nodes
    for (var entry in node.children.entries) {
      _collectWords(entry.value, currentWord + entry.key, result);
    }
  }

  // Method to collect all words stored in the Trie
  List<String> collectAllWords() {
    List<String> words = [];
    _collectWords(root, "", words);
    return words;
  }
}

void main() {
  Trie trie = Trie();

  // Insert words into the Trie
  trie.insert('hello');
  trie.insert('hai');
  trie.insert('hrnjjj');

  // Search for words starting with 'h'
  List<String> wordsWithPrefix = trie.startWith('h');
  print('Words with prefix "h": $wordsWithPrefix'); // Outputs: ['hello', 'hai', 'hrnjjj']

  // Search for a word in the Trie
  bool found = trie.search('hello');
  print('Search for "hello": $found'); // Outputs: true

  // Collect all words stored in the Trie
  List<String> allWords = trie.collectAllWords();
  print('All words in Trie: $allWords'); // Outputs: ['hello', 'hai', 'hrnjjj']
}
