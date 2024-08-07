import 'package:common/common.dart';

enum PhoneNumberValidationError { empty, invalid }

class PhoneNumber extends FormsInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure([super.value = '']) : super.pure();
  const PhoneNumber.dirty([super.value = '']) : super.dirty();

  @override
  PhoneNumberValidationError? validator(String value) {
    final bool phoneNoValid =
        RegExp(r'^(\+){0,1}([0-9]){0,5}(?:[0-9]\x20?){6,9}[0-9]$')
            .hasMatch(value.trim());
    if (value.trim().isEmpty) {
      return PhoneNumberValidationError.empty;
    } else if (!phoneNoValid) {
      return PhoneNumberValidationError.invalid;
    } else {
      return null;
    }
  }
}

class USPhoneNumber extends FormsInput<String, PhoneNumberValidationError> {
  const USPhoneNumber.pure([super.value = '']) : super.pure();
  const USPhoneNumber.dirty([super.value = '']) : super.dirty();

  @override
  PhoneNumberValidationError? validator(String value) {
    final bool phoneNoValid =
        RegExp(r'^(\+1)(?:[0-9]\x20?){6,9}[0-9]$').hasMatch(value.trim());
    if (value.trim().isEmpty) {
      return PhoneNumberValidationError.empty;
    } else if (!phoneNoValid) {
      return PhoneNumberValidationError.invalid;
    } else {
      return null;
    }
  }
}

extension USPhoneNumberFromString on String {
  PhoneNumber toPhoneNumber() => PhoneNumber.dirty(this);

  PhoneNumber toOptionalPhoneNumber() =>
      isBlank ? trim().toPurePhoneNumber() : trim().toPhoneNumber();

  PhoneNumber toPurePhoneNumber() => PhoneNumber.pure(this);

  USPhoneNumber toUSPhoneNumber() => USPhoneNumber.dirty(this);

  USPhoneNumber toOptionalUSPhoneNumber() =>
      isBlank ? trim().toPureUSPhoneNumber() : trim().toUSPhoneNumber();

  USPhoneNumber toPureUSPhoneNumber() => USPhoneNumber.pure(this);
}
