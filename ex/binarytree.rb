class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    @root = insert_recursive(@root, value)
  end

  def search(value)
    search_recursive(@root, value)
  end

  def delete(value)
    @root = delete_recursive(@root, value)
  end

  def inorder
    inorder_recursive(@root)
  end

  private

  def insert_recursive(node, value)
    return TreeNode.new(value) if node.nil?

    if value < node.value
      node.left = insert_recursive(node.left, value)
    elsif value > node.value
      node.right = insert_recursive(node.right, value)
    end

    node
  end

  def search_recursive(node, value)
    return false if node.nil?

    if value == node.value
      return true
    elsif value < node.value
      return search_recursive(node.left, value)
    else
      return search_recursive(node.right, value)
    end
  end

  def delete_recursive(node, value)
    return node if node.nil?

    if value < node.value
      node.left = delete_recursive(node.left, value)
    elsif value > node.value
      node.right = delete_recursive(node.right, value)
    else
      if node.left.nil?
        return node.right
      elsif node.right.nil?
        return node.left
      end

      node.value = find_min_value(node.right)
      node.right = delete_recursive(node.right, node.value)
    end

    node
  end

  def find_min_value(node)
    current = node
    current = current.left until current.left.nil?
    current.value
  end

  def inorder_recursive(node)
    return [] if node.nil?

    left_result = inorder_recursive(node.left)
    current_result = [node.value]
    right_result = inorder_recursive(node.right)

    left_result + current_result + right_result
  end
end

tree = BinaryTree.new
tree.insert(5)
tree.insert(3)
tree.insert(7)
tree.insert(2)
tree.insert(4)
tree.insert(6)
tree.insert(8)

puts "Прямий обхід дерева: #{tree.inorder}"

puts "Пошук 4: #{tree.search(4)}"
puts "Пошук 9: #{tree.search(9)}"

tree.delete(3)
puts "Після видалення 3, Прямий обхід дерева: #{tree.inorder}"
