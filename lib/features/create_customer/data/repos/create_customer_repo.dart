import 'package:checkout_app/core/models/custmer_model/customer_model.dart';
import 'package:checkout_app/core/models/customer_input_model.dart';
import 'package:checkout_app/core/networking/die_faliure.dart';
import 'package:dartz/dartz.dart';

abstract class CreateCustomerRepo {
  Future<Either<Failure, CustomerModel>> createCustomer({
    required CustomerInputModel customerInputModel,
  });
}
