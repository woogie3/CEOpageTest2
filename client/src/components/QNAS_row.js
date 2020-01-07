import React from 'react'; 
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';
import { Link, Route } from 'react-router-dom';
import ExpansionPanelSummary from '@material-ui/core/ExpansionPanelSummary';
import ExpansionPanelDetails from '@material-ui/core/ExpansionPanelDetails';
import ExpansionPanel from '@material-ui/core/ExpansionPanel';

// import QNA from '../pages/QNA';

class QNAS extends React.Component{

    // handleClick =() =>{
        
    // }
   constructor(props) {
       super(props);
   }

    QNADelete(QnA_id) {
        const url ='/api/QNAS/'+QnA_id;
        console.log(QnA_id)
        fetch(url, {
            method: 'DELETE'
        });
       this.props.stateRefresh();
    }
    QNAUpdate(QnA_id) {
        const url = '/api/QNAS'+QnA_id;
        fetch(url);
        this.props.stateRefresh();
    }
    render(){
        // console.log(this.props.QnA_id)
        return(
            <div>
                <button onClick={(e) => {this.QNAUpdate(this.props.QnA_id)}}>답변</button>
            </div>
        )
    
            }
}
export default QNAS; 