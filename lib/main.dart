import 'package:blockfirsttime/features/home/presentation/pages/get_all_product_page.dart';
import 'package:blockfirsttime/features/home/presentation/pages/get_single_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/service_locator.dart';
import 'features/home/presentation/bloc/single_product/product_bloc.dart';
import 'features/home/presentation/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(create: (context) => sl<ProductBloc>()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/get_all_products': (context) => GetAllProducts(),
        '/get_single_product': (context) => GetSingleProductPage(),

      },
    );
  }
}
