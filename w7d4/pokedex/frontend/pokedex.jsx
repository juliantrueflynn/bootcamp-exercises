import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

import itemsReducer from './reducers/items_reducer';
import { fetchSinglePokemon } from './util/api_util';
import { receiveSinglePokemon, requestSinglePokemon } from './actions/pokemon_actions';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();

  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.itemsReducer = itemsReducer;
  window.fetchSinglePokemon = fetchSinglePokemon;
  window.receiveSinglePokemon = receiveSinglePokemon;
  window.requestSinglePokemon = requestSinglePokemon;

  ReactDOM.render(<Root store={ store } />, rootEl);
});