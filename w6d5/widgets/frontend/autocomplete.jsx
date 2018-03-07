import React from 'react';

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);

    this.state = { inputVal: '' };

    this.handleFilterNameChange = this.handleFilterNameChange.bind(this);
  }

  handleFilterNameChange(event) {
    const inputVal = event.target.value;
    this.setState({ inputVal });
  }

  handleFilterNameClick(i, event) {
    const inputVal = this.props.names[i];
    this.setState({ inputVal });
  }

  render() {
    const { inputVal } = this.state;
    let filteredNames = [];
    const names = this.props.names.forEach((name, i) => {
      if (inputVal === '' || name.indexOf(inputVal) !== -1) {
        filteredNames.push(
          <li key={name + i} onClick={this.handleFilterNameClick.bind(this, i)}>
            {name}
          </li>
        );
      }
    });
    
    return (
      <div class="autocomplete">
        <h2>Autocomplete</h2>
        
        <div className="autocomplete-body">
          <input
            type="text"
            onChange={this.handleFilterNameChange}
            className="search-input"
            value={inputVal}
            placeholder="Search names..."
          />
          <ul className="search-ul">
            {filteredNames}
          </ul>
        </div>
      </div>
    );
  }
}

export default Autocomplete;