import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/pesan_cubit.dart';
import 'cubit/favorit_cubit.dart';
import 'cubit/pengajuan_cubit.dart';
import 'cubit/theme_cubit.dart';
import 'navigation/app_routes.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PesanCubit>(
          create: (_) => PesanCubit(),
        ),
        BlocProvider<FavoritCubit>(
          create: (_) => FavoritCubit(),
        ),
        BlocProvider<PengajuanCubit>(
          create: (_) => PengajuanCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),  
      ],
      child: const NusantaraCerdasApp(),
    ),
  );
}

class NusantaraCerdasApp extends StatelessWidget {
  const NusantaraCerdasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, thememode) {
        return MaterialApp(
          title: 'Nusantara Cerdas Mobile',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: thememode,
          initialRoute: AppRoutes.beranda,
          routes: AppRoutes.daftarRoute(),
          onGenerateRoute: AppRoutes.bentukRoute,
          onUnknownRoute: AppRoutes.routeTidakDikenal,
        );
      },
    );
  }
}