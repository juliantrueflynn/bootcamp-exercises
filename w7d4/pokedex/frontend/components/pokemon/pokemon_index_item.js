import React from 'react';

const PokemonIndexItem = ({ pokemon }) => (
  <li>
    <span>{ pokemon.id }</span>
    <img src={ pokemon.image_url } height="20" width="20" />
    <span>{ pokemon.name }</span>
  </li>
);

export default PokemonIndexItem;