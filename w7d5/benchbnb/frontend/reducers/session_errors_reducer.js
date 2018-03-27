import merge from 'lodash/merge';

const sessionErrorsReducer = (state = [], action) => {
  Object.freeze(state);

  switch (action.type) {
    default :
      return state;
  }
};

export default sessionErrorsReducer;