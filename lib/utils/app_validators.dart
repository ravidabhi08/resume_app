class AppValidator {
  static String? emptyNullValidator(
    String? value, {
    String? errorMessage = "required!",
  }) {
    //TODO: Add Extra Validation If Needed
    if (value?.trim().isEmpty ?? true) return errorMessage;

    return null;
  }

  static String? numberValidator(
    String? value, {
    String? errorMessage = "Please enter valid number!",
  }) {
    if (value?.trim().isEmpty ?? true) {
      return "required!";
    } else if (double.tryParse(value!) == null || double.parse(value) <= 0) {
      return errorMessage;
    }
    return null;
  }
}
