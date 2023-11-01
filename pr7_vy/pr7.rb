require 'set'

class ShortestPath
  def initialize(graph)
    @graph = graph
  end

  def dijkstra(start)
    queue = Set.new
    distances = {}
    previous = {}
    
    @graph.keys.each do |vertex|
      distances[vertex] = Float::INFINITY
      previous[vertex] = nil
      queue.add(vertex)
    end
    
    distances[start] = 0
    
    until queue.empty?
      u = extract_min(queue, distances)
      queue.delete(u)
      
      @graph[u].each do |v, weight|
        alt = distances[u] + weight
        if alt < distances[v]
          distances[v] = alt
          previous[v] = u
          queue.add(v)
        end
      end
    end
    
    return distances, previous
  end

  private

  def extract_min(queue, distances)
    queue.min_by { |vertex| distances[vertex] }
  end
end

# Приклад використання:

graph = {
  'A' => { 'B' => 1, 'C' => 4 },
  'B' => { 'C' => 2, 'D' => 5 },
  'C' => { 'D' => 1 },
  'D' => {}
}

sp = ShortestPath.new(graph)
distances, previous = sp.dijkstra('A')

end_vertex = 'D'
path = []
while end_vertex
  path.unshift(end_vertex)
  end_vertex = previous[end_vertex]
end

puts "Найкоротший шлях: #{path.join(' -> ')}"
puts "Відстані: #{distances}"
