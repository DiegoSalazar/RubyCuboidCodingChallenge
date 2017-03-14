require './lib/vertex'
require './lib/faces'

# Represent a cuboid in 3D space
class Cuboid
  include Faces
  attr_reader :dims, :pos

  # @params dimensions, position: Vertex instances
  # For dimensions x, y, z represents width, height, length
  def initialize(dimensions, position)
    @dims = dimensions
    @pos = position
  end

  # @params vertex: Vertex instance to move our position to
  def move_to!(vertex)
    return false if @pos == vertex
    @pos = vertex.clone
    true
  end

  # Returns the six corner vertices of the cuboid
  def vertices
    [
      pos,
      Vertex.new(pos.x, pos.y + dims.y, pos.z),
      Vertex.new(pos.x + dims.x, pos.y + dims.y, pos.z),
      Vertex.new(pos.x + dims.x, pos.y, pos.z),
      Vertex.new(pos.x, pos.y, pos.z + dims.z),
      Vertex.new(pos.x, pos.y + dims.y, pos.z + dims.z),
      Vertex.new(pos.x + dims.x, pos.y, pos.z + dims.z),
      Vertex.new(pos.x + dims.x, pos.y + dims.y, pos.z + dims.z)
    ]
  end

  # Detects if any face intersects with another cuboid's faces
  def intersects?(cuboid)
    return true if self == cuboid
    !left_face_is_right_of_other_right_face(cuboid) &&
      !right_face_is_left_of_other_left_face(cuboid) &&
      !top_face_is_below_other_bottom_face(cuboid) &&
      !bottom_face_is_above_other_top_face(cuboid) &&
      !front_face_is_behind_other_back_face(cuboid) &&
      !back_face_is_front_other_front_face(cuboid)
  end
end
