import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Row of week day labels (S, M, T, W, T, F, S) aligned with grid columns.
class ChartLabels extends StatelessWidget {
  final List<String> labels;
  final double sidePadding;

  const ChartLabels({
    super.key,
    this.labels = const ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
    this.sidePadding = 22.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sidePadding - 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: labels.map((label) {
          return SizedBox(
            width: 20,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF7E8E98),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
