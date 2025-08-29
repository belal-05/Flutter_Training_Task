import 'package:flutter_app_task/helper/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Email Validator', () {
    test('returns error if email is empty', () {
      expect(Validators.validateEmail(''), 'Enter Email');
      expect(Validators.validateEmail(null), 'Enter Email');
      expect(Validators.validateEmail('   '), 'Enter Email');
    });

    test('returns error if email is invalid', () {
      expect(Validators.validateEmail('invalidemail'), 'Enter a valid email!');
      expect(Validators.validateEmail('user@'), 'Enter a valid email!');
      expect(Validators.validateEmail('user@com'), 'Enter a valid email!');
      expect(Validators.validateEmail('user@.com'), 'Enter a valid email!');
      expect(Validators.validateEmail('user@@example.com'), 'Enter a valid email!');
    });

    test('returns null for valid emails', () {
      expect(Validators.validateEmail('user@example.com'), null);
      expect(Validators.validateEmail('john.doe123@test.co.uk'), null);
      expect(Validators.validateEmail('a@b.io'), null);
    });
  });

  group('Password Validator', () {
    test('returns error if password is empty', () {
      expect(Validators.validatePassword(''), 'Enter Password');
      expect(Validators.validatePassword(null), 'Enter Password');
      expect(Validators.validatePassword('   '), 'Enter Password');
    });

    test('returns error if password is less than 8 characters', () {
      expect(Validators.validatePassword('abc123'), 'Password must be at least 8 characters');
      expect(Validators.validatePassword('1234567'), 'Password must be at least 8 characters');
      expect(Validators.validatePassword('pass12'), 'Password must be at least 8 characters');
      expect(Validators.validatePassword('      '), 'Enter Password');
    });

    test('returns null if password is at least 8 characters', () {
      expect(Validators.validatePassword('12345678'), null);
      expect(Validators.validatePassword('strongPass!'), null);
      expect(Validators.validatePassword('  strongpass!  '), null); // trims spaces
    });
  });

}
