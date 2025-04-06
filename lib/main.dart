import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'core/di/service_locator.dart';
import 'features/home/presentation/bloc/product_bloc.dart';

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
