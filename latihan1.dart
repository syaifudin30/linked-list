import 'dart:io';

class Dnode<T> {
  T nodeValue;
  Dnode<T>? next;
  Dnode<T>? prev;

  Dnode(this.nodeValue);
}

class DoubleLinkedList<T> {
  Dnode<T>? head;

  // Menambahkan node sebelum node target
  void tambahNode_Sebelum(Dnode<T> newNode, Dnode<T> target) {
    if (target == head) {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    } else {
      Dnode<T>? prevNode = target.prev;

      if (prevNode != null) {
        prevNode.next = newNode;
        newNode.prev = prevNode;
      }

      newNode.next = target;
      target.prev = newNode;
    }
  }

  // Menambahkan node di akhir list
  void insertTailNode(T data) {
    Dnode<T> newNode = Dnode(data);
    if (head == null) {
      head = newNode;
    } else {
      Dnode<T> temp = head!;
      while (temp.next != null) {
        temp = temp.next!;
      }
      temp.next = newNode;
      newNode.prev = temp;
    }
  }

  // Menampilkan isi list maju dan mundur
  void printList() {
    Dnode<T>? node = head;
    Dnode<T>? tail;

    print("Traversal Forward:");
    while (node != null) {
      stdout.write("${node.nodeValue} ");
      tail = node;
      node = node.next;
    }

    print("\nTraversal Reverse:");
    while (tail != null) {
      stdout.write("${tail.nodeValue} ");
      tail = tail.prev;
    }
    print("\n");
  }
}

void main() {
  var dll = DoubleLinkedList<String>();

  // Tambahkan node A, B, D
  dll.insertTailNode("A");
  dll.insertTailNode("B");
  dll.insertTailNode("D");

  // Cari node "D"
  Dnode<String>? target = dll.head;
  while (target != null && target.nodeValue != "D") {
    target = target.next;
  }

  // Tambahkan "C" sebelum "D"
  if (target != null) {
    Dnode<String> newNode = Dnode("C");
    dll.tambahNode_Sebelum(newNode, target);
  }

  // Cetak hasil akhir
  dll.printList();
}
