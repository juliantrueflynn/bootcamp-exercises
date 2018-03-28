import React from 'react';
import { Link } from 'react-router-dom';

class Greeting extends React.Component {
  constructor(props) {
    super(props);

    this.handleClickUserLogout = this.handleClickUserLogout.bind(this);
  }

  handleClickUserLogout(e) {
    e.preventDefault();
    this.props.logout();
  }

  render() {
    const { currentUser } = this.props;
    
    let greetingMsg;
    if (currentUser !== null) {
      greetingMsg = (
        <div>
          <span>Hello { currentUser.username }! </span>
          <button onClick={ this.handleClickUserLogout }>Logout</button>
        </div>
      );
    } else {
      greetingMsg = (
        <span>
          <Link to="/signup">Sign Up</Link> | <Link to="/login">Login</Link>
        </span>
      );
    }
    
    return (
      <div>
        { greetingMsg }
      </div>
    );
  }
}

export default Greeting;