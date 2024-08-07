const requestPasswordResetMutation = r"""
mutation RequestPasswordReset($email: String!) {
  requestPasswordReset(emailAddress: $email) {
    ...on Success {
      success
      __typename
    }
    
    ...on NativeAuthStrategyError {
      errorCode
      message
      __typename
    }
    
    ...on ErrorResult {
      errorCode
      message
      __typename
    }
  }
}
""";
