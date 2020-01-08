import React from 'react'; 
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';
import { Link, Route } from 'react-router-dom';
import ExpansionPanelSummary from '@material-ui/core/ExpansionPanelSummary';
import ExpansionPanelDetails from '@material-ui/core/ExpansionPanelDetails';
import ExpansionPanel from '@material-ui/core/ExpansionPanel';
import QnAInsert from '../pages/QNAInsert';
import jwt_decode from 'jwt-decode';
// import QNA from '../pages/QNA';


class QNAS_row extends React.Component{

    constructor(props) {
        super(props);
        this.state = {
          insert:'',
          user_id: '',
        };
      }
   componentDidMount() {
    const token = localStorage.usertoken
    const decoded = jwt_decode(token)
    this.setState({
        user_id: decoded.user_id
    })
}

    QNADelete(QnA_id) {
        const url ='/api/QNAS/'+QnA_id;
        console.log(QnA_id)
        fetch(url, {
            method: 'DELETE'
        });
       this.props.stateRefresh();
    }
    win(){
        this.state.bind(this.props.QnA_id);
         window.open("/QnAInsert", "_blank",'height=600,width=400')
        }
    render(){
        // console.log(this.props.QnA_id)
        return(
            <div>
                <button onClick={this.win.bind(this.props.QnA_id)}>수정</button>
                <button onClick={(e) => {this.QNADelete(this.props.QnA_id)}}>삭제</button>
            </div>
        )
    
            }
}
export default QNAS_row; 