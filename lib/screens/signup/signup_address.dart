import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:front_end/provider/authentication_provider.dart';
import 'package:front_end/widgets/custom_button.dart';
import 'package:front_end/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:country_code_picker/country_code_picker.dart';

final isLoadingProvider = StateProvider<bool>((ref) {
  return false;
});

class SignUpAddress extends HookConsumerWidget {
  const SignUpAddress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final country = useTextEditingController();
    final state = useTextEditingController();
    final street = useTextEditingController();
    final postalCode = useTextEditingController();

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
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            width: 94,
            height: 121,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Consumer(
                  builder: (context, ref, _) {
                    // final emailField = ref
                    //     .watch(loginFormNotifierProvider)
                    //     .form
                    //     .email;
                    return

                        ///Adding CSC Picker Widget in app
                        CSCPicker(
                      ///Enable disable state dropdown [OPTIONAL PARAMETER]
                      showStates: true,

                      /// Enable disable city drop down [OPTIONAL PARAMETER]
                      showCities: true,

                      ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                      flagState: CountryFlag.DISABLE,

                      ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                      dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1)),

                      ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                      disabledDropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.shade300,
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1)),

                      ///placeholders for dropdown search field
                      countrySearchPlaceholder: "Country",
                      stateSearchPlaceholder: "State",
                      citySearchPlaceholder: "City",

                      ///labels for dropdown
                      countryDropdownLabel: "Country",
                      stateDropdownLabel: "State",
                      cityDropdownLabel: "City",

                      ///selected item style [OPTIONAL PARAMETER]
                      selectedItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),

                      ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                      dropdownHeadingStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),

                      ///DropdownDialog Item style [OPTIONAL PARAMETER]
                      dropdownItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),

                      ///Dialog box radius [OPTIONAL PARAMETER]
                      dropdownDialogRadius: 10.0,

                      ///Search bar radius [OPTIONAL PARAMETER]
                      searchBarRadius: 10.0,

                      ///triggers once country selected in dropdown
                      onCountryChanged: (value) {
                        // setState(() {
                        //   ///store value in country variable
                        //   countryValue = value;
                        // });
                      },

                      ///triggers once state selected in dropdown
                      onStateChanged: (value) {
                        // setState(() {
                        //   ///store value in state variable
                        //   stateValue = value;
                        // });
                      },

                      ///triggers once city selected in dropdown
                      onCityChanged: (value) {
                        // setState(() {
                        //   ///store value in city variable
                        //   cityValue = value;
                        // });
                      },

                      ///Show only specific countries using country filter
                      // countryFilter: ["United States", "Canada", "Mexico"],
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Consumer(
                  builder: (context, ref, _) {
                    // final emailField = ref
                    //     .watch(loginFormNotifierProvider)
                    //     .form
                    //     .email;
                    return CustomTextField(
                      onChanged: (value) => {
                        //  ref
                        //   .read(loginFormNotifierProvider.notifier)
                        //   .setEmail(value)
                      },
                      controller: street,
                      // hintText: 'Email',
                      labelText: "Street",
                      // errorMessage: emailField.errorMessage,
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, _) {
                    // final emailField = ref
                    //     .watch(loginFormNotifierProvider)
                    //     .form
                    //     .email;
                    return CustomTextField(
                      onChanged: (value) => {
                        //  ref
                        //   .read(loginFormNotifierProvider.notifier)
                        //   .setEmail(value)
                      },
                      controller: postalCode,
                      // hintText: 'Email',
                      labelText: "Postal Code",
                      // errorMessage: emailField.errorMessage,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
