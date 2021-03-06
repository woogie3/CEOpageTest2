import React from 'react';
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';
import ExpansionPanelSummary from '@material-ui/core/ExpansionPanelSummary';
import ExpansionPanelDetails from '@material-ui/core/ExpansionPanelDetails';
import ExpansionPanel from '@material-ui/core/ExpansionPanel';
import { withStyles } from "@material-ui/core/styles";
import { Link, Route, withRouter } from 'react-router-dom';
import QNAUpdate from '../pages/QNAUpdate';
import QNAInsert from '../pages/QNAInsert';
import jwt_decode from 'jwt-decode';

const styles = theme => ({
    expansion: {
        width: "100%",
        background: 'transparent',
        boxShadow: 'none',
        color: 'white'
      },
      QnA_title :{
          border:'none'
      },
      QnA_detail:{
          border_top: '1px solid silver'
      }
})

class QNAS extends React.Component {
    constructor(props) {
        super(props);
        console.log(this.props);
        
        this.state={
            user_id: '',
            QnA_id: ''
        };
    }
    
    QNADelete(QnA_id) {
        const url = '/api/QNAS/'+ QnA_id;
        console.log(QnA_id);
        fetch(url, {
            method: 'DELETE'
        });
        this.props.stateRefresh();
    }
    componentDidMount() {
        const token = localStorage.usertoken
        const decoded = jwt_decode(token)
        this.setState({
            user_id: decoded.user_id,
            QnA_id:this.props.QnA_id

        })
    }
    render() {
        const { classes } = this.props;
        let button;
        if(this.props.order == 0 ){
           button = <div> 
               <button className="btn btn-dark" ><Link to={{pathname:"/QNAInsert",state:{id:this.state.QnA_id}}}>답글작성</Link></button>
               </div>
        }else{
            button =  <div>
                <button className="btn btn-dark" ><Link to={`/QNAUpdate/${this.props.QnA_id}` }>수정</Link></button>
               <button className="btn btn-dark"  onClick={(e) => { this.QNADelete(this.props.QnA_id)}}>삭제</button>
            </div>
        }

        return (
          
            <React.Fragment>
                <TableRow classes={{root: classes.QnA_detail}}>
                    <TableCell>{this.props.QnA_id}</TableCell>
                    <ExpansionPanel classes={{ root: classes.expansion}} >
                    {/* <ExpansionPanel > */}
                        <ExpansionPanelSummary>
                            <TableCell classes={{ root: classes.QnA_title }}>{this.props.QnA_title}</TableCell>
                        </ExpansionPanelSummary>
                        <ExpansionPanelDetails >
                            <TableCell>{this.props.QnA_content}</TableCell>
                            <TableCell>{button}</TableCell>
                        </ExpansionPanelDetails>
                    </ExpansionPanel>
                    
                    <TableCell>{this.props.QnA_date}</TableCell>
                    {/* <TableCell>{this.props.QnA_views}</TableCell> */}
                    <TableCell>{this.props.user_id}</TableCell>
                </TableRow>
                <Route path ="/QNAInsert/:QnA_id" component={QNAInsert}></Route>
                <Route path ="/QNAUpdate/:QnA_id" component={QNAUpdate}></Route>
            </React.Fragment>
        )

    }
}
export default withStyles(styles)(withRouter(QNAS)); 
// export default withStyles(styles) (QNAS); 
// export default QNAS; 