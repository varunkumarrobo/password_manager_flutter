
mixin UserValidation {
  mobileValidator(value) {
    if (value == null || value.isEmpty) {
      return "Mobile-Number Required";
    } else if (!RegExp(r'^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$')
        .hasMatch(value)) {
      return "Invalid Mobile";
    } else {
      return null;
    }
  }

  mPinValidator(value) {
    if (value == null || value.isEmpty) {
      return "Password Required";
    } else if (value.length != 4) {
      return "MPin length must be 4";
    } else {
      return null;
    }
  }
}