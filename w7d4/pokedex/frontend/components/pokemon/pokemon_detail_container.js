import React from 'react';
import { connect } from 'react-redux';
import { requestSinglePokemon } from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';
import { withRouter } from 'react-router';

const mapStateToProps = state => ({
  pokemon: state.entities.pokemon[state.ui.pokeDisplay],
  items: state.entities.items.items
});

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: pokemonId => dispatch(requestSinglePokemon(pokemonId))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);