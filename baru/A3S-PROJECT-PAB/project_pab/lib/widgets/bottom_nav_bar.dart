import 'package:flutter/material.dart';
import 'package:project_pab/shared/shared.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  BottomNavBar({required this.selectedIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_outlined, Icons.home, selectedIndex == 0, 0),
          _buildNavItem(Icons.message_outlined, Icons.message, selectedIndex == 1, 1),
          _buildNavItem(Icons.favorite_border, Icons.favorite, selectedIndex == 2, 2),
          _buildNavItem(Icons.person_outline, Icons.person, selectedIndex == 3, 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData iconOutline, IconData iconFill, bool isActive, int index) {
    return GestureDetector(
      onTap: () {
        onItemSelected(index); // Mengubah halaman sesuai index yang dipilih
      },
      child: AnimatedBuilder(
        animation: AlwaysStoppedAnimation(1.0),
        builder: (context, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.scale(
                scale: isActive ? 1.1 : 1.0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? buttonColor : Colors.white,
                    boxShadow: [
                      if (isActive)
                        BoxShadow(
                          color: buttonColor.withOpacity(0.4),
                          blurRadius: 12,
                          spreadRadius: 2,
                          offset: Offset(0, 4),
                        ),
                    ],
                  ),
                  child: Icon(
                    isActive ? iconFill : iconOutline,
                    color: isActive ? Colors.white : Colors.black,
                    size: 24,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? buttonColor : Colors.transparent,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
