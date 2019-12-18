import React,{ Component } from 'react';
import TicketListTable from 'components/TicketListTable';
import Table from '@material-ui/core/Table';
import TableHead from '@material-ui/core/TableHead';
import TableBody from '@material-ui/core/TableBody';
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';
import Container from '@material-ui/core/Container';
import { CircularProgress } from '@material-ui/core';
import SeatViewTable from 'components/SeatViewTable';
import RefundListTable from '../components/RefundListTable';




class TicketManagement extends Component{
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
        
        
        const filteredComponents1 = (data1) =>{
           data1 = data1.filter((c) => {
             return c.user_id.indexOf(this.state.searchKeyword) > -1;
            });
          return data1.map((c) => {
            return <TicketListTable stateRefresh={this.stateRefresh} name={c.name} user_id={c.user_id} show_title={c.show_title} show_time={c.show_time} key={c.key} ticketing_date={c.ticketing_date}/>
          })
        }
        const cellList = ["이름", "ID", "상영작", "시간대", "좌석번호", "예매일자"]
        
        const filteredComponents2 = (data2) =>{
          data2 = data2.filter((d) => {
            return d.user_id.indexOf(this.state.searchKeyword) > -1;
          });
         return data2.map((d) => {
           return <RefundListTable stateRefresh={this.stateRefresh} user_id={d.user_id} name={d.name} show_title={d.show_title} show_time={d.show_time} payment_type={d.payment_type} reason={d.reason_id} ticketing_id={d.ticketing_id} refund_flag={d.refund_flag} payment_type={d.payment_type} reason_type={d.reason_type}/>
         })
       }
       const cellList1 = ["ID", "이름", "상영작", "시간대", "예매번호", "환불유형", "사유"]

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
              {this.state.ticketings ? filteredComponents1(this.state.ticketings) :
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
          <form name="input" method="post" action="">
          <label class="change_seat_number"> 변경 좌석번호 : </label>
          <input type="text" class="change_seat_number_box" name="memberName" maxlength="10"/>
          <button onClick="">변경</button>
          <input type="reset" value="취소"></input>
          </form>
          <br/>
          <SeatViewTable/>
          <br/>
          </Container>
          <br/>
          <Container class="ticket_list_table">
            <Table >
            <TableHead>
              <TableRow>
                {cellList1.map(d => {
                  return <TableCell>{d}</TableCell>
                })}
              </TableRow>
            </TableHead>
            <TableBody>
              {this.state.ticketings ? filteredComponents2(this.state.ticketings) :
              <TableRow>
                <TableCell colSpan="7" align ="center">
                  <CircularProgress  variant="determinate" value={this.state.completed}/>
                </TableCell>
              </TableRow>
      }
            </TableBody>
          </Table>
          </Container>
          </div>
    );
};
}

export default TicketManagement;


