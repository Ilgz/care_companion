import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class AgeRangeDropdown extends StatelessWidget {
  final String ageRange;
  final bool isDropdownActive;
  final Function(String?) onChanged;
  final Function(bool) onMenuStateChange;

  const AgeRangeDropdown({
    Key? key,
    required this.ageRange,
    required this.isDropdownActive,
    required this.onChanged,
    required this.onMenuStateChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xfffd894f).withOpacity(0.2)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          value: ageRange,
          customButton: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(ageRange, style: const TextStyle(fontSize: 16, color: Color(0xfffd894f))),
                    const Spacer(),
                    Icon(
                      isDropdownActive ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,
                      color: const Color(0xfffd894f),
                    )
                  ],
                ),
              )),
          onMenuStateChange: onMenuStateChange,
          buttonStyleData: const ButtonStyleData(
            height: 40,
            width: 120,
            padding: EdgeInsets.only(left: 16),
          ),
          dropdownStyleData: DropdownStyleData(
            openInterval: const Interval(0, 1, curve: Curves.easeInOut),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 8,
          ),
          menuItemStyleData: MenuItemStyleData(
            padding: const EdgeInsets.all(0),
            customHeights: _getCustomItemsHeights(),
          ),
          items: _buildMenuItems(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildMenuItems() {
    final divisions = ["All ages"];
    divisions.addAll(Milestone.ageRangeDivisions);
    List<DropdownMenuItem<String>> menuItems = [];

    for (int i = 0; i < divisions.length; i++) {
      menuItems.add(DropdownMenuItem(
        value: divisions[i],
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: double.infinity,
          color: divisions[i] == ageRange ? const Color(0xfffd894f).withOpacity(0.2) : Colors.white,
          child: Text(divisions[i]),
        ),
      ));

      if (divisions[i] != divisions.last) {
        menuItems.add(const DropdownMenuItem<String>(
          enabled: false,
          child: Divider(),
        ));
      }
    }

    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    List<double> itemsHeights = [];
    for (var i = 0; i < ((Milestone.ageRangeDivisions.length + 1) * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }

      // Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }
}