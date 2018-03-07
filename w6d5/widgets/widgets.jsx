import React from 'react';
import ReactDom from 'react-dom';

import Clock from './frontend/clock';

document.addEventListener('DOMContentLoaded', function () {
  ReactDom.render(<Clock />, document.getElementById('main'));
});