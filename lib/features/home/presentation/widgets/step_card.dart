import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_website/core/theme/app_colors.dart';
import 'package:job_website/core/theme/app_typography.dart';
import 'package:job_website/core/widgets/responsive_builder.dart';
import 'package:job_website/core/widgets/repaint_boundary_wrapper.dart';

/// Step card widget for displaying individual steps.
class StepCard extends StatelessWidget {
  final int stepNumber;
  final String title;
  final String illustration;
  final bool textBelowIllustration;

  const StepCard({
    super.key,
    required this.stepNumber,
    required this.title,
    required this.illustration,
    this.textBelowIllustration = false,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundaryWrapper(
      child: ResponsiveBuilder(
        builder: (context, size, _, __, ___) {
          const baseWidth = 520.0;
          final Color numberColor = AppColors.gray500;
          double leftPadding;
          switch (stepNumber) {
            case 1:
              leftPadding = 20;
              break;
            case 2:
              leftPadding = 37;
              break;
            case 3:
              leftPadding = 57;
              break;
            default:
              leftPadding = 40;
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              double availableWidth = constraints.maxWidth;
              if (!availableWidth.isFinite || availableWidth <= 0) {
                availableWidth = size.width.isFinite && size.width > 0
                    ? size.width
                    : baseWidth;
              }

              if (!availableWidth.isFinite || availableWidth <= 0) {
                availableWidth = baseWidth;
              }

              final cardWidth = math.min(baseWidth, availableWidth);

              return SizedBox(
                width: cardWidth,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: leftPadding,
                    right: 40,
                    top: 32,
                    bottom: 32,
                  ),
                  child: _StepCardContent(
                    stepNumber: stepNumber,
                    title: title,
                    numberColor: numberColor,
                    illustration: illustration,
                    textBelowIllustration: textBelowIllustration,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _StepCardContent extends StatelessWidget {
  final int stepNumber;
  final String title;
  final Color numberColor;
  final String illustration;
  final bool textBelowIllustration;

  const _StepCardContent({
    required this.stepNumber,
    required this.title,
    required this.numberColor,
    required this.illustration,
    required this.textBelowIllustration,
  });

  @override
  Widget build(BuildContext context) {
    final titleText = Text(
      title,
      style: AppTypography.titleMedium.copyWith(
        fontSize: 15.75,
        color: AppColors.gray500,
        height: 1.2,
      ),
    );

    final row = IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              '$stepNumber.',
              style: AppTypography.displayLarge.copyWith(
                fontSize: 118,
                height: 0.9,
                color: numberColor,
              ),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom:16 ),
                child: titleText,
              ),
            ),
          ),
        ],
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (textBelowIllustration) ...[
          _StepIllustration(illustration: illustration),
          const SizedBox(height: 24),
          row,
        ] else ...[
          row,
          const SizedBox(height: 24),
          _StepIllustration(illustration: illustration),
        ],
      ],
    );
  }
}

class _StepIllustration extends StatelessWidget {
  final String illustration;

  const _StepIllustration({
    required this.illustration,
  });

  @override
  Widget build(BuildContext context) {
    const aspectRatio = 1.6;

    Widget buildPlaceholder() {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.gray50,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Icon(
            Icons.image_outlined,
            size: 60,
            color: AppColors.gray500,
          ),
        ),
      );
    }

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: illustration.endsWith('.svg')
          ? SvgPicture.asset(
              illustration,
              fit: BoxFit.contain,
              placeholderBuilder: (context) => buildPlaceholder(),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                illustration,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    buildPlaceholder(),
              ),
            ),
    );
  }
}
