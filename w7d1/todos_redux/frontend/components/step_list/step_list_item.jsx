import React from 'react';

class StepListItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    console.log(this.props.receiveStep());
    return (
      <h1>Step Title: {this.props.title}</h1>
    );
  }
}

export default StepListItem;