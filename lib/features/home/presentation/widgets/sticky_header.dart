import 'package:flutter/material.dart';
import 'package:job_website/core/constants/spacing.dart';
import 'package:job_website/core/theme/app_colors.dart';
import 'package:job_website/core/theme/app_typography.dart';
import 'package:job_website/core/widgets/responsive_builder.dart';
import 'package:job_website/core/widgets/repaint_boundary_wrapper.dart';

/// Sticky header that stays at top during scroll
/// Renders floating login card styled like the reference design
class StickyHeader extends StatefulWidget {
  final ScrollController scrollController;

  const StickyHeader({
    super.key,
    required this.scrollController,
  });

  @override
  State<StickyHeader> createState() => _StickyHeaderState();
}

class _StickyHeaderState extends State<StickyHeader> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final shouldShowShadow = widget.scrollController.offset > 10;
    if (shouldShowShadow != _isScrolled) {
      setState(() {
        _isScrolled = shouldShowShadow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundaryWrapper(
      child: ResponsiveBuilder(
        builder: (context, size, isMobile, isTablet, isDesktop) {
          final horizontalInset = isMobile ? Spacing.md : Spacing.xxxl;
          const borderRadius = BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          );
          final shadowOffset =
              _isScrolled ? const Offset(0, 12) : const Offset(0, 6);
          final shadowBlur = _isScrolled ? 24.0 : 16.0;

          return Padding(
            padding: EdgeInsets.fromLTRB(
              isMobile ? 0 : horizontalInset,
              0,
              isMobile ? 0 : horizontalInset,
              0,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackOpacity16,
                    offset: shadowOffset,
                    blurRadius: shadowBlur,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: borderRadius,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: isMobile ? 4 : 5,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.blue500, AppColors.teal500],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            isMobile ? Spacing.lg : Spacing.xl,
                            isMobile ? Spacing.md : Spacing.lg,
                            isMobile ? Spacing.lg : Spacing.xl,
                            isMobile ? Spacing.md : Spacing.lg,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Login',
                              style: AppTypography.buttonSemiboldTeal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

