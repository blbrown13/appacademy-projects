require 'byebug'

class PolyTreeNode
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    @parent.children << self unless @parent.nil?
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    raise "Node is NOT a child" if node.parent.nil?
    node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    @children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end

    nil
  end

  def bfs(target_value)
    queue = []
    queue << self

    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      queue += node.children
    end

    nil
  end
end
