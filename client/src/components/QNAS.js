import React from 'react'; 
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';
import QNAS_row from './QNAS_row';
import { Link, Route } from 'react-router-dom';
import ExpansionPanelSummary from '@material-ui/core/ExpansionPanelSummary';
import ExpansionPanelDetails from '@material-ui/core/ExpansionPanelDetails';
import ExpansionPanel from '@material-ui/core/ExpansionPanel';

// import QNA from '../pages/QNA';

class QNAS extends React.Component{
    render(){
        // console.log(this.props.QnA_id)
        return(
            <TableRow>
                
                <TableCell>{this.props.QnA_id}</TableCell>
                
                <ExpansionPanel>
                <ExpansionPanelSummary>
                <TableCell>{this.props.QnA_title}</TableCell>
                </ExpansionPanelSummary>
                <ExpansionPanelDetails>
                <TableCell>{this.props.user_id}</TableCell>
                <TableCell>{this.props.QnA_content}</TableCell>
                <TableCell><QNAS_row stateRefresh={this.props.stateRefresh} QnA_id={this.props.QnA_id}/></TableCell>
                </ExpansionPanelDetails>
                </ExpansionPanel>
                
                <TableCell>{this.props.QnA_views}</TableCell>
                <TableCell>{this.props.QnA_date}</TableCell>
                
            </TableRow>
        )
    
            }
}
export default QNAS; 