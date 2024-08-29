import 'package:checkout_app/core/utils/size_confige.dart';
import 'package:checkout_app/core/widgets/custom_bottom.dart';
import 'package:checkout_app/core/widgets/my_text_form_field.dart';
import 'package:checkout_app/features/checkout/ui/view/my_cart_view.dart';
import 'package:checkout_app/features/create_customer/ui/manger/create_customer_cubit/create_customer_cubit.dart';
import 'package:checkout_app/features/create_customer/ui/manger/create_customer_cubit/create_customer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCustomerForm extends StatelessWidget {
  const CreateCustomerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: CreateCustomerCubit.get(context).formKey,
      child: Column(
        children: [
          MyTextFormField(
            controller: TextEditingController(),
            hintText: 'Name',
          ),
          SizedBox(height: getRelativeHeight(0.02)),
          MyTextFormField(
            controller: TextEditingController(),
            hintText: 'Email',
          ),
          SizedBox(height: getRelativeHeight(0.3)),
          BlocConsumer<CreateCustomerCubit, CreateCustomerState>(
            listener: (context, state) async {
              if (state is CreateCustomerSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyCartView(),
                  ),
                );
              }
              if (state is CreateCustomerError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                  ),
                );
              }
            },
            builder: (context, state) => CustomBottom(
              text: 'Create Stripe Customer',
              isLoading: state is CreateCustomerLoading,
              onTap: () async {
                if (CreateCustomerCubit.get(context)
                    .formKey
                    .currentState!
                    .validate()) {
                  await CreateCustomerCubit.get(context).createCustomer();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
