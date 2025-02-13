import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CTextField extends ConsumerWidget {
  final int? maxLength;
  final bool showBorders;
  final bool readOnly;
  final bool enabled;
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final int? minLines;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final String? suffixText;
  final EdgeInsets? contentPadding;
  final void Function()? onTap;
  final Iterable<String>? autofillHints;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const CTextField({
    super.key,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.showBorders = true,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixText,
    this.suffixIcon,
    this.inputFormatters,
    this.controller,
    this.validator,
    this.keyboardType,
    this.autofillHints,
    this.textAlign = TextAlign.start,
    this.textInputAction = TextInputAction.next,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
    this.maxLines = 1,
    this.minLines = 1,
    this.onTap,
    this.onSubmit,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(16);

    return TextFormField(
      onTap: onTap,
      enabled: enabled,
      readOnly: readOnly,
      maxLength: maxLength,
      controller: controller,
      obscureText: obscureText,
      textAlign: textAlign,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      autofillHints: autofillHints,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      style: theme.textTheme.bodyMedium,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        suffixText: suffixText,
        contentPadding: contentPadding,
        filled: true,
        fillColor: theme.colorScheme.surface,
        border: showBorders
            ? OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: theme.colorScheme.onSurface),
              )
            : InputBorder.none,
        enabledBorder: showBorders
            ? OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: theme.colorScheme.onSurface),
              )
            : InputBorder.none,
        focusedBorder: showBorders
            ? OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
              )
            : InputBorder.none,
        errorBorder: showBorders
            ? OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: theme.colorScheme.error),
              )
            : InputBorder.none,
        focusedErrorBorder: showBorders
            ? OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: theme.colorScheme.error, width: 2),
              )
            : InputBorder.none,
      ),
    );
  }
}
