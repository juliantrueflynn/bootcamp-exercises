import React from 'react';
import ReactDOM from 'react-dom';
import store from './store/store';
import Root from './components/root';

import { allTodos } from './reducers/selectors';

document.addEventListener('DOMContentLoaded', () => {
  window.store = store;
  window.allTodos = allTodos;
  ReactDOM.render(<Root store={ store } />, document.getElementById('content'));
});