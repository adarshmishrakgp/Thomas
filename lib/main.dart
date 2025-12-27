import 'package:flutter/material.dart';
import 'package:job_website/core/theme/app_theme.dart';
import 'package:job_website/features/home/presentation/pages/home_page.dart';

void main() {
  runApp(const JobWebsiteApp());
}

class JobWebsiteApp extends StatelessWidget {
  const JobWebsiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deine Job website',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}




