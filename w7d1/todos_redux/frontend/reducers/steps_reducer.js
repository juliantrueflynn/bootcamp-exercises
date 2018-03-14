import {
  RECEIVE_STEPS,
  RECEIVE_STEP,
  REMOVE_STEP
} from '../actions/step_actions';
import merge from 'lodash/merge';

const initialState = {
  1: {
    id: 123141,
    title: "Test step title 1",
    body: "body tesaffd",
    done: false
  },
  2: {
    id: 123423423,
    title: "Test 2",
    body: "FSefasdf asefsaef",
    done: false
  }
};

const stepsReducer = (state = initialState, action) => {
  Object.freeze(state);
  let nextState;

  switch(action.type) {
    case RECEIVE_STEPS:
      nextState = {};
      action.steps.forEach(step => {
        nextState[step.id] = step;
      });
      return nextState;
    case RECEIVE_STEP:
      const newStep = {[action.step.id]: action.step};
      return merge({}, state, newStep);
    case REMOVE_STEP:
      nextState = merge({}, state);
      delete nextState[action.step.id];
      return state;
    default:
      return state;
  }
};

export default stepsReducer;