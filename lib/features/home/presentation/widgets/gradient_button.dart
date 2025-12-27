import 'package:flutter/material.dart';
import 'package:job_website/core/theme/app_colors.dart';
import 'package:job_website/core/theme/app_typography.dart';
import 'package:job_website/core/widgets/responsive_builder.dart';

/// Gradient button widget matching Figma design
/// Uses exact gradient colors and styling
class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isCompact;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size, isMobile, isTablet, isDesktop) {
        final borderRadius = BorderRadius.circular(12);

        return SizedBox(
          height: 40,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              gradient: LinearGradient(
                colors: [AppColors.teal500, AppColors.blue500],
                begin: Alignment(-1.0, -0.05),
                end: Alignment(1.0, 0.05),
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPressed,
                borderRadius: borderRadius,
                child: Center(
                  child: Text(
                    text,
                    style: isCompact
                        ? AppTypography.buttonSemibold
                        : AppTypography.buttonSemibold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}




