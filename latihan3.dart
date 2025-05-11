class Node {
  int nodeValue;
  Node? next;

  Node(this.nodeValue);
}

class SingleLinkedList {
  Node? head;

  bool isEmpty() {
    return head == null;
  }

  void insertFront(int data) {
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
  }

  void printList() {
    if (isEmpty()) {
      print('Linked List kosong');
      return;
    }
    Node? current = head;
    while (current != null) {
      print(current.nodeValue);
      current = current.next;
    }
  }

  Node? findNode(int data) {
    Node? current = head;
    while (current != null) {
      if (current.nodeValue == data) {
        return current; // Node ditemukan
      }
      current = current.next;
    }
    return null; // Node tidak ditemukan
  }
}

void main() {
  SingleLinkedList list = SingleLinkedList();

  // Menambahkan data ke list
  list.insertFront(10);
  list.insertFront(20);
  list.insertFront(30);

  print('Isi Linked List:');
  list.printList();

  // Mencari node dengan nilai tertentu
  int cari = 20;
  Node? hasil = list.findNode(cari);
  if (hasil != null) {
    print('Node dengan nilai $cari ditemukan.');
  } else {
    print('Node dengan nilai $cari tidak ditemukan.');
  }
}
