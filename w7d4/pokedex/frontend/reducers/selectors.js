import values from 'lodash/values';

export const selectAllPokemon = ({ entities: { pokemon } }) => {
  return values(pokemon);
};