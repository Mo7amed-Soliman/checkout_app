import 'dart:developer';

import 'package:checkout_app/core/cache/cache_helper.dart';
import 'package:checkout_app/core/di/dependency_injection.dart';
import 'package:checkout_app/core/models/customer_input_model.dart';
import 'package:checkout_app/features/create_customer/data/repos/create_customer_repo.dart';
import 'package:checkout_app/features/create_customer/ui/manger/create_customer_cubit/create_customer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCustomerCubit extends Cubit<CreateCustomerState> {
  CreateCustomerCubit(this.createCustomerRepo) : super(CreateCustomerInitial());
  static CreateCustomerCubit get(context) => BlocProvider.of(context);
  final CreateCustomerRepo createCustomerRepo;
  // Controller
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> createCustomer() async {
    emit(CreateCustomerLoading());
    var customerInputModel = CustomerInputModel(
      name: nameController.text,
      email: emailController.text,
    );
    final result = await createCustomerRepo.createCustomer(
      customerInputModel: customerInputModel,
    );
    result.fold(
      (failure) {
        emit(CreateCustomerError(failure.errmessage));
      },
      (success) async {
        emit(CreateCustomerSuccess(success));
        await getIt<CacheHelper>().put(
          key: 'customerId',
          value: success.id,
        );
      },
    );
  }

  @override
  void onChange(Change<CreateCustomerState> change) {
    log('change ${change.currentState} to ${change.nextState}');
    super.onChange(change);
  }
}
