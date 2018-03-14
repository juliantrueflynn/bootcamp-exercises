import { connect } from 'react-redux';
import { receiveStep, removeStep } from '../../actions/step_actions';
import { stepsByTodoId } from '../../reducers/selectors';

const mapStateToProps = state => ({
  steps: stepsByTodoId,
  todoId: 
});

const mapDispatchToProps = dispatch => ({
  receiveStep: step => dispatch(receiveStep(step)),
  removeStep: step => dispatch(removeStep(step))
});