class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

class BST:
    def insert(self, root, key):
        if root is None:
            return Node(key)
        if key < root.data:
            root.left = self.insert(root.left, key)
        elif key > root.data:
            root.right = self.insert(root.right, key)
        return root

    def search(self, root, key):
        if root is None or root.data == key:
            return root
        if key < root.data:
            return self.search(root.left, key)
        return self.search(root.right, key)

    def delete(self, root, key):
        if root is None:
            return root
        if key < root.data:
            root.left = self.delete(root.left, key)
        elif key > root.data:
            root.right = self.delete(root.right, key)
        else:
            if root.left is None:
                return root.right
            elif root.right is None:
                return root.left
            temp = self.minValue(root.right)
            root.data = temp.data
            root.right = self.delete(root.right, temp.data)
        return root

    def minValue(self, node):
        while node.left:
            node = node.left
        return node

    def inorder(self, root):
        if root:
            self.inorder(root.left)
            print(root.data, end=" ")
            self.inorder(root.right)


tree = BST()
root = None

while True:
    print("\n--- Binary Search Tree Menu ---")
    print("1. Insert")
    print("2. Delete")
    print("3. Search")
    print("4. Inorder Traversal")
    print("5. Exit")

    choice = int(input("Enter your choice: "))

    if choice == 1:
        key = int(input("Enter value to insert: "))
        root = tree.insert(root, key)

    elif choice == 2:
        key = int(input("Enter value to delete: "))
        root = tree.delete(root, key)

    elif choice == 3:
        key = int(input("Enter value to search: "))
        print("Found" if tree.search(root, key) else "Not Found")

    elif choice == 4:
        print("Inorder Traversal: ", end="")
        tree.inorder(root)
        print()

    elif choice == 5:
        print("Exiting program...")
        break

    else:
        print("Invalid choice. Please try again.")
