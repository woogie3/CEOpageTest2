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
            <TableRow>
                <ExpansionPanel>
                <ExpansionPanelSummary>
                {/* <TableCell>{this.props.QnA_id}</TableCell>
                <TableCell onClick={this.handleClick}> */}
                    {/* <Link to = {`/QNADetail/${this.props.QnA_id}/${this.props.QnA_title}`}>{this.props.QnA_title}</Link></TableCell> */}
                <TableRow><TableCell>{this.props.QnA_id}</TableCell></TableRow>
                <TableRow><TableCell>{this.props.QnA_title}</TableCell></TableRow>
                <TableRow><TableCell>{this.props.QnA_date}</TableCell></TableRow>
                <TableRow><TableCell>{this.props.QnA_views}</TableCell></TableRow>
                <TableRow><TableCell>{this.props.user_id}</TableCell></TableRow>
                </ExpansionPanelSummary>
                <ExpansionPanelDetails>
                <TableRow><TableCell>{this.props.QnA_content}</TableCell></TableRow>
                <button onClick={(e) => {this.QNAUpdate(this.props.QnA_id)}}>수정</button>
                <button onClick={(e) => {this.QNADelete(this.props.QnA_id)}}>삭제</button>
                </ExpansionPanelDetails>
                {/* <TableCell>{this.props.group_number}</TableCell>
                <TableCell>{this.props.order}</TableCell>
                <TableCell>{this.props.depth}</TableCell> */}
                </ExpansionPanel>
            </TableRow>
            {/* <Route path ="/QNADetail/:QnA_id/:QnA_title" component={QNADetail}></Route> */}
            </div>
        )
    
            }
}
export default QNAS; 