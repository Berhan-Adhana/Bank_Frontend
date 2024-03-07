import 'package:flutter/material.dart';
import 'package:front_end/provider/account_info_form_provider.dart';
import 'package:front_end/provider/authentication_provider.dart';
import 'package:front_end/screens/signup/signup.dart';
import 'package:front_end/screens/signup/signup_personal.dart';
import 'package:front_end/screens/signup/signup_address.dart';
import 'package:front_end/widgets/custom_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


//provider for controlling the current step
final currentStepProvider = StateProvider<int>((ref) {
  return 0;
});

class SignupStepper extends HookConsumerWidget {
  SignupStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Stepper(
            // margin: const EdgeInsets.only(top: 15.0),
            elevation: 0,
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Consumer(builder: (context, ref, _) {
                    final personalInfo =
                        ref.watch(accountInfoFormNotifierProvider).form;
                    return CustomButton(
                        isDisabled: ref.watch(currentStepProvider) == 0 &&
                            !(personalInfo.fName.isValid &&
                                personalInfo.lName.isValid &&
                                personalInfo.email.isValid &&
                                personalInfo.password.isValid &&
                                personalInfo.confirmPassword.isValid),

                        // backgroundColor: Colors.black,
                        title: ref.watch(currentStepProvider) == 2
                            ? 'Sign Up'
                            : 'Continue',
                        // loading: ref
                        //     .watch(authNotifierProvider)
                        //     .maybeWhen(orElse: () => false, loading: () => true),
                        onPressed: details.onStepContinue);
                  }),
                  Consumer(builder: (context, ref, _) {
                    // final field =
                    //     ref.watch(loginFormNotifierProvider).form;
                    return CustomButton(
                        isDisabled: false,
                        //  !(field.password.isValid &&
                        //     field.email.isValid),
                        // backgroundColor: Colors.black,
                        title: 'Back',
                        loading: ref.watch(authNotifierProvider).maybeWhen(
                            orElse: () => false, loading: () => true),
                        onPressed: details.onStepCancel);
                  })
                ],
              );
            },
            type: StepperType.horizontal,
            currentStep: ref.watch(currentStepProvider),
            onStepCancel: () => ref.watch(currentStepProvider) == 0
                ? null
                : ref.read(currentStepProvider.notifier).state =
                    ref.watch(currentStepProvider) - 1,
            onStepContinue: () {
              bool isLastStep =
                  (ref.watch(currentStepProvider) == getSteps(ref).length - 1);
              if (isLastStep) {
                ref.read(authNotifierProvider.notifier).signup(
                      email: "",
                      password: "",
                    );
              } else {
                ref.read(currentStepProvider.notifier).state =
                    ref.watch(currentStepProvider) + 1;
              }
            },
            // onStepTapped: (step) =>{}
            //     ref.read(currentStepProvider.notifier).state = step,
            steps: getSteps(ref),
          )),
    );
  }

  List<Step> getSteps(WidgetRef ref) {
    return <Step>[
      Step(
        state: ref.watch(currentStepProvider) > 0
            ? StepState.complete
            : StepState.indexed,
        isActive: ref.watch(currentStepProvider) >= 0,
        title: const Text(
          "Account Info",
          style: TextStyle(fontSize: 12.0),
        ),
        content: const SignUp(),
      ),
      Step(
        state: ref.watch(currentStepProvider) > 1
            ? StepState.complete
            : StepState.indexed,
        isActive: ref.watch(currentStepProvider) >= 1,
        title: const Text(
          "Personal Info",
          style: TextStyle(fontSize: 12.0),
        ),
        content: const SignUpPersonal(),
      ),
      Step(
        state: ref.watch(currentStepProvider) > 2
            ? StepState.complete
            : StepState.indexed,
        isActive: ref.watch(currentStepProvider) >= 2,
        title: const Text(
          "Address",
          style: TextStyle(fontSize: 12.0),
        ),
        content: const SignUpAddress(),
      ),
    ];
  }
}
