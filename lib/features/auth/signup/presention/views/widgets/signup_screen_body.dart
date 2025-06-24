import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quranapp/core/routeing/routes.dart';
import 'package:quranapp/core/widgets/custom_text_field.dart';
import 'package:quranapp/features/auth/signup/data/models/signup_request_model.dart';
import 'package:quranapp/features/auth/signup/presention/manger/cubit/signup_cubit.dart';

class SignupScreenBody extends StatefulWidget {
  const SignupScreenBody({super.key});

  @override
  State<SignupScreenBody> createState() => _SignupScreenBodyState();
}

class _SignupScreenBodyState extends State<SignupScreenBody> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            
            const SnackBar(
              
              content: Text('تم التسجيل بنجاح'),
            ),
            
            
          );
               GoRouter.of(
            context,
          ).push(Routes.home); // Assuming 'home' is the name of your home route
        }else if (state is SignupErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: context.read<SignupCubit>().formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.person_add,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'إنشاء حساب جديد',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'قم بملء البيانات التالية لإنشاء حسابك',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // الاسم الكامل
                  CustomTextField(
                    controller: context
                        .read<SignupCubit>()
                        .nameController,
                    label: 'الاسم الكامل',
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 20),

                  // البريد الإلكتروني
                  CustomTextField(
                    controller: context.read<SignupCubit>().emailController,
                    label: 'البريد الإلكتروني',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),

                  // كلمة المرور
                  CustomTextField(
                    label: 'كلمة المرور',
                    controller: context.read<SignupCubit>().passwordController,
                    icon: Icons.lock_outline,
                    obscureText: !isPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() => isPasswordVisible = !isPasswordVisible);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // تأكيد كلمة المرور
                  CustomTextField(
                    controller: context
                        .read<SignupCubit>()
                        .confirmPasswordController,
                    label: 'تأكيد كلمة المرور',
                    icon: Icons.lock_outline,
                    obscureText: !isConfirmPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(
                          () => isConfirmPasswordVisible =
                              !isConfirmPasswordVisible,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),

                  // زر إنشاء حساب
                  ElevatedButton(
                    onPressed: () {
                      if (context
                          .read<SignupCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context.read<SignupCubit>().signup(
                          SignupRequestModel(
                            name: context
                                .read<SignupCubit>()
                                .nameController
                                .text,
                            email: context
                                .read<SignupCubit>()
                                .emailController
                                .text,
                            password: context
                                .read<SignupCubit>()
                                .passwordController
                                .text,
                            confirmPassword: context
                                .read<SignupCubit>()
                                .confirmPasswordController
                                .text,
                          ),
                        );
                        context.read<SignupCubit>().emailController.clear();
                        context.read<SignupCubit>().passwordController.clear();
                        context.read<SignupCubit>().nameController.clear();
                        context.read<SignupCubit>().confirmPasswordController.clear();
                        FocusScope.of(context).unfocus();

                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: state is SignupLoadingState ? const CircularProgressIndicator(strokeWidth: 2, color: Colors.white,) : Text(
                      'إنشاء حساب',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // رابط تسجيل الدخول
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'لديك حساب بالفعل؟ ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
             GoRouter.of(context).push(Routes.login);
                        },
                        child: const Text(
                          'تسجيل دخول',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}