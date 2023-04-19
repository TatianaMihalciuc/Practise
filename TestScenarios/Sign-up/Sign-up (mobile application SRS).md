# Description

## Password restrictions

- Password must be at least 6 characters
- Password must include lower case and upper case characters
- Password must be alphanumeric
- Password must include at least one special character

## Sign-up Test Scenarios

- [ ] Verify registration using valid data(provide phone number)
- [ ] Verify registration using valid data(do not provide phone number)
- [ ] Verify registration while leaving the username field empty
- [ ] Verify registration while leaving the password field empty
- [ ] Verify registration while leaving the email field empty
- [ ] Verify registration using very short user name
- [ ] Verify registration using an already used username
- [ ] Verify registration using non-latin user name
- [ ] Verify registration using short password(Az23$)
- [ ] Verify registration using password which does not include lower case letters(AZS12$)
- [ ] Verify registration using password which does not include upper case letters(qas12£)
- [ ] Verify registration using password which does not include numbers(QasX$x)
- [ ] Verify registration using password which does not include special characters(QAwz34)
- [ ] Verify registration using password which does not include any letters(123$$$)
- [ ] Verify registration using invalid format in email field(adf234)
- [ ] Verify registration with an already used email address
- [ ] Verify registration that phone number field only accepts numbers(no special characters or letters)
- [ ] Verify registration using very short phone number(9463)