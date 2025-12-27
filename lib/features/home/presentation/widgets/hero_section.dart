import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_website/core/constants/spacing.dart';
import 'package:job_website/core/theme/app_colors.dart';
import 'package:job_website/core/theme/app_typography.dart';
import 'package:job_website/core/widgets/responsive_builder.dart';
import 'package:job_website/core/widgets/repaint_boundary_wrapper.dart';

/// Hero section with title, illustration, and CTA button
/// Optimized for performance with RepaintBoundary
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundaryWrapper(
      child: ResponsiveBuilder(
        builder: (context, size, isMobile, isTablet, isDesktop) {
          final horizontalPadding = isMobile ? 0.0 : Spacing.xxxl;
          final topPadding = isMobile ? 18.0 : Spacing.massive;
          final bottomPadding = isMobile ? Spacing.xxxl : Spacing.massive;
          final screenWidth = size.width;

          final waveHeight = isMobile ? 48.0 : 96.0;

          return ClipPath(
            clipBehavior: Clip.antiAlias,
            clipper: _HeroWaveClipper(waveHeight: waveHeight),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                topPadding,
                horizontalPadding,
                bottomPadding + waveHeight,
              ),
              color: AppColors.teal50,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (!isMobile)
                    Container(
                      width: 140,
                      height: 8,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.blue500, AppColors.teal500],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                    ),
                  SizedBox(height: isMobile ? 0 : Spacing.xxxl),
                  if (isMobile)
                    SizedBox(
                      width: screenWidth,
                      height: 113,
                      child: Center(
                        child: Text(
                          'Deine Job\nwebsite',
                          textAlign: TextAlign.center,
                          style: AppTypography.headlineMedium.copyWith(
                            fontSize: 42,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.26,
                            height: 50 / 42,
                            color: AppColors.gray700,
                          ),
                        ),
                      ),
                    )
                  else
                    SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Deine Job\nwebsite',
                          textAlign: TextAlign.center,
                          style: AppTypography.headlineMedium.copyWith(
                            fontSize: 52,
                            fontWeight: FontWeight.w500,
                            color: AppColors.gray700,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: isMobile ? Spacing.xl : Spacing.massive),
                  _HandshakeIllustration(isMobile: isMobile),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Handshake illustration widget
/// Placeholder for actual image asset
class _HandshakeIllustration extends StatelessWidget {
  final bool isMobile;

  const _HandshakeIllustration({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 408,
        child: SvgPicture.asset(
          'assets/images/undraw_agreement_aajr.svg',
          fit: BoxFit.cover,
          placeholderBuilder: (context) {
            return Container(
              color: AppColors.gray50,
            );
          },
        ),
      );
    }

    final cardSize = 420.0;
    const outerRadius = 56.0;

    return Container(
      width: cardSize,
      height: cardSize,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.teal500, AppColors.blue500],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(outerRadius),
        boxShadow: const [
          BoxShadow(
            color: AppColors.blackOpacity20,
            offset: Offset(0, 20),
            blurRadius: 28,
          ),
        ],
      ),
      padding: const EdgeInsets.all(2.4),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(outerRadius - 6),
        ),
        padding: const EdgeInsets.all(Spacing.xxxl),
        child: SvgPicture.asset(
          'assets/images/undraw_business_deal_cpi9.svg',
          fit: BoxFit.contain,
          width: double.infinity,
          height: double.infinity,
          placeholderBuilder: (context) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.gray50,
                borderRadius: BorderRadius.circular(outerRadius - 12),
              ),
              child: const Icon(
                Icons.handshake,
                size: 80,
                color: AppColors.gray500,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Creates the curved bottom edge for the hero background to match design wave
class _HeroWaveClipper extends CustomClipper<Path> {
  final double waveHeight;

  const _HeroWaveClipper({required this.waveHeight});

  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;

    final path = Path()
      ..lineTo(0, height - waveHeight)
      ..quadraticBezierTo(
        width * 0.25,
        height,
        width * 0.5,
        height - waveHeight * 0.6,
      )
      ..quadraticBezierTo(
        width * 0.8,
        height - waveHeight * 1.4,
        width,
        height - waveHeight * 0.8,
      )
      ..lineTo(width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant _HeroWaveClipper oldClipper) {
    return waveHeight != oldClipper.waveHeight;
  }
}
