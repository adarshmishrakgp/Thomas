   import 'package:flutter/material.dart';
import 'package:job_website/core/constants/spacing.dart';
import 'package:job_website/core/theme/app_colors.dart';
import 'package:job_website/core/theme/app_typography.dart';
import 'package:job_website/core/widgets/responsive_builder.dart';
import 'package:job_website/core/widgets/repaint_boundary_wrapper.dart';
import 'package:job_website/features/home/presentation/providers/tab_provider.dart';

/// Tab navigation widget for switching between views
/// Uses ValueListenableBuilder for isolated rebuilds
class TabNavigation extends StatelessWidget {
  final TabProvider tabProvider;

  const TabNavigation({
    super.key,
    required this.tabProvider,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundaryWrapper(
      child: ResponsiveBuilder(
        builder: (context, size, isMobile, isTablet, isDesktop) {
          const cornerRadius = 12.0;
          final groupRadius = BorderRadius.circular(cornerRadius);
          return ValueListenableBuilder<TabType>(
            valueListenable: tabProvider,
            builder: (context, selectedTab, child) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: isMobile ? 0.0 : Spacing.xxxl,
                ),
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: groupRadius,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.blackOpacity16,
                      offset: Offset(0, 12),
                      blurRadius: 24,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: groupRadius,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _TabButton(
                            label: 'Arbeitnehmer',
                            isSelected: selectedTab == TabType.arbeitnehmer,
                            onTap: () => tabProvider.setTab(TabType.arbeitnehmer),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(cornerRadius),
                              bottomLeft: Radius.circular(cornerRadius),
                            ),
                            isMobile: isMobile,
                          ),
                          _TabButton(
                            label: 'Arbeitgeber',
                            isSelected: selectedTab == TabType.arbeitgeber,
                            onTap: () => tabProvider.setTab(TabType.arbeitgeber),
                            borderRadius: BorderRadius.zero,
                            isMobile: isMobile,
                          ),
                          _TabButton(
                            label: 'Temporärbüro',
                            isSelected: selectedTab == TabType.temporarburo,
                            onTap: () => tabProvider.setTab(TabType.temporarburo),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(cornerRadius),
                              bottomRight: Radius.circular(cornerRadius),
                            ),
                            isMobile: isMobile,
                          ),
                        ],
                      ),
                    ),
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

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isMobile;
  final BorderRadius borderRadius;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.borderRadius,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final buttonWidth = 161.0;
    final buttonHeight = 40.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.teal300 : AppColors.white,
        borderRadius: borderRadius,
        border: Border.all(
          color: isSelected ? Colors.transparent : AppColors.gray400,
          width: isSelected ? 0 : 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: SizedBox(
            width: buttonWidth,
            height: buttonHeight,
            child: Center(
              child: Text(
                label,
                style: AppTypography.buttonSemibold.copyWith(
                  color: isSelected ? AppColors.white : AppColors.teal500,
                  fontSize: isMobile ? 13 : 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

