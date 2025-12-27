import 'package:flutter/material.dart';
import 'package:job_website/core/widgets/responsive_builder.dart';
import 'package:job_website/core/constants/spacing.dart';
import 'package:job_website/core/theme/app_colors.dart';
import 'package:job_website/features/home/presentation/widgets/sticky_header.dart';
import 'package:job_website/features/home/presentation/widgets/hero_section.dart';
import 'package:job_website/features/home/presentation/widgets/steps_section.dart';
import 'package:job_website/features/home/presentation/widgets/gradient_button.dart';
import 'package:job_website/features/home/presentation/providers/tab_provider.dart';

/// Main home page with scrollable content and sticky header
/// Implements performance optimizations for smooth scrolling
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final TabProvider _tabProvider = TabProvider();

  @override
  void dispose() {
    _scrollController.dispose();
    _tabProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue50,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.blue50, AppColors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ResponsiveBuilder(
          builder: (context, size, isMobile, isTablet, isDesktop) {
            final horizontalPadding = isMobile ? 0.0 : Spacing.xxxl;
            const double mobileEdgeInset = 20;
            final topContentPadding = isMobile ? 0.0 : Spacing.xxxl;

            return Column(
              children: [
                SafeArea(
                  bottom: false,
                  child: StickyHeader(
                    scrollController: _scrollController,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      topContentPadding,
                      horizontalPadding,
                      Spacing.massive,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const HeroSection(),
                        StepsSection(tabProvider: _tabProvider),
                        SizedBox(
                            height: isMobile ? Spacing.massive : Spacing.huge),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      isMobile ? 0 : horizontalPadding,
                      0,
                      isMobile ? 0 : horizontalPadding,
                      0,
                    ),
                    child: Container(
                      height: isMobile ? 88 : null,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.blackOpacity16,
                            offset: Offset(0, 8),
                            blurRadius: 24,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile ? Spacing.md : Spacing.lg,
                        horizontal: isMobile ? mobileEdgeInset : Spacing.lg,
                      ),
                      child: GradientButton(
                        text: 'Kostenlos Registrieren',
                        onPressed: () {},
                        isCompact: isMobile,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

