class Graph {
  Map<String, List> edge = {};

  addVertex(String vertex) {
    if (!edge.containsKey(vertex)) {
      edge[vertex] = [];
    }
  }

  addEdge(String v1, String v2) {
    if (!edge.containsKey(v1)) addVertex(v1);
    if (!edge.containsKey(v2)) addVertex(v2);
    edge[v1]!.add(v2);
  }

  removeEdge(String v1, String v2) {
    edge[v1]!.remove(v2);
  }

  removeVertex(String v1) {
    if (edge.containsKey(v1)) {
      for (var val in edge.keys) {
        edge[val]?.remove(v1);
      }

      edge.remove(v1);
    }
  }

  bfs(String vertex) {
    List visited = [];
    List queue = [];
    queue.add(vertex);
    visited.add(vertex);
    while (queue.isNotEmpty) {
      var current = queue.removeAt(0);
      for (var val in edge[current]!) {
        if (!visited.contains(val)) {
          visited.add(val);
          queue.add(val);
        }
      }
    }
    print(visited);
  }

  dfs(String vertex, {List visited = const []}) {
    if (visited.isEmpty) visited = [];
    visited.add(vertex);
    for (var val in edge[vertex]!) {
      if (!visited.contains(val)) {
        dfs(val, visited: visited);
      }
    }
    return visited;
  }

  display() {
    print(edge);
  }
}

void main() {
  Graph g = Graph();
  g.addEdge('A', 'D');
  g.addEdge('B', 'C');
  g.addEdge('C', 'D');
  g.addEdge('A', 'B');
  g.addEdge('D', 'E');
  g.addEdge('A', 'F');
  // g.removeEdge('D', 'A');
  // g.removeVertex('D');
  g.display();
  g.bfs('A');
  print(g.dfs('A'));
}
