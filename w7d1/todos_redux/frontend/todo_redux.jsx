import React from 'react';
import ReactDOM from 'react-dom';
import store from './store/store';

class Root extends React.Component {
  render() {
    return (
      <h1>Todos App</h1>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  window.store = store;
  ReactDOM.render(<Root />, document.getElementById('content'));
});