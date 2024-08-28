import 'package:checkout_app/core/models/custmer_model/customer_model.dart';
import 'package:checkout_app/core/models/customer_input_model.dart';
import 'package:checkout_app/core/networking/die_faliure.dart';
import 'package:checkout_app/core/utils/stripe_service.dart';
import 'package:checkout_app/features/create_customer/data/repos/create_customer_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CreateCustomerRepoImpl extends CreateCustomerRepo {
  late final StripeService stripeService;

  @override
  Future<Either<Failure, CustomerModel>> createCustomer(
      {required CustomerInputModel customerInputModel}) async {
    try {
      var response = await stripeService.createCustomer(
        customerInputModel: customerInputModel,
      );
      CustomerModel customerModel = CustomerModel.fromJson(response.data);
      return right(customerModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      if (e is StripeException) {
        return left(
          ServerFailure(
            e.error.localizedMessage ?? e.toString(),
          ),
        );
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
