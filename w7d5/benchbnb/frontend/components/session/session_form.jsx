import React from 'react';
import { connect } from 'react-redux';
import { Link, Redirect, withRouter } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      username: "",
      password: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleInputValue = this.handleInputValue.bind(this);
  }

  handleInputValue(e) {
    this.setState({ [e.target.name]: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, { user: this.state });
    this.props.processForm(user);
  }

  render() {
    const { loggedIn, formType, errors } = this.props;

    const redirectLoggedInUser = loggedIn ? <Redirect to="/" /> : "";

    let loginOrSignupLink;
    let loginOrSignupHeader;
    if (formType === '/login') {
      loginOrSignupHeader = <h2>Welcome back!</h2>
      loginOrSignupLink = (
        <span>No account? <Link to="/signup">Signup</Link></span>
      );
    } else {
      loginOrSignupHeader = <h2>Register now</h2>
      loginOrSignupLink = (
        <span>Already registered? <Link to="/login">Login</Link></span>
      )
    }
    
    const errorsLi = errors.map((err, i) => <li key={ i }>{ err }</li>);

    return (
      <div>
        { redirectLoggedInUser }
        { loginOrSignupHeader }
        
        <form onSubmit={ this.handleSubmit }>
          <ul>{ errorsLi }</ul>

          <input
            type="text"
            name="username"
            placeholder="Username"
            value={ this.state.username }
            onChange={ this.handleInputValue } /><br />
          <input
            type="password"
            name="password"
            placeholder="Password"
            value={ this.state.password }
            onChange={ this.handleInputValue } /><br />

          <button type="submit">Submit</button>

          <div>
            { loginOrSignupLink }
          </div>
        </form>
      </div>
    );
  }
}

export default withRouter(SessionForm);