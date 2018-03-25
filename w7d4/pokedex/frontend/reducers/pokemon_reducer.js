import {
  RECEIVE_ALL_POKEMON,
  RECEIVE_POKEMON
} from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  
  let nextState;
  switch (action.type) {
    case RECEIVE_ALL_POKEMON :
      return merge({}, state, action.pokemon);
    case RECEIVE_POKEMON :
      let pokemon = action.pokemon.pokemon;
      pokemon.item_ids = action.pokemon.items.map(item => item.id);
      return merge({}, state, { [pokemon.id]: pokemon });
    default :
      return state;
  }
};

export default pokemonReducer;