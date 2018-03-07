import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);

    const d = new Date();
    this.state = {
      time: d.toLocaleTimeString(),
      date: d.toDateString(),
    };

    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    this.tick();
  }

  tick() {
    setInterval(() => {
      const time = new Date().toLocaleTimeString();
      this.setState({time});
    }, 1000);
  }

  render() {
    const { time, date } = this.state;
    return (
      <div className="clock">
        <h2>Clock</h2>
        <div className="time">
          <span>Time: </span>
          <span>{time}</span>
        </div>
        <div className="date">
          <span>Date: </span>
          <span>{date}</span>
        </div>
      </div>
    );
  }
}

export default Clock;