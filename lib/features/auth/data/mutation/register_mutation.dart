const String registerMutation = """
mutation AccountRegistration(\$emailAddress: String!, \$title: String!, \$firstName: String!, \$lastName: String!, \$phoneNumber: String!, \$password: String!) {
  registerCustomerAccount(input: {
    emailAddress: \$emailAddress
    title: \$title
    firstName: \$firstName
    lastName: \$lastName
    phoneNumber: \$phoneNumber
    password: \$password
  }) {
    ...on Success {
      success
    }
    
    ...on MissingPasswordError {
      errorCode
      message
    }
    
    ...on PasswordValidationError {
      errorCode
      message
      validationErrorMessage
    }
    
    ...on NativeAuthStrategyError {
      errorCode
      message
    }
    
    ...on ErrorResult {
      errorCode
      message
    }
  }
}
""";
