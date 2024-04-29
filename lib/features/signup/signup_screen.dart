import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfe/features/cubits/signup/signup_cubit.dart';
import 'package:pfe/features/services/storage_service.dart';
import 'package:pfe/widget/custom_buttom.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = '/signup';

  const SignupScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SignupScreen(),
    );
  }

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  StorageRepository storage = StorageRepository();

  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();

  TextEditingController adress = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();

  TextEditingController phone = TextEditingController();
  @override
  void initState() {
    TextEditingController email = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController city = TextEditingController();
    TextEditingController country = TextEditingController();
    TextEditingController adress = TextEditingController();
    TextEditingController phone = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 38, 229),
      ),
      // bottomNavigationBar: CustomNavBar(screen: routeName),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: email,
                      decoration: _buildInputDecoration("Email", Icons.email),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Enter a valid email!';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(email: value),
                            );
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: name,
                      decoration:
                          _buildInputDecoration("Name", Icons.person_pin),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a valid name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(fullName: value),
                            );
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: country,
                      decoration:
                          _buildInputDecoration("Country", Icons.location_city),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a valid country';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(country: value),
                            );
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: city,
                      decoration: _buildInputDecoration(
                          "City", Icons.location_city_rounded),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a valid city';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(city: value),
                            );
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: adress,
                      decoration: _buildInputDecoration(
                          "Adresse", Icons.add_home_work_outlined),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a valid address';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(address: value),
                            );
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: phone,
                      decoration:
                          _buildInputDecoration("Phone", Icons.phone_android),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(phone: value),
                            );
                      },
                    ),
                    // _PasswordInput(),
                    const SizedBox(height: 10),
                    TextFormField(
                      onChanged: (password) {
                        context.read<SignupCubit>().passwordChanged(password);
                      },
                      decoration: _buildInputDecoration(
                          "Password", Icons.password_rounded),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    const SizedBox(height: 20),
                    //

                    CustomButton(
                      title: "Signup",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<SignupCubit>().signUpWithCredentials();
                        }
                        Navigator.of(context).pushNamed(
                          '/home',
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
        fillColor: Color.fromARGB(255, 252, 255, 254),
        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 124, 137, 136)),
            borderRadius: BorderRadius.circular(30.0)),
        filled: true,
        labelText: label,
        suffixIcon: Icon(
          suffixIcon,
          color: Colors.black,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)));
  }
}

class _UserInput extends StatelessWidget {
  const _UserInput({
    super.key,
    required this.onChanged,
    required this.labelText,
  });

  final Function(String)? onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(labelText: labelText),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your phone';
            }
            return null;
          },
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (password) {
        context.read<SignupCubit>().passwordChanged(password);
      },
      decoration: const InputDecoration(labelText: 'Password'),
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your phone';
        }
        return null;
      },
    );
  }
}
