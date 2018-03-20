import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = ({ pokemon }) => (
  <li>
    <Link to={ `/pokemon/${ pokemon.id }` }>
      <span>{ pokemon.id }</span>
      <img src={ pokemon.image_url } height="20" width="20" />
      <span>{ pokemon.name }</span>
    </Link>
  </li>
);

export default PokemonIndexItem;