import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/calculations.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/create_order.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/notifications.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_model.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_validation.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/printing.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/repository.dart';

void main() {
  CreateOrder createOrder = CreateOrder(
    Calculations(),
    Notifications(),
    OrderValidation(),
    Printing(),
    Repository(),
  );

  createOrder.createOrder(
    OrderModel(id: "1", total: 100, items: [' item 1', ' item 2']),
  );
}
