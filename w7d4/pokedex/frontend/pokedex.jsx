import React from 'react';
import ReactDOM from 'react-dom';

const Root = () => {
  return (
    <h1>Hello!</h1>
  );
};

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root />, rootEl);
});