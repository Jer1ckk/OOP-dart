enum DeliveryMethod{ pickup, delivery }

class Product{
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});
}

class OrderItem{
  final Product product;
  final int quantity;

  OrderItem({required this.product, this.quantity = 1});

  double total() => product.price * quantity;
}

class Order{
  final int id;
  final List<OrderItem> items ;
  final DeliveryMethod deliveryMethod;

  Order({required this.id, required this.items, required this.deliveryMethod});

  double totalAmount(){
    return items.fold(0, (sum, item) => sum + item.total());
  }
}

void main(){
  Product apple = Product(id: 1, name: 'Apple', price: 1.5);
  Product banana = Product (id: 2, name: 'Banana', price: 0.7);

  OrderItem item1 = OrderItem(product: apple, quantity: 4);
  OrderItem item2 = OrderItem(product: banana, quantity: 10);

  Order order = Order(id: 1001, items: [item1, item2], deliveryMethod: DeliveryMethod.delivery);
  print("Order total: \$${order.totalAmount()}");
}
