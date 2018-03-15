import { connect } from 'react-redux';
import { receiveStep, removeStep } from '../../actions/step_actions';
import { stepsByTodoId } from '../../reducers/selectors';
import StepList from './step_list';

const mapStateToProps = (state, { todoId }) => ({
  steps: stepsByTodoId,
  todoId
});

const mapDispatchToProps = dispatch => ({
  receiveStep: step => dispatch(receiveStep(step))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(StepList);