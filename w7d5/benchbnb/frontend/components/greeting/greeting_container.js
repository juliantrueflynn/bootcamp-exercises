import { connect } from 'react-redux';
import Greeting from './greeting';
import { signup, login, logout  } from '../../actions/session_actions';

const mapStateToProps = state => ({
  session: state.session,
  errors: state.errors,
});

const mapDispatchToProps = dispatch => ({
  signup: user => dispatch(signup(user)),
  login: user => dispatch(login(user)),
  logout: user => dispatch(logout(user))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Greeting);