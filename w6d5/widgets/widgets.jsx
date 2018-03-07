import React from 'react';
import ReactDom from 'react-dom';

import Clock from './frontend/clock';
import Tabs from './frontend/tabs';
import Weather from './frontend/weather';
import Autocomplete from './frontend/autocomplete';

class Root extends React.Component {
  render() {
    const panes = [
      {title: "Tab 1", content: "Tab 1 content here."},
      {title: "Tab 2", content: "Tab 2 content here."},
      {title: "Tab 3", content: "Tab 3 content here."}
    ];

    const names = [
      'Barbara',
      'Fred',
      'Henry',
      'Samantha',
      'Jacob',
      'Max',
      'Lauren',
      'Frank',
      'Bill',
      'Joel',
      'Rico',
      'Jackie',
      'Lisa'
    ];

    return (
      <div>
        <Clock />
        <Tabs panes={panes} />
        <Autocomplete names={names} />
        <Weather />
      </div>
    );
  }
}

document.addEventListener('DOMContentLoaded', function () {
  ReactDom.render(<Root />, document.getElementById('main'));
});