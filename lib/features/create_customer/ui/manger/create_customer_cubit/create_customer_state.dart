import 'package:checkout_app/core/models/custmer_model/customer_model.dart';

abstract class CreateCustomerState {}

class CreateCustomerInitial extends CreateCustomerState {}

class CreateCustomerLoading extends CreateCustomerState {}

class CreateCustomerSuccess extends CreateCustomerState {
  final CustomerModel customerModel;
  CreateCustomerSuccess(this.customerModel);
}

class CreateCustomerError extends CreateCustomerState {
  final String error;
  CreateCustomerError(this.error);
}
