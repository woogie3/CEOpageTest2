import React,{ Component } from 'react';
import TicketListTable from 'components/TicketListTable';
import Table from '@material-ui/core/Table';
import TableHead from '@material-ui/core/TableHead';
import TableBody from '@material-ui/core/TableBody';
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';
import Button from '@material-ui/core/Button';
import MenuItem from '@material-ui/core/MenuItem';
import Container from '@material-ui/core/Container';
import TextField from '@material-ui/core/TextField';
import { CircularProgress } from '@material-ui/core';
import SeatViewTable from 'components/SeatViewTable';
import Select from '@material-ui/core/Select';
import InputLabel from '@material-ui/core/InputLabel';




class Management extends Component{
        constructor(props) {
        super(props);
        this.state = {
          ticketings:'',
          completed:0,
          searchKeyword:''
        }
        this.stateRefresh = this.stateRefresh.bind(this);
      }
    
      stateRefresh = () => {
        this.setState({
          ticketings:'',
          completed:0,
          searchKeyword:''
      });
        this.callApi()
        .then(res => this.setState({ticketings: res}))
        .catch(err => console.log(err));
      }
    
      componentDidMount(){
        this.timer = setInterval(this.progress, 20);
        this.callApi()
        .then(res => this.setState({ticketings: res}))
        .catch(err => console.log(err));
      }
    
      callApi = async() => {
        const response = await fetch('/api/ticketings');
        const body = await response.json();
        return body;
      }
    
      progress = () => {
        const {completed} = this.state;
        this.setState({completed: completed >= 100 ? 0 : completed +1});
      };
    
      handleValueChange =(e) =>{
        let nextState = {}
        nextState[e.target.name] = e.target.value;
        this.setState(nextState);
      }
    
      render(){
        const filteredComponents = (data) =>{
           data = data.filter((c) => {
             return c.user_id.indexOf(this.state.searchKeyword) > -1;
           });
          return data.map((c) => {
            return <TicketListTable stateRefresh={this.stateRefresh} ticketing_id={c.ticketing_id} show_id={c.show_id} user_id={c.user_id} show_check_id={c.show_check_id} reason_id={c.reason_id} show_date_id={c.show_date_id} price={c.price} ticketing_date={c.ticketing_date} refund_flag={c.refund_flag} payment_type={c.payment_type} refund_date={c.refund_date} refund_apply_date={c.refund_apply_date}/>
          })
        }
        const cellList = ["선택", "이름", "ID", "상영작", "시간대", "좌석번호", "예매일자"]

    
    return (
        
          <div>
           <TextField id="outlined-basic" label="전화번호 : " variant="전화번호" /> <TextField id="outlined-basic" label="예매 번호 : " variant="예매 번호" /><Button onClick="">검색</Button>
            <Table >
            <TableHead>
              <TableRow>
                {cellList.map(c => {
                  return <TableCell>{c}</TableCell>
                })}
              </TableRow>
            </TableHead>
            <TableBody>
              {/* {this.state.ticketings } */}
              {this.state.ticketings ? filteredComponents(this.state.ticketings) :
              <TableRow>
                <TableCell colSpan="7" align ="center">
                  <CircularProgress  variant="determinate" value={this.state.completed}/>
                </TableCell>
              </TableRow>
      }
            </TableBody>
          </Table>
          <br/>
          
          
          <Container>
            {/* <label variant="유형 : "/> */}
            <InputLabel id="label">변경 유형 : </InputLabel>
            <Select>
              <MenuItem >좌석 변경</MenuItem>
              <MenuItem>시간대 변경</MenuItem>
            </Select>
           
              {/* <label variant="시간대 선택"/> */}
              <InputLabel id="label">시간대 선택 : </InputLabel>
              <Select>
                <MenuItem>10:00~12:00</MenuItem>
                <MenuItem>13:00~15:00</MenuItem>
                <MenuItem>16:00~18:00</MenuItem>
                <MenuItem>19:00~21:00</MenuItem>
              </Select>
            
            
              <TextField id="outlined-basic" label="변경 좌석번호 : " variant="변경 번호" />
              <Button onClick="">변경</Button>
              <Button type="reset">취소</Button>
          
          <br/>
          <SeatViewTable/>
          </Container>
          </div>
    );
};
}

export default Management;
