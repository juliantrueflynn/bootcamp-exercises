import * as APIUtilSession from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

export const receiveCurrentUser = currentUser => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const receiveErrors = errors => ({
  type: RECEIVE_ERRORS,
  errors
});

export const signup = user => (
  APIUtilSession.signup(user).then(
    currentUser => receiveCurrentUser(currentUser),
    errors => receiveErrors(errors)
  )
);

export const login = user => (
  APIUtilSession.login(user).then(
    currentUser => receiveCurrentUser(currentUser),
    errors => receiveErrors(errors)
  )
);

export const logout = () => (
  APIUtilSession.logout().then(
    currentUser => receiveCurrentUser(null)
  )
);