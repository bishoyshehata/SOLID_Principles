import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/calculations.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/notifications.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_model.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/order_validation.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/printing.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.2/good/repository.dart';

class CreateOrder {
  Calculations _calculations;
  Notifications _notifications;
  OrderValidation _orderValidation;
  Printing _printing;
  Repository _repository;

  CreateOrder(
    this._calculations,
    this._notifications,
    this._orderValidation,
    this._printing,
    this._repository,
  );
  void createOrder(OrderModel order) {
    if (_orderValidation.isValidOrder(order)) {
      final tax = _calculations.calculateTax(92.59);
      _repository.saveOrder(order);
      _notifications.sendConfirmationEmail(order);
      _printing.generateInvoice(order);

      print("Tax: $tax");
    }
  }
}
