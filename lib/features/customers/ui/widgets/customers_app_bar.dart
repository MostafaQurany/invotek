import 'package:flutter/material.dart';
import 'package:invotek/generated/l10n.dart';

class CustomersAppBar extends StatelessWidget {
  final VoidCallback onMenuPressed;
  final VoidCallback onAddPressed;

  const CustomersAppBar({
    super.key,
    required this.onMenuPressed,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final s = S.of(context);

    return SliverAppBar(
      title: Text(s.customersList),
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      scrolledUnderElevation: 1,
      floating: true,
      snap: true,
      leading: IconButton(
        icon: Icon(Icons.menu, color: colorScheme.onSurface),
        onPressed: onMenuPressed,
      ),
    );
  }
}
