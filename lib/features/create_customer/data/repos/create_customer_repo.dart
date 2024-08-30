import 'package:checkout_app/features/create_customer/data/models/custmer_model/customer_model.dart';
import 'package:checkout_app/features/create_customer/data/models/customer_input_model.dart';
import 'package:checkout_app/core/networking/die_faliure.dart';
import 'package:dartz/dartz.dart';

abstract class CreateCustomerRepo {
  Future<Either<Failure, CustomerModel>> createCustomer({
    required CustomerInputModel customerInputModel,
  });
}
