
import 'package:collection/collection.dart';

// Graph class to represent the graph using adjacency list
class Graph {
  final Map<String, Map<String, int>> graph = {};

  void addEdge(String u, String v, int weight) {
    graph.putIfAbsent(u, () => {});
    graph[u]![v] = weight;
  }

  // Dijkstra's algorithm
  Map<String, dynamic> dijkstra(String start) {
    // Priority queue to store (distance, vertex)
    final queue = PriorityQueue<List<dynamic>>(
        (a, b) => a[0].compareTo(b[0])); // Min-heap priority queue
    queue.add([0, start]);

    // Map to store the shortest distance from start to each vertex
    final distances = Map<String, int>.fromIterable(graph.keys, value: (v) => double.infinity.toInt());
    distances[start] = 0;

    // Map to store the previous node (for path reconstruction)
    final previous = Map<String, String?>.fromIterable(graph.keys, value: (v) => null);

    while (queue.isNotEmpty) {
      // Get the vertex with the smallest distance
      List<dynamic> current = queue.removeFirst();
      int currentDistance = current[0];
      String currentVertex = current[1];

      // Loop through neighboring nodes of the current vertex
      graph[currentVertex]!.forEach((neighbor, weight) {
        int distance = currentDistance + weight;

        // Only consider this new path if it's shorter than the previous path
        if (distance < distances[neighbor]!) {
          distances[neighbor] = distance;
          previous[neighbor] = currentVertex;
          queue.add([distance, neighbor]);
        }
      });
    }

    return {'distances': distances, 'previous': previous};
  }

  // Function to get the shortest path from start to a target vertex
  List<String> getShortestPath(Map<String, String?> previous, String target) {
    List<String> path = [];
    String? current = target;
    while (current != null) {
      path.insert(0, current); // Insert node at the beginning of the list
      current = previous[current];
    }
    return path;
  }
}

void main() {
  // Create a graph
  Graph g = Graph();
  g.addEdge('A', 'B', 1);
  g.addEdge('A', 'C', 4);
  g.addEdge('B', 'C', 2);
  g.addEdge('B', 'D', 5);
  g.addEdge('C', 'D', 1);

  // Run Dijkstra's algorithm starting from vertex 'A'
  Map<String, dynamic> result = g.dijkstra('A');
  Map<String, int> distances = result['distances'];
  Map<String, String?> previous = result['previous'];

  print('Shortest distances from A:');
  distances.forEach((vertex, distance) {
    print('$vertex: $distance');
  });

  // Get the shortest path to vertex 'D'
  List<String> path = g.getShortestPath(previous, 'D');
  print('Shortest path to D: ${path.join(' -> ')}');
}
