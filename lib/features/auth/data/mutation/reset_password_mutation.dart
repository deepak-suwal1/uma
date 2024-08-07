const resetPasswordMutation = r'''
    mutation ResetPassword($token: String!, $password: String!) {
  resetPassword(token: $token, password: $password) {
    ...on CurrentUser {
      id
      identifier
      
      channels{
        id
        token
        code
        permissions
      }
    }
    
    ...on PasswordResetTokenInvalidError {
      errorCode
      message
    }
    
    ...on PasswordResetTokenExpiredError {
      errorCode
      message
    }
    
    ...on PasswordValidationError {
      errorCode
      message
      validationErrorMessage
    }
    
    ...on NativeAuthStrategyError  {
      errorCode
      message
    }
    
    ...on NotVerifiedError {
      errorCode
      message
    }
    
    ...on ErrorResult {
      errorCode
      message
    }
  }
}
''';
