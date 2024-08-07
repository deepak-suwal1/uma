const String loginMutation = """
    mutation Authenticate(\$username: String!, \$password: String!) {
      authenticate(input: {
        native: {
          username: \$username,
          password: \$password
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
