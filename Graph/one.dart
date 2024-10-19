class Graph {
  late Map<String, List> _adjacencyList;

  Graph() {
    this._adjacencyList = {};
  }

  addVertex(var value) {
    if (!_adjacencyList.containsKey(value)) {
      _adjacencyList[value] = [];
    }
  }

  addEdge(var vertex1, var vertex2) {
    if (!_adjacencyList.containsKey(vertex1)) {
      addVertex(vertex1);
    }
    if (!_adjacencyList.containsKey(vertex2)) {
      addVertex(vertex2);
    }
    _adjacencyList[vertex1]?.add(vertex2);
    _adjacencyList[vertex2]?.add(vertex1);
  }

  removeEdge(var vertex1, var vertex2) {
    _adjacencyList[vertex1]?.remove(vertex2);
    _adjacencyList[vertex2]?.remove(vertex1);
  }

  removeVertex(var vertex) {
    if (_adjacencyList.containsKey(vertex)) {
      for (var vertex1 in _adjacencyList[vertex]!) {
        _adjacencyList[vertex1]?.remove(vertex);
      }
      _adjacencyList.remove(vertex);
    } else {
      print('no such vertex found.');
    }
  }

  bool hasEdge(var vertex1, var vertex2) {
    if (_adjacencyList.containsKey(vertex1)) {
      return _adjacencyList[vertex1]!.contains(vertex2);
    }
    return false;
  }

  display() {
    print(_adjacencyList);
  }

  bfs(var vertex) {
    List _visited = [];
    List _queue = [];
    _visited.add(vertex);
    _queue.add(vertex);
    print(vertex);
    while (_queue.isNotEmpty) {
      var ve = _queue.removeAt(0);
      for (var v1 in _adjacencyList[ve]!) {
        if (!_visited.contains(v1)) {
          print(v1);
          _visited.add(v1);
          _queue.add(v1);
        }
      }
    }
    print(_visited);
  }

  dfs(var vertex, {List visited = const []}) {
    if (visited.isEmpty) {
      visited = [];
    }
    visited.add(vertex);
    print(vertex);
    for (var val in _adjacencyList[vertex]!) {
      if (!visited.contains(val)) {
        dfs(val, visited: visited);
      }
    }
    return visited;
  }

}

void main() {
  Graph g = Graph();
  g.addVertex('A');
  g.addVertex('B');
  g.display();
  g.addEdge('A', 'B');
  g.addEdge('E', 'B');
  g.addEdge('C', 'D');
  g.addEdge('C', 'A');
  g.display();
  //g.addEdge('D', 'E');
  // g.removeEdge('A', 'C');
  // g.display();
  // g.removeVertex('A');
  // g.display();
  bool find = g.hasEdge('A', 'D');
  print(find);
  g.bfs('A');
  List v = g.dfs('A');
  print(v);
}
