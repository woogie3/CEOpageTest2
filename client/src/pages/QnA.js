import React, { Component } from 'react';
import QNAS from '../components/QNAS';
import HeaderMenu from '../components/HeaderMenu';
import Paper from '@material-ui/core/Paper';
import Table from '@material-ui/core/Table';
import TableHead from '@material-ui/core/TableHead';
import TableBody from '@material-ui/core/TableBody';
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';
import { Link } from 'react-router-dom';
import ExpansionPanel from '@material-ui/core/ExpansionPanel';
import ExpansionPanelSummary from '@material-ui/core/ExpansionPanelSummary';
import ExpansionPanelDetails from '@material-ui/core/ExpansionPanelDetails';
class QnA extends Component {
  constructor(props) {
    super(props);
    this.state = {
      QNAS: '',
      completed: 0
    }
    this.stateRefresh = this.stateRefresh.bind(this);
  }

  stateRefresh = () => {
    this.setState({
      QNAS: '',
      completed: 0
    });

    this.callApi()
      .then(res => this.setState({ QNAS: res }))
      .catch(err => console.log(err));
  }
  componentDidMount() {
    this.timer = setInterval(this.progress, 20);
    this.callApi()
      .then(res => this.setState({ QNAS: res }))
      .catch(err => console.log(err));
  }

  callApi = async () => {
    const response = await fetch('/api/QNAS');
    const body = await response.json();
    return body
  }
   
  progress = () => {
    const { completed } = this.state;
    this.setState({ completed: completed >= 100 ? 0 : completed + 1 });
  }
  handleValueChange = (e) => {
    let nextState = {}
    nextState[e.target.name] = e.target.value;
    this.setState(nextState);
  }
  handleClickOpen = () => {
    this.setState({
      open: true
    });

  }


  render() {
    // const { classes } = this.props;
    const cellList = ["글번호", "제목" , "조회수", "등록일"];

    return (
      <div>
        <HeaderMenu/>
        <Table >   
          <TableHead>
            <TableRow>
              {cellList.map(c => {
                return <TableCell align ="center">{c}</TableCell>
              })}
            </TableRow>
          </TableHead>
          <TableBody>        
              {this.state.QNAS ? this.state.QNAS.map(c => {
                return (    
                <QNAS stateRefresh={this.stateRefresh} key={c.QnA_id} QnA_id={c.QnA_id} QnA_title={c.QnA_title} user_id={c.user_id} QnA_content={c.QnA_content} QnA_date={c.QnA_date} QnA_views={c.QnA_views} />   
                 )}) : "no data"}
          </TableBody>
        </Table>
        {/* <button type="submit" onClick="QNAInsert"> 글쓰기</button> */}
        
        {/* <Button variant="contained" color="primary" onClick="./QnAInsert">글쓰기 </Button> */}
        {/* <Button variant="contained" color="black" onClick={(e) => {this.Change(this.props.user_id)}}>환불</Button> */}
      </div>
    )
  }
}
export default QnA;
