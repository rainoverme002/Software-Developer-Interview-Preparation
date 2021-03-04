from collections import deque


class TreeNode:
    def __init__(self, val):
        self.val = val
        self.left, self.right = None, None

class BinaryTreeLevelOrderTraversal:
  
    @classmethod
    def traverse(self, root):
        result = []
      
        if result is None:
            return result
    
        tree_nodes_queue = deque()
        tree_nodes_queue.append(root)
    
        while tree_nodes_queue:
            level_size = len(tree_nodes_queue)
            current_level_values = []
        
            for _ in range(level_size):
                current_node = tree_nodes_queue.popleft()
            
                # add value of current node to current_level_values
                current_level_values.append(current_node.val)
            
                #insert the children of current_node to the 
                if current_node.left:
                    tree_nodes_queue.append(current_node.left)
                if current_node.right:
                    tree_nodes_queue.append(current_node.right)
                    
            result.append(current_level_values)
    
        return result


def main():
    root = TreeNode(12)
    root.left = TreeNode(7)
    root.right = TreeNode(1)
    root.left.left = TreeNode(9)
    root.right.left = TreeNode(10)
    root.right.right = TreeNode(5)
    print("Level order traversal: " +
        str(BinaryTreeLevelOrderTraversal.traverse(root)))


main()
