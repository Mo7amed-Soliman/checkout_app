import 'package:checkout_app/core/cache/cache_helper.dart';
import 'package:checkout_app/core/networking/api_service.dart';
import 'package:checkout_app/core/utils/stripe_service.dart';
import 'package:checkout_app/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:checkout_app/features/create_customer/data/repos/create_customer_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<CheckoutRepoImpl>(
    CheckoutRepoImpl(
      StripeService(
        getIt.get<ApiService>(),
      ),
    ),
  );
  getIt.registerSingleton<CreateCustomerRepoImpl>(
    CreateCustomerRepoImpl(
      StripeService(
        getIt.get<ApiService>(),
      ),
    ),
  );
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}
