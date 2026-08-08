import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

/// A horizontal scrollable number selector displaying numbers from 1 to 100.
class NumberSelector extends StatefulWidget {
  final int initialSelectedNumber;
  final ValueChanged<int>? onNumberSelected;

  const NumberSelector({
    super.key,
    this.initialSelectedNumber = 1,
    this.onNumberSelected,
  });

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  late int _selectedNumber;
  final List<int> _numbers = List.generate(100, (index) => index + 1);

  @override
  void initState() {
    super.initState();
    _selectedNumber = widget.initialSelectedNumber;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: _numbers.map((number) {
          final isSelected = number == _selectedNumber;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedNumber = number;
              });
              widget.onNumberSelected?.call(number);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 12.0),
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.textDark : Colors.transparent,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Text(
                '$number',
                style: GoogleFonts.inter(
                  fontSize: 16.0,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? Colors.white : AppColors.textGray,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
