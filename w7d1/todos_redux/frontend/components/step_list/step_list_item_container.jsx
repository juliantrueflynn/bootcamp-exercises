import { connect } from 'react-redux';
import { receiveStep, removeStep } from '../../actions/step_actions';
import StepListItem from './step_list_item';

const mapDispatchToProps = (dispatch, { step }) => ({
  removeStep: () => dispatch(removeStep(step)),
  receiveStep: step2 => dispatch(receiveStep(step2))
});

export default connect(null, mapDispatchToProps)(StepListItem);