import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      selected: 0,
    };
  }

  click(key, event) {
    const selected = key;
    this.setState({selected});
  }

  render() {
    const panes = this.props.panes.map((pane, i) => {
      const isActive = this.state.selected === i ? "active" : "";
      
      return (
        <span key={i} className={isActive} onClick={this.click.bind(this, i)}>
          {pane.title}
        </span>
      );
    });

    return (
      <div>
        <h2>Tabs</h2>
        <div className="tabs">
          <div className="tab-header">
            {panes}
          </div>
          <div className="tab-content">
            {this.props.panes[this.state.selected].content}
          </div>
        </div>
      </div>
    );
  }
}

export default Tabs;