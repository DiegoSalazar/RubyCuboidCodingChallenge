# Grants the including class the ability to detect intersections
# of cuboid faces. The class must respond to `pos` and `dims` which
# are methods that return Vertex instances.
module Faces
  def left_face_is_right_of_other_right_face(cuboid)
    left_face > cuboid.right_face
  end

  def right_face_is_left_of_other_left_face(cuboid)
    right_face < cuboid.left_face
  end

  def top_face_is_below_other_bottom_face(cuboid)
    top_face < cuboid.bottom_face
  end

  def bottom_face_is_above_other_top_face(cuboid)
    bottom_face > cuboid.top_face
  end

  def front_face_is_behind_other_back_face(cuboid)
    front_face < cuboid.back_face
  end

  def back_face_is_front_other_front_face(cuboid)
    back_face > cuboid.front_face
  end

  def left_face
    pos.x
  end

  def right_face
    pos.x + dims.x
  end

  def top_face
    pos.y + dims.y
  end

  def bottom_face
    pos.y
  end

  def front_face
    pos.z + dims.z
  end

  def back_face
    pos.z
  end
end
