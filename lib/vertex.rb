# Represents a vertex in 3D space
class Vertex
  attr_reader :x, :y, :z

  def initialize(*v)
    @x, @y, @z = v
  end

  def ==(vertex)
    x == vertex.x && y == vertex.y && z == vertex.z
  end
end
