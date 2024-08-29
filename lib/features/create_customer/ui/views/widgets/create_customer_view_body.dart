import 'package:checkout_app/core/utils/app_styles.dart';
import 'package:checkout_app/core/utils/size_confige.dart';
import 'package:checkout_app/features/create_customer/ui/views/widgets/create_customer_form.dart';
import 'package:flutter/material.dart';

class CreateCustomerViewBody extends StatelessWidget {
  const CreateCustomerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getRelativeHeight(0.2)),
              Text(
                'Create Customer',
                style: AppStyles.latoMedium25,
              ),
              SizedBox(height: getRelativeHeight(0.05)),
              const CreateCustomerForm(),
            ],
          ),
        ),
      ),
    );
  }
}
