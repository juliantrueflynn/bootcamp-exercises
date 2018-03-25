import { RECEIVE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const uiReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_POKEMON :
      return merge({}, state, { pokeDisplay: action.pokemon.pokemon.id });
    default :
      return state;
  }
};

export default uiReducer;