import {
  RECEIVE_CURRENT_USER,
  RECEIVE_ERRORS,
  receiveCurrentUser,
  receiveErrors
} from '../actions/session_actions';
import merge from 'lodash/merge';

const sessionReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_CURRENT_USER :
      console.log(action);
      return merge({}, state);
    default :
      return state;
  }
};

export default sessionReducer;
