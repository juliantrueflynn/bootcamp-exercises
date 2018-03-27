import * as APIUtilSession from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS";

export const receiveCurrentUser = currentUser => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const receiveErrors = errors => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
});

export const signup = user => dispatch => (
  APIUtilSession.signup(user).then(
    currentUser => dispatch(receiveCurrentUser(currentUser)),
    errors => dispatch(receiveErrors(errors.responseJSON))
  )
);

export const login = user => dispatch => (
  APIUtilSession.login(user).then(
    currentUser => dispatch(receiveCurrentUser(currentUser)),
    errors => dispatch(receiveErrors(errors.responseJSON))
  )
);

export const logout = () => dispatch => (
  APIUtilSession.logout().then(
    currentUser => {
      dispatch(receiveErrors([]));
      return dispatch(receiveCurrentUser(null));
    }
  )
);