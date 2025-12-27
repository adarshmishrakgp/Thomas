import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:job_website/core/constants/spacing.dart';
import 'package:job_website/core/theme/app_colors.dart';
import 'package:job_website/core/theme/app_typography.dart';
import 'package:job_website/core/widgets/responsive_builder.dart';
import 'package:job_website/core/widgets/repaint_boundary_wrapper.dart';
import 'package:job_website/features/home/presentation/widgets/tab_navigation.dart';
import 'package:job_website/features/home/presentation/widgets/step_card.dart';
import 'package:job_website/features/home/presentation/providers/tab_provider.dart';

/// Steps section that changes based on selected tab
/// Uses ListView.builder for performance optimization
class StepsSection extends StatelessWidget {
  final TabProvider tabProvider;

  const StepsSection({
    super.key,
    required this.tabProvider,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundaryWrapper(
      child: Container(
        color: AppColors.white,
        child: Column(
          children: [
            // Tab navigation
            TabNavigation(tabProvider: tabProvider),
            // Steps content
            ValueListenableBuilder<TabType>(
              valueListenable: tabProvider,
              builder: (context, selectedTab, child) {
                return ResponsiveBuilder(
                  builder: (context, size, isMobile, isTablet, isDesktop) {
                    final steps = _getStepsForTab(selectedTab);
                    final horizontalInset = isMobile ? 0.0 : Spacing.xxxl;
                    final title = _getTitleForTab(selectedTab);

                    return Padding(
                      padding: EdgeInsets.only(
                        left: horizontalInset,
                        right: horizontalInset,
                        top: isMobile ? Spacing.xxxl : Spacing.massive,
                        bottom: isMobile ? Spacing.xxxl : Spacing.massive,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 280,
                              height: 50,
                              child: Center(
                                child: Text(
                                  title,
                                  textAlign: TextAlign.center,
                                  style: AppTypography.headlineMedium.copyWith(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                    height: 25 / 21,
                                    color: AppColors.gray600,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: isMobile ? 32 : 48),
                          ...steps.asMap().entries.map((entry) {
                            final index = entry.key;
                            final step = entry.value;
                            final isMiddle = index == 1;

                            final card = StepCard(
                              key:
                                  ValueKey('${selectedTab.name}_${index + 1}'),
                              stepNumber: index + 1,
                              title: step['title'] as String,
                              illustration: step['illustration'] as String,
                              textBelowIllustration:
                                  step['textBelowIllustration'] as bool? ??
                                      false,
                            );

                            return Align(
                              alignment: Alignment.center,
                              child: isMiddle
                                  ? _MiddleWaveBackground(child: card)
                                  : card,
                            );
                          }),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getTitleForTab(TabType tab) {
    switch (tab) {
      case TabType.arbeitnehmer:
        return 'Drei einfache Schritte zu deinem neuen Job';
      case TabType.arbeitgeber:
        return 'Drei einfache Schritte zu deinem neuen Mitarbeiter';
      case TabType.temporarburo:
        return 'Drei einfache Schritte zur Vermittlung neuer Mitarbeiter';
    }
  }

  List<Map<String, Object>> _getStepsForTab(TabType tab) {
    switch (tab) {
      case TabType.arbeitnehmer:
        return [
          {
            'title': 'Erstellen dein Lebenslauf',
            'illustration':
                'assets/images/951d2153-1afd-4a2c-af57-05d6b7b43fc8.png',
            'textBelowIllustration': true,
          },
          {
            'title': 'Erstellen dein Lebenslauf',
            'illustration':
                'assets/images/77943cbb-f42d-4775-bd23-f3ae6f7198ea.png',
            'textBelowIllustration': false,
          },
          {
            'title': 'Mit nur einem Klick bewerben',
            'illustration':
                'assets/images/1f40dbd7-b75f-48b0-8965-85b50f1b3d00.png',
            'textBelowIllustration': false,
          },
        ];
      case TabType.arbeitgeber:
        return [
          {
            'title': 'Erstellen dein Unternehmensprofil',
            'illustration':
                'assets/images/951d2153-1afd-4a2c-af57-05d6b7b43fc8.png',
            'textBelowIllustration': true,
          },
          {
            'title': 'Erstellen ein Jobinserat',
            'illustration': 'assets/images/undraw_about_me_wa29.svg',
            'textBelowIllustration': false,
          },
          {
            'title': 'Wähle deinen neuen Mitarbeiter aus',
            'illustration': 'assets/images/undraw_swipe_profiles1_i6mr.svg',
            'textBelowIllustration': false,
          },
        ];
      case TabType.temporarburo:
        return [
          {
            'title': 'Erstellen dein Unternehmensprofil',
            'illustration':
                'assets/images/951d2153-1afd-4a2c-af57-05d6b7b43fc8.png',
            'textBelowIllustration': true,
          },
          {
            'title': 'Erhalte Vermittlungs-angebot von Arbeitgeber',
            'illustration': 'assets/images/undraw_job_offers_kw5d.svg',
            'textBelowIllustration': false,
          },
          {
            'title': 'Vermittlung nach Provision oder Stundenlohn',
            'illustration':
                'assets/images/undraw_business_deal_cpi9 (1).svg',
            'textBelowIllustration': false,
          },
        ];
    }
  }
}

class _MiddleWaveBackground extends StatelessWidget {
  final Widget child;

  const _MiddleWaveBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const baseWidth = 520.0;
        const baseHeight = 370.0;
        const verticalIncreaseFactor = 0.10; // 10% above and below
        const baseWaveHeight = 34.0;

        double availableWidth = constraints.maxWidth;
        if (!availableWidth.isFinite || availableWidth <= 0) {
          availableWidth = baseWidth;
        }

        final width = math.min(baseWidth, availableWidth);
        final effectiveWaveHeight = baseWaveHeight * (1 + verticalIncreaseFactor);
        final minHeight = baseHeight * (1 + verticalIncreaseFactor * 2);

        return ClipPath(
          clipBehavior: Clip.antiAlias,
          clipper: _TopBottomWaveClipper(waveHeight: effectiveWaveHeight),
          child: Container(
            width: width,
            constraints: BoxConstraints(minHeight: minHeight),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.teal50, AppColors.blue50],
                // CSS 134deg approximation
                begin: Alignment(-0.7, -0.9),
                end: Alignment(1.0, 0.8),
              ),
            ),
            child: Center(child: child),
          ),
        );
      },
    );
  }
}

class _TopBottomWaveClipper extends CustomClipper<Path> {
  final double waveHeight;

  const _TopBottomWaveClipper({required this.waveHeight});

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final wh = waveHeight;

    return Path()
      ..moveTo(0, wh)
      ..quadraticBezierTo(w * 0.25, 0, w * 0.5, wh)
      ..quadraticBezierTo(w * 0.75, wh * 2, w, wh)
      ..lineTo(w, h - wh)
      ..quadraticBezierTo(w * 0.75, h, w * 0.5, h - wh)
      ..quadraticBezierTo(w * 0.25, h - wh * 2, 0, h - wh)
      ..close();
  }

  @override
  bool shouldReclip(covariant _TopBottomWaveClipper oldClipper) {
    return oldClipper.waveHeight != waveHeight;
  }
}
