require_relative 'skeleton/lib/00_tree_node.rb'

class KnightPathFinder
  def initialize(start_pos)
    @start_pos = PolyTreeNode.new(start_pos)
    build_move_tree
  end

  def build_move_tree
    @move_tree =
  end

end
