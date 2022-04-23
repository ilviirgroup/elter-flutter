String modifyPhoneNumber(String phone) {
    String countryCode = '+993';
    if (phone.startsWith(countryCode)) {
      return phone.substring(4);
    }
    return '$countryCode$phone';
  }