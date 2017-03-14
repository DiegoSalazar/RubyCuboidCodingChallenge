require 'rspec'
require './lib/cuboid'

describe Cuboid do
  subject { Cuboid.new dimensions, position }
  let(:dimensions) { Vertex.new 1, 1, 1 }
  let(:position) { Vertex.new 0, 0, 0 }
  let(:position2) { Vertex.new 0, 1, 1 }
  let(:position3) { Vertex.new 2, 2, 2 }

  describe 'move_to!' do
    it 'changes the position in the simple happy case' do
      expect(subject.move_to!(position2)).to be true
    end

    it 'has its coordinates updated' do
      subject.move_to! position2
      expect(subject.pos.x).to eq position2.x
      expect(subject.pos.y).to eq position2.y
      expect(subject.pos.z).to eq position2.z
    end

    it 'does not update the position if the vertex is the same as position' do
      expect(subject.move_to!(position)).to be false
    end
  end

  describe 'vertices' do
    it "is an array of vertices of the cuboid's corners" do
      expect(subject.vertices).to eq [
        # rear bottom-left
        position,
        # rear top-left
        Vertex.new(position.x, position.y + dimensions.y, position.z),
        # rear top-right
        Vertex.new(position.x + dimensions.x, position.y + dimensions.y, position.z),
        # rear bottom-right
        Vertex.new(position.x + dimensions.x, position.y, position.z),
        # front bottom-left
        Vertex.new(position.x, position.y, position.z + dimensions.z),
        # front top-left
        Vertex.new(position.x, position.y + dimensions.y, position.z + dimensions.z),
        # front top-right
        Vertex.new(position.x + dimensions.x, position.y, position.z + dimensions.z),
        # front bottom-right
        Vertex.new(position.x + dimensions.x, position.y + dimensions.y, position.z + dimensions.z),
      ]
    end
  end

  describe 'intersects?' do
    let(:intersecting_cuboid) { Cuboid.new dimensions, position2 }
    let(:non_intersecting_cuboid) { Cuboid.new dimensions, position3 }

    it 'intersects itself' do
      expect(subject.intersects? subject).to be true
    end

    it 'intersects another cuboid' do
      expect(subject.intersects? intersecting_cuboid).to be true
    end

    it 'does not intersect another cuboid that is far away' do
      expect(subject.intersects? non_intersecting_cuboid).to be false
    end
  end
end
