import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const { pokemon } = this.props;
    const pokeList = pokemon.map(poke => (
      <PokemonIndexItem key={ poke.id } pokemon={ poke } />
    ));

    return (
      <ul>{ pokeList }</ul>
    );
  }
}

export default PokemonIndex;