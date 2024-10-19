class Graph {
  Map<String, Map<String, double>> _graph = {};

  addVertex(String vertex) {
    if (!_graph.containsKey(vertex)) {
      _graph[vertex] = {};
    }
  }

  addEdge(String vertex1, String vertex2, double weight) {
    if (!_graph.containsKey(vertex1)) addVertex(vertex1);
    if (!_graph.containsKey(vertex2)) addVertex(vertex2);

    _graph[vertex1]![vertex2] = weight;
    _graph[vertex2]![vertex1] = weight;
  }

  removeEdge(String vertex1, String vertex2) {
    _graph[vertex1]!.remove(vertex2);
    _graph[vertex2]!.remove(vertex1);
  }

  removeVertex(String vertex1) {
    if (_graph.containsKey(vertex1)) {
      for (var vertex in _graph[vertex1]!.keys) {
        _graph[vertex1]?.remove(vertex);
      }
      _graph.remove(vertex1);
    } else {
      print('no such vertex found!');
    }
  }

  hasEdge(String vertex1, String vertex2) {
    return _graph.containsKey(vertex1) && _graph[vertex1]!.containsKey(vertex2);
  }

  bfs(String vertex) {
    List visited = [];
    List queue = [];
    queue.add(vertex);
    visited.add(vertex);
    print(vertex);
    while (queue.isNotEmpty) {
      String ve = queue.removeAt(0);
      for (var v in _graph[ve]!.keys) {
        if (!visited.contains(v)) {
          print(v);
          queue.add(v);
          visited.add(v);
        }
      }
    }
  }

  dfs(String vertex, {List visited = const []}) {
    if (visited.isEmpty) {
      visited = [];
    }
    visited.add(vertex);
    print(vertex);
    for (var val in _graph[vertex]!.keys) {
      if (!visited.contains(val)) {
        dfs(val, visited: visited);
      }
    }
  }

  display() {
    print(_graph);
  }
}

void main() {
  Graph g = Graph();
  g.addVertex('q');
  g.addVertex('b');
  g.addVertex('a');
  g.addEdge('a', 'q', 20.0);
  g.addEdge('b', 'q', 10.0);
  g.addEdge('a', 'c', 30.0);
  g.addEdge('b', 'c', 34.0);
  g.display();
  // g.removeEdge('b', 'q');
  g.display();
  print(g.hasEdge('b', 'q'));
  print('BFS');
  g.bfs('q');
  print('DFS');
  g.dfs('q');
}
