import 'package:checkout_app/core/di/dependency_injection.dart';
import 'package:checkout_app/features/create_customer/data/repos/create_customer_repo_impl.dart';
import 'package:checkout_app/features/create_customer/ui/manger/create_customer_cubit/create_customer_cubit.dart';
import 'package:checkout_app/features/create_customer/ui/views/widgets/create_customer_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCustomerView extends StatelessWidget {
  const CreateCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CreateCustomerCubit(
          getIt.get<CreateCustomerRepoImpl>(),
        ),
        child: const CreateCustomerViewBody(),
      ),
    );
  }
}
