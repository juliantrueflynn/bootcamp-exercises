import {
  RECEIVE_CURRENT_USER,
  RECEIVE_SESSION_ERRORS
} from '../actions/session_actions';
import merge from 'lodash/merge';

const _nullUser = { currentUser: null };

const sessionReducer = (state = _nullUser, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_CURRENT_USER :
      return merge({}, { currentUser: action.currentUser });
    default :
      return state;
  }
};

export default sessionReducer;
