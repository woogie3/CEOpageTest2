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
import { spacing } from '@material-ui/system';




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
        const cellList = ["이름", "ID", "상영작", "시간대", "좌석번호", "예매일자"]
        
        return (
          <div>
            
            <Container class="ticket_list_table">
            <Table >
            <TableHead>
              <TableRow>
                {cellList.map(c => {
                  return <TableCell>{c}</TableCell>
                })}
              </TableRow>
            </TableHead>
            <TableBody>
              {this.state.ticketings ? filteredComponents(this.state.ticketings) :
              <TableRow>
                <TableCell colSpan="6" align ="center">
                  <CircularProgress  variant="determinate" value={this.state.completed}/>
                </TableCell>
              </TableRow>
      }
            </TableBody>
          </Table>
          </Container>

          <Container class="ticket_change_box">
          <a><strong>예매 변경</strong></a>
          <br/>
          <label class="change_type">변경 유형 : </label>
          <select id="change_type_box">
            <option value="change_seat">좌석 변경</option>
            <option value="change_time">시간대 변경</option>
          </select>
          <label class="time_select"> 시간대 선택 : </label>
          <select id="change_time_box">
            <option value="1">10:00~12:00</option>
            <option value="2">13:00~14:00</option>
            <option value="3">15:00~17:00</option>
            <option value="4">18:00~20:00</option>
          </select>
          <label class="change_seat_number"> 변경 좌석번호 : </label>
          <input type="text" class="change_seat_number_box" value="test"/>
          <button onClick="">변경</button>
          <button type="reset">취소</button>
          <br/>
          <SeatViewTable/>
          <br/>
          </Container>
          </div>
    );
};
}

export default Management;


