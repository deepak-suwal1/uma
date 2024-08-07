const String googleAuthenticationMutation = """
mutation GoogleAuthentication(\$token: String!) {
  authenticate(input: {
    google: {
      token: \$token
    }
  }) {
    ...on CurrentUser {
      id
      identifier
      channels {
        id
        token
        code
        permissions
        __typename
      }
      __typename
    }
    
    ...on ErrorResult {
      errorCode
      message
    }
    
    ...on InvalidCredentialsError {
      errorCode
      message
      authenticationError
    }
    
    ...on NotVerifiedError {
      errorCode
      message
    }
  }
}
""";
