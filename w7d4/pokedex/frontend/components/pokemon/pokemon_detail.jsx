import React from 'react';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.requestSinglePokemon(newProps.match.params.pokemonId);
    }
  }
  
  render() {
    const { pokemon, items } = this.props;
    if (!pokemon) return null;
    console.log(items);

    return (
      <div>
        <h1>{ pokemon.name }</h1>
        <p>Type: { pokemon.poke_type }</p>
        <p>Attack: { pokemon.attack }</p>
        <p>Defense: { pokemon.defense }</p>
        <p>Moves: { pokemon.moves.join(', ') }</p>
        <p>Items: { pokemon.item_ids.join(', ') }</p>
      </div>
    );
  }
}

export default PokemonDetail;