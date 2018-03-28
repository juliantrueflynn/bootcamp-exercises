import React from 'react';
import { connect } from 'react-redux';
import { signup, login } from '../../actions/session_actions';
import SessionForm from './session_form';

const mapStateToProps = (state, { location }) => {
  return {
    loggedIn: state.currentUser != null,
    formType: location.pathname,
    errors: state.errors.session,
  }
};

const mapDispatchToProps = (dispatch, { location }) => ({
  processForm: user => {
    if (location.pathname === '/login') {
      return dispatch(login(user));
    } else {
      return dispatch(signup(user));
    }
  }
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm);