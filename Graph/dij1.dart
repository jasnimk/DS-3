class Graph {
  Map<String, Map<String, double>> _edge = {};

  void addVertex(String vertex) {
    if (!_edge.containsKey(vertex)) {
      _edge[vertex] = {};
    }
  }

  void addEdges(String from, String to, double weight) {
    if (!_edge.containsKey(from)) addVertex(from);
    _edge[from]![to] = weight;
  }

  void display() {
    print(_edge);
  }

  void dijkstra(String start, String end) {
    Map<String, double> distances = {};
    Map<String, String?> previous = {};
    List<List<dynamic>> _queue = [];

    // Initialize distances and previous maps
    for (var vertex in _edge.keys) {
      distances[vertex] = double.infinity;
      previous[vertex] = null;
    }
    distances[start] = 0;
    _queue.add([0, start]);

    while (_queue.isNotEmpty) {
      // Sort the queue to make sure we process the shortest distance first
      // _queue.sort((a, b) => a[0].compareTo(b[0]));

      var currentDistance = _queue[0][0];
      var currentVertex = _queue[0][1];
      _queue.removeAt(0); // Remove the first element from the queue

      if (currentVertex == end) break;

      for (var entry in _edge[currentVertex]!.entries) {
        var neighbor = entry.key;
        var weight = entry.value;

        var distance = currentDistance + weight;

        // Only consider this new path if it's better than any known path
        if (distance < distances[neighbor]!) {
          distances[neighbor] = distance;
          previous[neighbor] = currentVertex;
          _queue.add([distance, neighbor]);
        }
      }
    }

    // Reconstruct the shortest path from start to end
    List<String> path = [];
    String? current = end;
    while (current != null) {
      path.add(current);
      current = previous[current];
    }

    // Print the path in the correct order (from start to end)
    print("Shortest path: ${path.reversed.join(" -> ")}");
    print("Shortest distance from $start to $end: ${distances[end]}");
  }
}

void main() {
  Graph g = Graph();

  g.addEdges('A', 'B', 50);
  g.addEdges('A', 'C', 10);
  g.addEdges('B', 'D', 2);
  g.addEdges('C', 'D', 3);
  g.addEdges('D', 'E', 8);
  g.addEdges('B', 'E', 15);
  g.addVertex('E');
  g.dijkstra('A', 'E');

  g.display();
}
