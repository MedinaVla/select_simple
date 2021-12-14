library select_simple;

import 'package:flutter/material.dart';

class SelectSimple<T> extends StatelessWidget {
  const SelectSimple({
    Key? key,
    required this.menuItems,
    required this.selectedItemValue,
    this.onChanged,
    this.colorSelected,
    this.labelText,
    this.onTap,
    this.leadingIcon,
    this.border,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
    this.radius = 30.0,
    this.trailingIcon,
  }) : super(key: key);

  final String? labelText;
  final List<T> menuItems;
  final T selectedItemValue;
  final Widget? leadingIcon;
  final InputBorder? border;
  final Widget? trailingIcon;
  final void Function(Object?)? onChanged;
  final void Function()? onTap;
  final EdgeInsetsGeometry contentPadding;
  final Color? colorSelected;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: FormField<T>(
        builder: (FormFieldState<T> state) {
          return InputDecorator(
            decoration: InputDecoration(
              contentPadding: contentPadding,
              labelText: labelText,
              icon: leadingIcon,
              border: border ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius)),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                icon: trailingIcon,
                value: selectedItemValue,
                isExpanded: true,
                onChanged: onChanged,
                onTap: onTap,
                items: menuItems.map((T value) {
                  return DropdownMenuItem<T>(
                    value: value,
                    child: Center(
                        child: Text(
                      '$value',
                      style: TextStyle(color: colorSelected),
                    )),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
