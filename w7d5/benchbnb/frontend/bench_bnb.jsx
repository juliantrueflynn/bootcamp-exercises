import React from 'react';
import ReactDOM from 'react-dom';
import * as APIUtilSession from './util/session_api_util';
import {
  signup,
  login,
  logout,
  receiveCurrentUser,
  receiveSessionError
} from './actions/session_actions';
import sessionReducer from './reducers/session_reducer';
import configureStore from './store/store';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  
  window.APIUtilSession = APIUtilSession;
  window.signup = signup;
  window.login = login;
  window.logout = logout;
  window.receiveCurrentUser = receiveCurrentUser;
  window.receiveSessionError = receiveSessionError;
  window.sessionReducer = sessionReducer;
  window.getState = store.getState;
  window.dispatch = store.dispatch;

  ReactDOM.render(<Root store={ store } />, rootEl);
});