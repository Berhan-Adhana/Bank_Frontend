import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:front_end/firebase_options.dart';
import 'package:front_end/provider/connectivity_provider.dart';
import 'package:front_end/screens/auth/Auth.dart';
import 'package:front_end/screens/home.dart';
import 'package:front_end/screens/login.dart';
import 'package:front_end/screens/signup.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

bool shouldUseFirebaseEmulator = false;

late final FirebaseApp app;
late final FirebaseAuth auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// We store the app and auth to make testing with a named instance easier.
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

final firebaseInitializerProvider = FutureProvider((ref) async {
  return await Firebase.initializeApp();
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var connectivityStatusProvider = ref.watch(connectivityStatusProviders);

    Fluttertoast.showToast(
        msg: connectivityStatusProvider == ConnectivityStatus.isConnected
            ? 'Connected to Internet'
            : 'Disconnected from Internet',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(
    //         connectivityStatusProvider == ConnectivityStatus.isConnected
    //             ? 'Is Connected to Internet'
    //             : 'Is Disconnected from Internet'),
    //     behavior: SnackBarBehavior.floating,
    //   ),
    // );
    final init = ref.watch(firebaseInitializerProvider);
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Tesfa Bank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme),
          colorScheme:
          const ColorScheme.light().copyWith(primary: Colors.black)),
    );
  }
}

// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Auth();
        },
        routes: const []),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return SignUp();
      },
    ),
    GoRoute(
      path: '/dashboard',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
    ),
  ],
);
