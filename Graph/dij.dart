class Graph {
  Map<String, Map<String, int>> edges = {};

  void addEdge(String from, String to, int weight) {
    if (!edges.containsKey(from)) edges[from] = {};
    if (!edges.containsKey(to)) edges[to] = {};
    edges[from]![to] = weight;
  }
}

Map<String, double> initializeDistances(Graph graph, String start) {
  Map<String, double> distances = {};
  for (var node in graph.edges.keys) {
    if (node == start) {
      distances[node] = 0;
    } else {
      distances[node] = double.infinity;
    }
  }
  return distances;
}

Map<String, double> dijkstra(Graph graph, String start) {
  var distances = initializeDistances(graph, start);

  var unvisited = graph.edges.keys.toSet();

  while (unvisited.isNotEmpty) {
    var current =
        unvisited.reduce((a, b) => distances[a]! < distances[b]! ? a : b);
    unvisited.remove(current);

    for (var neighbor in graph.edges[current]!.keys) {
      var newDist = distances[current]! + graph.edges[current]![neighbor]!;
      if (newDist < distances[neighbor]!) {
        distances[neighbor] = newDist;
      }
    }
  }

  return distances;
}

void main() {
  var graph = Graph();
  graph.addEdge("A", "B", 4);
  graph.addEdge("A", "C", 2);
  graph.addEdge("B", "D", 3);
  graph.addEdge("C", "B", 1);
  graph.addEdge("C", "D", 5);
  graph.addEdge("D", "E", 2);

  var shortestDistances = dijkstra(graph, "A");
  print(shortestDistances);
}
