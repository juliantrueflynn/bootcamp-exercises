import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      currentLoc: '',
    };
  }

  componentWillMount() {
    this.setState({
      currentLoc: navigator.geolocation.getCurrentPosition,
    });
  }

  render() {
    console.log(this.state.currentLoc);
    return (
      <div className="weather">
        <h2>Weather</h2>
        <div>
          {this.state.currentLoc}
        </div>
      </div>
    );
  }
}

export default Weather;