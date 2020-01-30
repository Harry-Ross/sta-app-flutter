class AuthenticationState {
    final bool authenticated;
    // Initialise autheticated variable
    AuthenticationState.initial({this.authenticated = false});

    // On authenticated, set auth variable to true
    AuthenticationState.authenticated({this.authenticated = true});

    // If authentication failed, set variable to false
    AuthenticationState.failed({this.authenticated = false});

    // If user signs out, set authenticated to false
    AuthenticationState.signedOut({this.authenticated = false});
}