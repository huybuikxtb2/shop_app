import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/screens/cart_screen.dart';

class CartItem extends StatefulWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItem(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
  );

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late CartController cartController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartController = context.read<CartController>();
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Text('\$${widget.price}'),
              ),
            ),
          ),
          title: Text('${widget.title} x ${widget.quantity}'),
          subtitle: Text('Total: \$${(widget.price * widget.quantity)}'),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // cartController.deleteItem(widget.productId);
              if (widget.quantity > 1) {
                cartController.deleteItem(widget.productId);
              } else {
                cartController.deteleAll(widget.productId);
              }
            },
            color: Colors.lightGreenAccent,
          ),
        ),
      ),
    );
  }
}
