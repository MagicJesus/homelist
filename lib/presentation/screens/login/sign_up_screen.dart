import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homelist/application/auth/auth_cubit.dart';
import 'package:homelist/presentation/constants.dart';
import 'package:homelist/presentation/widgets/common/homelist_appbar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const routeName = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  String? validator(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeListAppBar(
        title: "Sign Up",
        leading: IconButton(
          onPressed: () {
            context.read<AuthCubit>().removeSignUp();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: const [],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 64,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber.shade400,
                ),
                width: 144,
                height: 144,
                child: Image.network(
                    'https://pngfre.com/wp-content/uploads/1653590437470-661x1024.png'),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextFormField(
                  controller: _firstNameController,
                  validator: (value) {
                    return validator(value, 'Please enter your first name.');
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.person_outline_outlined),
                    label: const Text('First Name'),
                    hintStyle: const TextStyle(color: AppColors.hintTextColor),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextFormField(
                  controller: _lastNameController,
                  validator: (value) {
                    return validator(value, 'Please enter your last name.');
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.account_circle_outlined),
                    label: const Text('Last Name'),
                    hintStyle: const TextStyle(color: AppColors.hintTextColor),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    return validator(value, 'Please enter your email.');
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.email_outlined),
                    label: const Text('Email'),
                    hintStyle: const TextStyle(color: AppColors.hintTextColor),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    return validator(value, 'Type in your password');
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.lock_outline_rounded),
                    label: const Text('Password'),
                    hintStyle: const TextStyle(color: AppColors.hintTextColor),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextFormField(
                  controller: _repeatPasswordController,
                  validator: (value) {
                    return validator(value, 'Type in your password again');
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.lock_outline_rounded),
                    label: const Text('Confirm password'),
                    hintStyle: const TextStyle(color: AppColors.hintTextColor),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<AuthCubit>()
                                .createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                );
                          }
                        },
                        child: const Text("Sign Up"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
