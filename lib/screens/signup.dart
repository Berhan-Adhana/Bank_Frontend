import 'package:flutter/material.dart';
import 'package:front_end/provider/authentication_provider.dart';
import 'package:front_end/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isLoadingProvider = StateProvider<bool>((ref) {
  return false;
});

class SignUp extends HookConsumerWidget {
  SignUp({super.key});

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authNotifierProvider, (previous, next) {
      next.maybeWhen(
        orElse: () => null,
        authenticated: (user) {
          context.go("/login");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User Authenticated'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        unauthenticated: (message) =>
            ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message!),
            behavior: SnackBarBehavior.floating,
          ),
        ),
      );
    });
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    width: 600,
                    child: Image.asset(
                      'assets/images/shape1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 300,
                          height: 60,
                          child: TextField(
                            controller: _emailController,
                            autofocus: true,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xff2827e9),
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Enter Your Email',
                              suffix: const Icon(
                                Icons.text_format,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 300,
                          height: 60,
                          child: TextField(
                            controller: _passwordController,
                            autofocus: true,
                            obscureText: true,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xff2827e9),
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Enter Your Password',
                              suffix: const Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: <Widget>[
                              Checkbox(
                                value: false,
                                onChanged: null,
                              ),
                              Text('I accept the policy and terms'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: CustomButton(
                            title: 'Signup',
                            isDisabled: false,
                            onPressed: () =>
                                ref.read(authNotifierProvider.notifier).signup(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    ),
                            loading: ref.watch(authNotifierProvider).maybeWhen(
                                  orElse: () => false,
                                  loading: () => true,
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("I a member? "),
                            TextButton(
                                onPressed: () => {
                                      context.go("/login")
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (context) => Login()))
                                    },
                                child: const Text("Login Now")),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage('assets/images/x.png'),
                              width: 35,
                              height: 35,
                            ),
                            Image(
                              image: AssetImage('assets/images/google.png'),
                              width: 35,
                              height: 35,
                            ),
                            Image(
                              image: AssetImage(
                                  'assets/images/icons8_LinkedIn_Circled_48px.png'),
                              width: 35,
                              height: 35,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
